-- ============================================================
-- sv_framework.lua | AdminPlus Essentials
-- Initialises the global ESX / QBCore server object so all
-- other server scripts can reference ESX / QBCore directly.
-- ============================================================

if frameworkConfig.Framework == "ESX" then
    local esxExport = exports[frameworkConfig.FrameworkExport]
    ESX = esxExport:getSharedObject()
    print("[AdminPlus | Framework] ESX initialised on server.")

elseif frameworkConfig.Framework == "QB" then
    local qbExport = exports["qb-core"]
    QBCore = qbExport:GetCoreObject()
    print("[AdminPlus | Framework] QBCore initialised on server.")

else
    print("[AdminPlus | Framework] ERROR: No framework configured. Check frameworkShared.lua")
end
