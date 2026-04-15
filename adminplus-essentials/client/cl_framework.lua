-- ============================================================
-- cl_framework.lua | AdminPlus Essentials
-- Initialises the global ESX or QBCore object at resource start
-- so all other client scripts can reference ESX / QBCore directly.
-- ============================================================

if frameworkConfig.Framework == "ESX" then
    local esxExport = exports[frameworkConfig.FrameworkExport]
    ESX = esxExport:getSharedObject()

elseif frameworkConfig.Framework == "QB" then
    local qbExport = exports["qb-core"]
    QBCore = qbExport:GetCoreObject()

else
    print("[AdminPlus | Framework] ERROR: No Framework configured. Check frameworkShared.lua")
end