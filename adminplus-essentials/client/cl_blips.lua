-- ============================================================
-- cl_blips.lua | AdminPlus Essentials
-- Creates map blips defined in blipsConfig on resource start
-- ============================================================

if not blipsConfig.Enable then return end

local blipsList = blipsConfig.Blips

Citizen.CreateThread(function()
    for _, blipData in pairs(blipsList) do
        -- Create the blip at the specified coordinates
        local blip = AddBlipForCoord(blipData.x, blipData.y, blipData.z)

        SetBlipSprite(blip, blipData.id)
        SetBlipDisplay(blip, 2)
        SetBlipScale(blip, blipData.scale)
        SetBlipColour(blip, blipData.colour)
        SetBlipAsShortRange(blip, true)

        -- Set the blip name using the GTA text command approach
        BeginTextCommandSetBlipName("STRING")
        AddTextComponentString(blipData.title)
        EndTextCommandSetBlipName(blip)
    end
end)