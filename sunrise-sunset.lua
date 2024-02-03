----------------------------------------------------------------------------
-- Uses a fixed list of sunrise and sunset times to turn a device on or off.
----------------------------------------------------------------------------

-- Define name of the device here to turn on/off.
-- Find the `intervals` variable below to define the schedule.
local deviceName = "EnterDeviceNameHere"

--rough times for sunrise and sunset
--https://aa.usno.navy.mil/calculated/rstt/year?ID=AA&year=2022&task=0&lat=59.2831&lon=17.904&label=here&tz=0.00&tz_sign=-1&submit=Get+Data
local sun = {
    { sunrise={ hour=7, min=44 }, sunset={ hour=14, min=00 } },
    { sunrise={ hour=7, min=44 }, sunset={ hour=14, min=01 } },
    { sunrise={ hour=7, min=43 }, sunset={ hour=14, min=03 } },
    { sunrise={ hour=7, min=43 }, sunset={ hour=14, min=04 } },
    { sunrise={ hour=7, min=42 }, sunset={ hour=14, min=06 } },
    { sunrise={ hour=7, min=41 }, sunset={ hour=14, min=08 } },
    { sunrise={ hour=7, min=40 }, sunset={ hour=14, min=09 } },
    { sunrise={ hour=7, min=39 }, sunset={ hour=14, min=11 } },
    { sunrise={ hour=7, min=38 }, sunset={ hour=14, min=13 } },
    { sunrise={ hour=7, min=37 }, sunset={ hour=14, min=15 } },
    { sunrise={ hour=7, min=36 }, sunset={ hour=14, min=17 } },
    { sunrise={ hour=7, min=35 }, sunset={ hour=14, min=19 } },
    { sunrise={ hour=7, min=34 }, sunset={ hour=14, min=21 } },
    { sunrise={ hour=7, min=32 }, sunset={ hour=14, min=23 } },
    { sunrise={ hour=7, min=31 }, sunset={ hour=14, min=25 } },
    { sunrise={ hour=7, min=29 }, sunset={ hour=14, min=28 } },
    { sunrise={ hour=7, min=28 }, sunset={ hour=14, min=30 } },
    { sunrise={ hour=7, min=26 }, sunset={ hour=14, min=32 } },
    { sunrise={ hour=7, min=24 }, sunset={ hour=14, min=34 } },
    { sunrise={ hour=7, min=23 }, sunset={ hour=14, min=37 } },
    { sunrise={ hour=7, min=21 }, sunset={ hour=14, min=39 } },
    { sunrise={ hour=7, min=19 }, sunset={ hour=14, min=41 } },
    { sunrise={ hour=7, min=17 }, sunset={ hour=14, min=44 } },
    { sunrise={ hour=7, min=15 }, sunset={ hour=14, min=46 } },
    { sunrise={ hour=7, min=13 }, sunset={ hour=14, min=49 } },
    { sunrise={ hour=7, min=11 }, sunset={ hour=14, min=51 } },
    { sunrise={ hour=7, min=09 }, sunset={ hour=14, min=54 } },
    { sunrise={ hour=7, min=07 }, sunset={ hour=14, min=56 } },
    { sunrise={ hour=7, min=05 }, sunset={ hour=14, min=59 } },
    { sunrise={ hour=7, min=03 }, sunset={ hour=15, min=01 } },
    { sunrise={ hour=7, min=01 }, sunset={ hour=15, min=04 } },
    { sunrise={ hour=6, min=59 }, sunset={ hour=15, min=06 } },
    { sunrise={ hour=6, min=56 }, sunset={ hour=15, min=09 } },
    { sunrise={ hour=6, min=54 }, sunset={ hour=15, min=11 } },
    { sunrise={ hour=6, min=52 }, sunset={ hour=15, min=14 } },
    { sunrise={ hour=6, min=49 }, sunset={ hour=15, min=16 } },
    { sunrise={ hour=6, min=47 }, sunset={ hour=15, min=19 } },
    { sunrise={ hour=6, min=45 }, sunset={ hour=15, min=21 } },
    { sunrise={ hour=6, min=42 }, sunset={ hour=15, min=24 } },
    { sunrise={ hour=6, min=40 }, sunset={ hour=15, min=26 } },
    { sunrise={ hour=6, min=37 }, sunset={ hour=15, min=29 } },
    { sunrise={ hour=6, min=35 }, sunset={ hour=15, min=32 } },
    { sunrise={ hour=6, min=32 }, sunset={ hour=15, min=34 } },
    { sunrise={ hour=6, min=29 }, sunset={ hour=15, min=37 } },
    { sunrise={ hour=6, min=27 }, sunset={ hour=15, min=39 } },
    { sunrise={ hour=6, min=24 }, sunset={ hour=15, min=42 } },
    { sunrise={ hour=6, min=22 }, sunset={ hour=15, min=44 } },
    { sunrise={ hour=6, min=19 }, sunset={ hour=15, min=47 } },
    { sunrise={ hour=6, min=16 }, sunset={ hour=15, min=49 } },
    { sunrise={ hour=6, min=14 }, sunset={ hour=15, min=52 } },
    { sunrise={ hour=6, min=11 }, sunset={ hour=15, min=54 } },
    { sunrise={ hour=6, min=08 }, sunset={ hour=15, min=57 } },
    { sunrise={ hour=6, min=05 }, sunset={ hour=15, min=59 } },
    { sunrise={ hour=6, min=03 }, sunset={ hour=16, min=02 } },
    { sunrise={ hour=6, min=00 }, sunset={ hour=16, min=04 } },
    { sunrise={ hour=5, min=57 }, sunset={ hour=16, min=07 } },
    { sunrise={ hour=5, min=54 }, sunset={ hour=16, min=09 } },
    { sunrise={ hour=5, min=52 }, sunset={ hour=16, min=12 } },
    { sunrise={ hour=5, min=49 }, sunset={ hour=16, min=14 } },
    { sunrise={ hour=5, min=46 }, sunset={ hour=16, min=17 } },
    { sunrise={ hour=5, min=43 }, sunset={ hour=16, min=19 } },
    { sunrise={ hour=5, min=40 }, sunset={ hour=16, min=22 } },
    { sunrise={ hour=5, min=37 }, sunset={ hour=16, min=24 } },
    { sunrise={ hour=5, min=34 }, sunset={ hour=16, min=27 } },
    { sunrise={ hour=5, min=32 }, sunset={ hour=16, min=29 } },
    { sunrise={ hour=5, min=29 }, sunset={ hour=16, min=31 } },
    { sunrise={ hour=5, min=26 }, sunset={ hour=16, min=34 } },
    { sunrise={ hour=5, min=23 }, sunset={ hour=16, min=36 } },
    { sunrise={ hour=5, min=20 }, sunset={ hour=16, min=39 } },
    { sunrise={ hour=5, min=17 }, sunset={ hour=16, min=41 } },
    { sunrise={ hour=5, min=14 }, sunset={ hour=16, min=43 } },
    { sunrise={ hour=5, min=11 }, sunset={ hour=16, min=46 } },
    { sunrise={ hour=5, min=08 }, sunset={ hour=16, min=48 } },
    { sunrise={ hour=5, min=05 }, sunset={ hour=16, min=51 } },
    { sunrise={ hour=5, min=02 }, sunset={ hour=16, min=53 } },
    { sunrise={ hour=4, min=59 }, sunset={ hour=16, min=55 } },
    { sunrise={ hour=4, min=57 }, sunset={ hour=16, min=58 } },
    { sunrise={ hour=4, min=54 }, sunset={ hour=17, min=00 } },
    { sunrise={ hour=4, min=51 }, sunset={ hour=17, min=02 } },
    { sunrise={ hour=4, min=48 }, sunset={ hour=17, min=05 } },
    { sunrise={ hour=4, min=45 }, sunset={ hour=17, min=07 } },
    { sunrise={ hour=4, min=42 }, sunset={ hour=17, min=10 } },
    { sunrise={ hour=4, min=39 }, sunset={ hour=17, min=12 } },
    { sunrise={ hour=4, min=36 }, sunset={ hour=17, min=14 } },
    { sunrise={ hour=4, min=33 }, sunset={ hour=17, min=17 } },
    { sunrise={ hour=4, min=30 }, sunset={ hour=17, min=19 } },
    { sunrise={ hour=4, min=27 }, sunset={ hour=17, min=21 } },
    { sunrise={ hour=4, min=24 }, sunset={ hour=17, min=24 } },
    { sunrise={ hour=4, min=21 }, sunset={ hour=17, min=26 } },
    { sunrise={ hour=4, min=18 }, sunset={ hour=17, min=28 } },
    { sunrise={ hour=4, min=15 }, sunset={ hour=17, min=31 } },
    { sunrise={ hour=4, min=12 }, sunset={ hour=17, min=33 } },
    { sunrise={ hour=4, min=09 }, sunset={ hour=17, min=36 } },
    { sunrise={ hour=4, min=06 }, sunset={ hour=17, min=38 } },
    { sunrise={ hour=4, min=03 }, sunset={ hour=17, min=40 } },
    { sunrise={ hour=4, min=01 }, sunset={ hour=17, min=43 } },
    { sunrise={ hour=3, min=58 }, sunset={ hour=17, min=45 } },
    { sunrise={ hour=3, min=55 }, sunset={ hour=17, min=47 } },
    { sunrise={ hour=3, min=52 }, sunset={ hour=17, min=50 } },
    { sunrise={ hour=3, min=49 }, sunset={ hour=17, min=52 } },
    { sunrise={ hour=3, min=46 }, sunset={ hour=17, min=55 } },
    { sunrise={ hour=3, min=43 }, sunset={ hour=17, min=57 } },
    { sunrise={ hour=3, min=40 }, sunset={ hour=17, min=59 } },
    { sunrise={ hour=3, min=37 }, sunset={ hour=18, min=02 } },
    { sunrise={ hour=3, min=34 }, sunset={ hour=18, min=04 } },
    { sunrise={ hour=3, min=32 }, sunset={ hour=18, min=06 } },
    { sunrise={ hour=3, min=29 }, sunset={ hour=18, min=09 } },
    { sunrise={ hour=3, min=26 }, sunset={ hour=18, min=11 } },
    { sunrise={ hour=3, min=23 }, sunset={ hour=18, min=14 } },
    { sunrise={ hour=3, min=20 }, sunset={ hour=18, min=16 } },
    { sunrise={ hour=3, min=18 }, sunset={ hour=18, min=18 } },
    { sunrise={ hour=3, min=15 }, sunset={ hour=18, min=21 } },
    { sunrise={ hour=3, min=12 }, sunset={ hour=18, min=23 } },
    { sunrise={ hour=3, min=09 }, sunset={ hour=18, min=26 } },
    { sunrise={ hour=3, min=06 }, sunset={ hour=18, min=28 } },
    { sunrise={ hour=3, min=04 }, sunset={ hour=18, min=30 } },
    { sunrise={ hour=3, min=01 }, sunset={ hour=18, min=33 } },
    { sunrise={ hour=2, min=58 }, sunset={ hour=18, min=35 } },
    { sunrise={ hour=2, min=56 }, sunset={ hour=18, min=38 } },
    { sunrise={ hour=2, min=53 }, sunset={ hour=18, min=40 } },
    { sunrise={ hour=2, min=50 }, sunset={ hour=18, min=42 } },
    { sunrise={ hour=2, min=48 }, sunset={ hour=18, min=45 } },
    { sunrise={ hour=2, min=45 }, sunset={ hour=18, min=47 } },
    { sunrise={ hour=2, min=43 }, sunset={ hour=18, min=49 } },
    { sunrise={ hour=2, min=40 }, sunset={ hour=18, min=52 } },
    { sunrise={ hour=2, min=38 }, sunset={ hour=18, min=54 } },
    { sunrise={ hour=2, min=35 }, sunset={ hour=18, min=57 } },
    { sunrise={ hour=2, min=33 }, sunset={ hour=18, min=59 } },
    { sunrise={ hour=2, min=30 }, sunset={ hour=19, min=01 } },
    { sunrise={ hour=2, min=28 }, sunset={ hour=19, min=04 } },
    { sunrise={ hour=2, min=25 }, sunset={ hour=19, min=06 } },
    { sunrise={ hour=2, min=23 }, sunset={ hour=19, min=08 } },
    { sunrise={ hour=2, min=21 }, sunset={ hour=19, min=10 } },
    { sunrise={ hour=2, min=18 }, sunset={ hour=19, min=13 } },
    { sunrise={ hour=2, min=16 }, sunset={ hour=19, min=15 } },
    { sunrise={ hour=2, min=14 }, sunset={ hour=19, min=17 } },
    { sunrise={ hour=2, min=12 }, sunset={ hour=19, min=19 } },
    { sunrise={ hour=2, min=10 }, sunset={ hour=19, min=22 } },
    { sunrise={ hour=2, min=08 }, sunset={ hour=19, min=24 } },
    { sunrise={ hour=2, min=05 }, sunset={ hour=19, min=26 } },
    { sunrise={ hour=2, min=03 }, sunset={ hour=19, min=28 } },
    { sunrise={ hour=2, min=02 }, sunset={ hour=19, min=30 } },
    { sunrise={ hour=2, min=00 }, sunset={ hour=19, min=32 } },
    { sunrise={ hour=1, min=58 }, sunset={ hour=19, min=34 } },
    { sunrise={ hour=1, min=56 }, sunset={ hour=19, min=36 } },
    { sunrise={ hour=1, min=54 }, sunset={ hour=19, min=38 } },
    { sunrise={ hour=1, min=52 }, sunset={ hour=19, min=40 } },
    { sunrise={ hour=1, min=51 }, sunset={ hour=19, min=42 } },
    { sunrise={ hour=1, min=49 }, sunset={ hour=19, min=44 } },
    { sunrise={ hour=1, min=48 }, sunset={ hour=19, min=46 } },
    { sunrise={ hour=1, min=46 }, sunset={ hour=19, min=47 } },
    { sunrise={ hour=1, min=45 }, sunset={ hour=19, min=49 } },
    { sunrise={ hour=1, min=43 }, sunset={ hour=19, min=51 } },
    { sunrise={ hour=1, min=42 }, sunset={ hour=19, min=52 } },
    { sunrise={ hour=1, min=41 }, sunset={ hour=19, min=54 } },
    { sunrise={ hour=1, min=40 }, sunset={ hour=19, min=55 } },
    { sunrise={ hour=1, min=39 }, sunset={ hour=19, min=56 } },
    { sunrise={ hour=1, min=38 }, sunset={ hour=19, min=58 } },
    { sunrise={ hour=1, min=37 }, sunset={ hour=19, min=59 } },
    { sunrise={ hour=1, min=36 }, sunset={ hour=20, min=00 } },
    { sunrise={ hour=1, min=35 }, sunset={ hour=20, min=01 } },
    { sunrise={ hour=1, min=35 }, sunset={ hour=20, min=02 } },
    { sunrise={ hour=1, min=34 }, sunset={ hour=20, min=03 } },
    { sunrise={ hour=1, min=33 }, sunset={ hour=20, min=04 } },
    { sunrise={ hour=1, min=33 }, sunset={ hour=20, min=05 } },
    { sunrise={ hour=1, min=33 }, sunset={ hour=20, min=06 } },
    { sunrise={ hour=1, min=32 }, sunset={ hour=20, min=06 } },
    { sunrise={ hour=1, min=32 }, sunset={ hour=20, min=07 } },
    { sunrise={ hour=1, min=32 }, sunset={ hour=20, min=07 } },
    { sunrise={ hour=1, min=32 }, sunset={ hour=20, min=08 } },
    { sunrise={ hour=1, min=32 }, sunset={ hour=20, min=08 } },
    { sunrise={ hour=1, min=32 }, sunset={ hour=20, min=08 } },
    { sunrise={ hour=1, min=32 }, sunset={ hour=20, min=08 } },
    { sunrise={ hour=1, min=33 }, sunset={ hour=20, min=08 } },
    { sunrise={ hour=1, min=33 }, sunset={ hour=20, min=08 } },
    { sunrise={ hour=1, min=34 }, sunset={ hour=20, min=08 } },
    { sunrise={ hour=1, min=34 }, sunset={ hour=20, min=08 } },
    { sunrise={ hour=1, min=35 }, sunset={ hour=20, min=08 } },
    { sunrise={ hour=1, min=36 }, sunset={ hour=20, min=07 } },
    { sunrise={ hour=1, min=36 }, sunset={ hour=20, min=07 } },
    { sunrise={ hour=1, min=37 }, sunset={ hour=20, min=06 } },
    { sunrise={ hour=1, min=38 }, sunset={ hour=20, min=06 } },
    { sunrise={ hour=1, min=39 }, sunset={ hour=20, min=05 } },
    { sunrise={ hour=1, min=40 }, sunset={ hour=20, min=04 } },
    { sunrise={ hour=1, min=42 }, sunset={ hour=20, min=03 } },
    { sunrise={ hour=1, min=43 }, sunset={ hour=20, min=02 } },
    { sunrise={ hour=1, min=44 }, sunset={ hour=20, min=01 } },
    { sunrise={ hour=1, min=45 }, sunset={ hour=20, min=00 } },
    { sunrise={ hour=1, min=47 }, sunset={ hour=19, min=59 } },
    { sunrise={ hour=1, min=48 }, sunset={ hour=19, min=58 } },
    { sunrise={ hour=1, min=50 }, sunset={ hour=19, min=57 } },
    { sunrise={ hour=1, min=52 }, sunset={ hour=19, min=55 } },
    { sunrise={ hour=1, min=53 }, sunset={ hour=19, min=54 } },
    { sunrise={ hour=1, min=55 }, sunset={ hour=19, min=52 } },
    { sunrise={ hour=1, min=57 }, sunset={ hour=19, min=51 } },
    { sunrise={ hour=1, min=58 }, sunset={ hour=19, min=49 } },
    { sunrise={ hour=2, min=00 }, sunset={ hour=19, min=48 } },
    { sunrise={ hour=2, min=02 }, sunset={ hour=19, min=46 } },
    { sunrise={ hour=2, min=04 }, sunset={ hour=19, min=44 } },
    { sunrise={ hour=2, min=06 }, sunset={ hour=19, min=42 } },
    { sunrise={ hour=2, min=08 }, sunset={ hour=19, min=40 } },
    { sunrise={ hour=2, min=10 }, sunset={ hour=19, min=38 } },
    { sunrise={ hour=2, min=12 }, sunset={ hour=19, min=36 } },
    { sunrise={ hour=2, min=14 }, sunset={ hour=19, min=34 } },
    { sunrise={ hour=2, min=16 }, sunset={ hour=19, min=32 } },
    { sunrise={ hour=2, min=18 }, sunset={ hour=19, min=30 } },
    { sunrise={ hour=2, min=20 }, sunset={ hour=19, min=28 } },
    { sunrise={ hour=2, min=23 }, sunset={ hour=19, min=26 } },
    { sunrise={ hour=2, min=25 }, sunset={ hour=19, min=24 } },
    { sunrise={ hour=2, min=27 }, sunset={ hour=19, min=21 } },
    { sunrise={ hour=2, min=29 }, sunset={ hour=19, min=19 } },
    { sunrise={ hour=2, min=31 }, sunset={ hour=19, min=17 } },
    { sunrise={ hour=2, min=34 }, sunset={ hour=19, min=14 } },
    { sunrise={ hour=2, min=36 }, sunset={ hour=19, min=12 } },
    { sunrise={ hour=2, min=38 }, sunset={ hour=19, min=10 } },
    { sunrise={ hour=2, min=40 }, sunset={ hour=19, min=07 } },
    { sunrise={ hour=2, min=43 }, sunset={ hour=19, min=05 } },
    { sunrise={ hour=2, min=45 }, sunset={ hour=19, min=02 } },
    { sunrise={ hour=2, min=47 }, sunset={ hour=19, min=00 } },
    { sunrise={ hour=2, min=50 }, sunset={ hour=18, min=57 } },
    { sunrise={ hour=2, min=52 }, sunset={ hour=18, min=54 } },
    { sunrise={ hour=2, min=54 }, sunset={ hour=18, min=52 } },
    { sunrise={ hour=2, min=56 }, sunset={ hour=18, min=49 } },
    { sunrise={ hour=2, min=59 }, sunset={ hour=18, min=47 } },
    { sunrise={ hour=3, min=01 }, sunset={ hour=18, min=44 } },
    { sunrise={ hour=3, min=03 }, sunset={ hour=18, min=41 } },
    { sunrise={ hour=3, min=06 }, sunset={ hour=18, min=39 } },
    { sunrise={ hour=3, min=08 }, sunset={ hour=18, min=36 } },
    { sunrise={ hour=3, min=10 }, sunset={ hour=18, min=33 } },
    { sunrise={ hour=3, min=13 }, sunset={ hour=18, min=30 } },
    { sunrise={ hour=3, min=15 }, sunset={ hour=18, min=28 } },
    { sunrise={ hour=3, min=17 }, sunset={ hour=18, min=25 } },
    { sunrise={ hour=3, min=20 }, sunset={ hour=18, min=22 } },
    { sunrise={ hour=3, min=22 }, sunset={ hour=18, min=19 } },
    { sunrise={ hour=3, min=24 }, sunset={ hour=18, min=16 } },
    { sunrise={ hour=3, min=27 }, sunset={ hour=18, min=13 } },
    { sunrise={ hour=3, min=29 }, sunset={ hour=18, min=11 } },
    { sunrise={ hour=3, min=31 }, sunset={ hour=18, min=08 } },
    { sunrise={ hour=3, min=33 }, sunset={ hour=18, min=05 } },
    { sunrise={ hour=3, min=36 }, sunset={ hour=18, min=02 } },
    { sunrise={ hour=3, min=38 }, sunset={ hour=17, min=59 } },
    { sunrise={ hour=3, min=40 }, sunset={ hour=17, min=56 } },
    { sunrise={ hour=3, min=43 }, sunset={ hour=17, min=53 } },
    { sunrise={ hour=3, min=45 }, sunset={ hour=17, min=51 } },
    { sunrise={ hour=3, min=47 }, sunset={ hour=17, min=48 } },
    { sunrise={ hour=3, min=49 }, sunset={ hour=17, min=45 } },
    { sunrise={ hour=3, min=52 }, sunset={ hour=17, min=42 } },
    { sunrise={ hour=3, min=54 }, sunset={ hour=17, min=39 } },
    { sunrise={ hour=3, min=56 }, sunset={ hour=17, min=36 } },
    { sunrise={ hour=3, min=59 }, sunset={ hour=17, min=33 } },
    { sunrise={ hour=4, min=01 }, sunset={ hour=17, min=30 } },
    { sunrise={ hour=4, min=03 }, sunset={ hour=17, min=27 } },
    { sunrise={ hour=4, min=05 }, sunset={ hour=17, min=24 } },
    { sunrise={ hour=4, min=08 }, sunset={ hour=17, min=21 } },
    { sunrise={ hour=4, min=10 }, sunset={ hour=17, min=18 } },
    { sunrise={ hour=4, min=12 }, sunset={ hour=17, min=15 } },
    { sunrise={ hour=4, min=14 }, sunset={ hour=17, min=12 } },
    { sunrise={ hour=4, min=17 }, sunset={ hour=17, min=09 } },
    { sunrise={ hour=4, min=19 }, sunset={ hour=17, min=06 } },
    { sunrise={ hour=4, min=21 }, sunset={ hour=17, min=03 } },
    { sunrise={ hour=4, min=23 }, sunset={ hour=17, min=00 } },
    { sunrise={ hour=4, min=26 }, sunset={ hour=16, min=57 } },
    { sunrise={ hour=4, min=28 }, sunset={ hour=16, min=54 } },
    { sunrise={ hour=4, min=30 }, sunset={ hour=16, min=51 } },
    { sunrise={ hour=4, min=32 }, sunset={ hour=16, min=48 } },
    { sunrise={ hour=4, min=35 }, sunset={ hour=16, min=46 } },
    { sunrise={ hour=4, min=37 }, sunset={ hour=16, min=43 } },
    { sunrise={ hour=4, min=39 }, sunset={ hour=16, min=40 } },
    { sunrise={ hour=4, min=42 }, sunset={ hour=16, min=37 } },
    { sunrise={ hour=4, min=44 }, sunset={ hour=16, min=34 } },
    { sunrise={ hour=4, min=46 }, sunset={ hour=16, min=31 } },
    { sunrise={ hour=4, min=48 }, sunset={ hour=16, min=28 } },
    { sunrise={ hour=4, min=51 }, sunset={ hour=16, min=25 } },
    { sunrise={ hour=4, min=53 }, sunset={ hour=16, min=22 } },
    { sunrise={ hour=4, min=55 }, sunset={ hour=16, min=19 } },
    { sunrise={ hour=4, min=58 }, sunset={ hour=16, min=16 } },
    { sunrise={ hour=5, min=00 }, sunset={ hour=16, min=13 } },
    { sunrise={ hour=5, min=02 }, sunset={ hour=16, min=10 } },
    { sunrise={ hour=5, min=05 }, sunset={ hour=16, min=07 } },
    { sunrise={ hour=5, min=07 }, sunset={ hour=16, min=04 } },
    { sunrise={ hour=5, min=09 }, sunset={ hour=16, min=01 } },
    { sunrise={ hour=5, min=12 }, sunset={ hour=15, min=59 } },
    { sunrise={ hour=5, min=14 }, sunset={ hour=15, min=56 } },
    { sunrise={ hour=5, min=16 }, sunset={ hour=15, min=53 } },
    { sunrise={ hour=5, min=19 }, sunset={ hour=15, min=50 } },
    { sunrise={ hour=5, min=21 }, sunset={ hour=15, min=47 } },
    { sunrise={ hour=5, min=23 }, sunset={ hour=15, min=44 } },
    { sunrise={ hour=5, min=26 }, sunset={ hour=15, min=41 } },
    { sunrise={ hour=5, min=28 }, sunset={ hour=15, min=39 } },
    { sunrise={ hour=5, min=31 }, sunset={ hour=15, min=36 } },
    { sunrise={ hour=5, min=33 }, sunset={ hour=15, min=33 } },
    { sunrise={ hour=5, min=35 }, sunset={ hour=15, min=30 } },
    { sunrise={ hour=5, min=38 }, sunset={ hour=15, min=28 } },
    { sunrise={ hour=5, min=40 }, sunset={ hour=15, min=25 } },
    { sunrise={ hour=5, min=43 }, sunset={ hour=15, min=22 } },
    { sunrise={ hour=5, min=45 }, sunset={ hour=15, min=19 } },
    { sunrise={ hour=5, min=48 }, sunset={ hour=15, min=17 } },
    { sunrise={ hour=5, min=50 }, sunset={ hour=15, min=14 } },
    { sunrise={ hour=5, min=52 }, sunset={ hour=15, min=11 } },
    { sunrise={ hour=5, min=55 }, sunset={ hour=15, min=09 } },
    { sunrise={ hour=5, min=57 }, sunset={ hour=15, min=06 } },
    { sunrise={ hour=6, min=00 }, sunset={ hour=15, min=03 } },
    { sunrise={ hour=6, min=02 }, sunset={ hour=15, min=01 } },
    { sunrise={ hour=6, min=05 }, sunset={ hour=14, min=58 } },
    { sunrise={ hour=6, min=07 }, sunset={ hour=14, min=56 } },
    { sunrise={ hour=6, min=10 }, sunset={ hour=14, min=53 } },
    { sunrise={ hour=6, min=12 }, sunset={ hour=14, min=51 } },
    { sunrise={ hour=6, min=15 }, sunset={ hour=14, min=48 } },
    { sunrise={ hour=6, min=17 }, sunset={ hour=14, min=46 } },
    { sunrise={ hour=6, min=20 }, sunset={ hour=14, min=44 } },
    { sunrise={ hour=6, min=22 }, sunset={ hour=14, min=41 } },
    { sunrise={ hour=6, min=25 }, sunset={ hour=14, min=39 } },
    { sunrise={ hour=6, min=27 }, sunset={ hour=14, min=37 } },
    { sunrise={ hour=6, min=29 }, sunset={ hour=14, min=34 } },
    { sunrise={ hour=6, min=32 }, sunset={ hour=14, min=32 } },
    { sunrise={ hour=6, min=34 }, sunset={ hour=14, min=30 } },
    { sunrise={ hour=6, min=37 }, sunset={ hour=14, min=28 } },
    { sunrise={ hour=6, min=39 }, sunset={ hour=14, min=26 } },
    { sunrise={ hour=6, min=42 }, sunset={ hour=14, min=24 } },
    { sunrise={ hour=6, min=44 }, sunset={ hour=14, min=21 } },
    { sunrise={ hour=6, min=46 }, sunset={ hour=14, min=19 } },
    { sunrise={ hour=6, min=49 }, sunset={ hour=14, min=18 } },
    { sunrise={ hour=6, min=51 }, sunset={ hour=14, min=16 } },
    { sunrise={ hour=6, min=54 }, sunset={ hour=14, min=14 } },
    { sunrise={ hour=6, min=56 }, sunset={ hour=14, min=12 } },
    { sunrise={ hour=6, min=58 }, sunset={ hour=14, min=10 } },
    { sunrise={ hour=7, min=00 }, sunset={ hour=14, min=08 } },
    { sunrise={ hour=7, min=03 }, sunset={ hour=14, min=07 } },
    { sunrise={ hour=7, min=05 }, sunset={ hour=14, min=05 } },
    { sunrise={ hour=7, min=07 }, sunset={ hour=14, min=04 } },
    { sunrise={ hour=7, min=09 }, sunset={ hour=14, min=02 } },
    { sunrise={ hour=7, min=11 }, sunset={ hour=14, min=01 } },
    { sunrise={ hour=7, min=13 }, sunset={ hour=14, min=00 } },
    { sunrise={ hour=7, min=15 }, sunset={ hour=13, min=58 } },
    { sunrise={ hour=7, min=17 }, sunset={ hour=13, min=57 } },
    { sunrise={ hour=7, min=19 }, sunset={ hour=13, min=56 } },
    { sunrise={ hour=7, min=21 }, sunset={ hour=13, min=55 } },
    { sunrise={ hour=7, min=23 }, sunset={ hour=13, min=54 } },
    { sunrise={ hour=7, min=25 }, sunset={ hour=13, min=53 } },
    { sunrise={ hour=7, min=26 }, sunset={ hour=13, min=52 } },
    { sunrise={ hour=7, min=28 }, sunset={ hour=13, min=51 } },
    { sunrise={ hour=7, min=30 }, sunset={ hour=13, min=51 } },
    { sunrise={ hour=7, min=31 }, sunset={ hour=13, min=50 } },
    { sunrise={ hour=7, min=33 }, sunset={ hour=13, min=49 } },
    { sunrise={ hour=7, min=34 }, sunset={ hour=13, min=49 } },
    { sunrise={ hour=7, min=35 }, sunset={ hour=13, min=49 } },
    { sunrise={ hour=7, min=37 }, sunset={ hour=13, min=48 } },
    { sunrise={ hour=7, min=38 }, sunset={ hour=13, min=48 } },
    { sunrise={ hour=7, min=39 }, sunset={ hour=13, min=48 } },
    { sunrise={ hour=7, min=40 }, sunset={ hour=13, min=48 } },
    { sunrise={ hour=7, min=41 }, sunset={ hour=13, min=48 } },
    { sunrise={ hour=7, min=42 }, sunset={ hour=13, min=48 } },
    { sunrise={ hour=7, min=42 }, sunset={ hour=13, min=49 } },
    { sunrise={ hour=7, min=43 }, sunset={ hour=13, min=49 } },
    { sunrise={ hour=7, min=44 }, sunset={ hour=13, min=49 } },
    { sunrise={ hour=7, min=44 }, sunset={ hour=13, min=50 } },
    { sunrise={ hour=7, min=44 }, sunset={ hour=13, min=50 } },
    { sunrise={ hour=7, min=45 }, sunset={ hour=13, min=51 } },
    { sunrise={ hour=7, min=45 }, sunset={ hour=13, min=52 } },
    { sunrise={ hour=7, min=45 }, sunset={ hour=13, min=53 } },
    { sunrise={ hour=7, min=45 }, sunset={ hour=13, min=54 } },
    { sunrise={ hour=7, min=45 }, sunset={ hour=13, min=55 } },
    { sunrise={ hour=7, min=45 }, sunset={ hour=13, min=56 } },
    { sunrise={ hour=7, min=45 }, sunset={ hour=13, min=57 } },
    { sunrise={ hour=7, min=45 }, sunset={ hour=13, min=58 } },
    { sunrise={ hour=7, min=45 }, sunset={ hour=13, min=58 } }
}

