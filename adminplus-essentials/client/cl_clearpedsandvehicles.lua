-- ============================================================
-- cl_clearpedsandvehicles.lua | AdminPlus Essentials
-- Continuously clears peds and vehicles within defined radius
-- zones (e.g. MLO interiors, airport) to prevent dsync / float.
-- ============================================================

if not clearpedsandvehiclesConfig.Enable then return end

local zones = clearpedsandvehiclesConfig.ClearPedsAndVehicle

CreateThread(function()
    while true do
        local playerCoords = GetEntityCoords(PlayerPedId())
        local waitTime     = 1500  -- default slow poll

        for _, zone in pairs(zones) do
            local dist = #(playerCoords - zone.coords)

            if dist < zone.radius then
                -- Player is inside this zone — clear everything
                ClearAreaOfVehicles(zone.coords, zone.radius)
                ClearAreaOfPeds(zone.coords, zone.radius, 1)
                waitTime = 8  -- fast poll while inside
            end
        end

        Wait(waitTime)
    end
end)