-- ============================================================
-- cl_blindfold.lua | AdminPlus Essentials
-- Blindfold toggle command — shows/hides a black fullscreen NUI
-- ============================================================

if not blindfoldConfig.Enable then return end

local blindfoldActive = false

RegisterCommand(blindfoldConfig.Command, function()
    if not blindfoldActive then
        -- Put blindfold ON
        SetNuiFocus(false, false)
        SendNUIMessage({ type = "displayblindfold" })
        lib.notify({
            title       = "Blindfold",
            icon        = "head-side-mask",
            duration    = 5000,
            description = "You've put your blindfold on.",
            type        = "inform",
        })
        blindfoldActive = true
    else
        -- Take blindfold OFF
        SetNuiFocus(false, false)
        SendNUIMessage({ type = "removeblindfold" })
        lib.notify({
            title       = "Blindfold",
            icon        = "head-side-mask",
            duration    = 5000,
            description = "You've taken off your blindfold.",
            type        = "inform",
        })
        blindfoldActive = false
    end
end, false)