-- ============================================================
-- cl_world.lua | AdminPlus Essentials
-- Per-frame and one-shot world settings:
--   • GunStoreSounds  – silence gun range ambient audio
--   • AntiVDM         – reduce vehicle contact damage
--   • StealthPunch    – prevent one-punch kills while crouched
--   • Combatroll      – disable combat roll when armed
--   • NPC/vehicle population density multipliers
-- ============================================================

if not worldConfig.Enable then return end

local World         = worldConfig.World
local DrivingVehicles = World.DrivingVehicles
local NPCS          = World.NPCS
local SCENARIONPCS  = World.SCENARIONPCS
local ParkedVehicles = World.ParkedVehicles

CreateThread(function()
    -- ── One-shot settings ─────────────────────────────────────

    -- Silence the gun store / shooting range ambient zone
    if World.GunStoreSounds then
        ClearAmbientZoneState("collision_ybmrar", false)
        SetAmbientZoneState("collision_ybmrar", false, false)
    end

    -- Reduce vehicle-on-vehicle contact damage (anti-VDM)
    -- Native 0x4757f00bc6323cfe = SET_VEHICLE_DENSITY_MULTIPLIER_THIS_FRAME (reused hash for damage scale)
    if World.AntiVDM then
        N_0x4757f00bc6323cfe(-1553120962, 0.0)
    end

    -- ── Per-frame loop ────────────────────────────────────────
    while true do
        -- Disable stealth/crouch one-punch mechanic
        if World.StealthPunch then
            if GetPedStealthMovement(PlayerPedId()) then
                SetPedStealthMovement(PlayerPedId(), 0)
            end
        end

        Wait(0)

        -- Disable combat roll when the player is armed
        if World.Combatroll then
            if IsPedArmed(PlayerPedId(), 6) then
                DisableControlAction(0, 22, true)
            end
        end

        -- Remove AI vehicles from nearby spawn generators
        local playerCoords = GetEntityCoords(PlayerPedId())
        RemoveVehiclesFromGeneratorsInArea(
            playerCoords.x - 500.0, playerCoords.y - 500.0, playerCoords.z - 500.0,
            playerCoords.x + 500.0, playerCoords.y + 500.0, playerCoords.z + 500.0
        )

        -- NPC & vehicle population density
        SetParkedVehicleDensityMultiplierThisFrame(ParkedVehicles)
        SetPedDensityMultiplierThisFrame(NPCS)
        SetScenarioPedDensityMultiplierThisFrame(SCENARIONPCS, SCENARIONPCS)
        SetVehicleDensityMultiplierThisFrame(DrivingVehicles)
        SetRandomVehicleDensityMultiplierThisFrame(DrivingVehicles)
    end
end)
