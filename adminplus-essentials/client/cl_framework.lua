local L0_1, L1_1
L0_1 = frameworkConfig
L0_1 = L0_1.Framework
if "ESX" == L0_1 then
  L0_1 = exports
  L1_1 = frameworkConfig
  L1_1 = L1_1.FrameworkExport
  L0_1 = L0_1[L1_1]
  L1_1 = L0_1
  L0_1 = L0_1.getSharedObject
  L0_1 = L0_1(L1_1)
  ESX = L0_1
else
  L0_1 = frameworkConfig
  L0_1 = L0_1.Framework
  if "QB" == L0_1 then
    L0_1 = exports
    L0_1 = L0_1["qb-core"]
    L1_1 = L0_1
    L0_1 = L0_1.GetCoreObject
    L0_1 = L0_1(L1_1)
    QBCore = L0_1
  else
    L0_1 = print
    L1_1 = "No Framework 1"
    L0_1(L1_1)
  end
end
