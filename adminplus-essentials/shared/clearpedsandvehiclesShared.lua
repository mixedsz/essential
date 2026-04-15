clearpedsandvehiclesConfig = {}

-- Delete vehicles and peds that are near you in specific areas of the map
-- (Useful for servers with MLOs & floating peds or vehicles colliding) -- 
clearpedsandvehiclesConfig.Enable = true

clearpedsandvehiclesConfig.ClearPedsAndVehicle = {
    {coords = vector3(-2110.3398, 3083.8193, 32.8103), radius = 100.0}, -- military base
    {coords = vector3(-1246.6555, -2683.2766, 14.1837), radius = 255.0}, -- airport
}