----------------------------------------------------------------------------

local deviceIsOn = false
local sleepTimeMs = 60*1000;
local scriptName = "sunrise-sunset.lua"
local deviceManager = require "telldus.DeviceManager"

function shouldBeOn(currentTime)
    local dayOfYear = os.date("*t").yday
    print("Time is %s (UTC)", os.date("%X", currentTime))
    local dateComponents = os.date("*t", currentTime)

    -- find the entry relevant for today
    local sunTimes = sun[dayOfYear]
    if sunTimes == nil then
        print("No match in sun table for: %s - returning false", dayOfYear)
        return false
    end

    -- Define time intervals here (on/off, hour, minute, offset (+/-) in miutes).
    -- Times are UTC and schedule assumes times are increasing, i.e. the first
    -- time should appear first in the list, then the second, etc. This might cause
    -- problems if e.g. the sun rises "too early" or similar.
    local intervals = {
        { on=true,  hour=06, min=00 },
        { on=false, hour=sunTimes.sunrise.hour, min=sunTimes.sunrise.min, offsetMin=30 },
        { on=true,  hour=sunTimes.sunset.hour, min=sunTimes.sunset.min },
        { on=false, hour=22, min=00 }
    }

    local match = intervals[1]
    for i, interval in ipairs(intervals) do 
        local intervalTime = os.time({ year=dateComponents.year, month=dateComponents.month, day=dateComponents.day, hour=interval.hour, min=interval.min, sec=00 })
        if interval.offsetMin ~= nil then
            intervalTime = intervalTime + interval.offsetMin * 60
        end
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

    print("Found interval, returning: %02d:%02d, offset: %s (on: %s)", match.hour, match.min, match.offsetMin, match.on)
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
            print("Device %s is already in state %s, doing nothing.", deviceName, deviceShouldBeOn)
        end

        print("Sleeping %s ms", sleepTimeMs)
        sleep(sleepTimeMs)
    end
end
