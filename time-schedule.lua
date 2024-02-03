----------------------------------------------------------------------------
-- Uses fixed time intervals to turn a device on or off.
----------------------------------------------------------------------------

-- Define name of the device here to turn on/off
local deviceName = "EnterDeviceNameHere"

-- Define time intervals here (hour, minute, on/off).
-- Times are UTC and schedule assumes times are increasing, i.e. the first
-- time should appear first in the list, then the second, etc.
local intervals = {
    { hour=06, min=00, on=true },
    { hour=08, min=00, on=false },
    { hour=16, min=00, on=true },
    { hour=22, min=00, on=false }
}

----------------------------------------------------------------------------

local deviceIsOn = false
local sleepTimeMs = 60*1000;
local scriptName = "time-schedule.lua"
local deviceManager = require "telldus.DeviceManager"

function shouldBeOn(currentTime)
    print("Time is %s (UTC)", os.date("%X", currentTime))
    local dateComponents = os.date("*t", currentTime)
    local match = intervals[1]
    for i, interval in ipairs(intervals) do 
        local intervalTime = os.time({ year=dateComponents.year, month=dateComponents.month, day=dateComponents.day, hour=interval.hour, min=interval.min, sec=00 })
        if intervalTime > currentTime then
            if i == 1 then
                -- We are before the first interval, return the last interval.
                -- For example, time is 04:00 but first entry is at 06:00. We then return the entry from the evening before, such as 22:00.
                match = intervals[#intervals];
            end
            break;
        else 
            match = interval
        end
    end

    print("Found interval, returning: %02d:%02d (on: %s)", match.hour, match.min, match.on)
    return match.on
end

function onInit()
    print("Starting.")
    local device = deviceManager:findByName(deviceName)
    if device == nil then
        print("Could not find the device %s", device)
        return
    end
    deviceIsOn = device:state() == 1
    print("Device %s is on: %s", deviceName, deviceIsOn)

    while true do
        local deviceShouldBeOn = shouldBeOn(os.time())
        if deviceShouldBeOn ~= deviceIsOn then
            if deviceShouldBeOn then
                print("Turning on %s...", deviceName)
                device:command("turnon", nil, scriptName)
            else 
                print("Turning off %s...", deviceName)
                device:command("turnoff", nil, scriptName)
            end
            deviceIsOn = deviceShouldBeOn
        else 
            print("Device %s is already in state %s, doing nothing.", deviceName, deviceIsOn)
        end

        print("Sleeping %s ms", sleepTimeMs)
        sleep(sleepTimeMs)
    end
end
