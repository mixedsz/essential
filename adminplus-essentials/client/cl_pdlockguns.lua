-- ============================================================
-- cl_pdlockguns.lua | AdminPlus Essentials
-- Listens for the ox_inventory current weapon event and disarms
-- any player holding a police-restricted weapon who is NOT on
-- the police job. Also fires a server event for logging/kicking.
-- ============================================================

if not restrictedpolicegunsConfig.Enable then return end

local restrictedGuns = restrictedpolicegunsConfig.RestrictedPoliceGuns

AddEventHandler("ox_inventory:currentWeapon", function(weaponData)
    -- weaponData is nil when player is unarmed
    local weaponName = weaponData and weaponData.name

    -- Only act if the weapon is in the restricted list
    if restrictedGuns[weaponName] then
        local playerJob = ESX.PlayerData.job.name

        if playerJob ~= "police" then
            -- Disarm the player client-side
            TriggerEvent("ox_inventory:disarm")

            -- Notify server for logging / kick handling
            TriggerServerEvent("whyyou:gotagun")
        end
    end
end)