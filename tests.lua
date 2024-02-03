--dofile("sunrise-sunset.lua")
dofile("time-schedule.lua")

-- For testing purposes
local times = { 
    os.time({ year=2024, month=01, day=29, hour=00, min=30, sec=00 }),
    os.time({ year=2024, month=01, day=29, hour=06, min=30, sec=00 }),
    os.time({ year=2024, month=01, day=29, hour=10, min=00, sec=00 }),
    os.time({ year=2024, month=01, day=29, hour=16, min=00, sec=00 }),
    os.time({ year=2024, month=01, day=29, hour=20, min=00, sec=00 }),
    os.time({ year=2024, month=01, day=29, hour=23, min=10, sec=00 })
}

for i, time in ipairs(times) do
    print("Should be on: %s", shouldBeOn(time))
end
