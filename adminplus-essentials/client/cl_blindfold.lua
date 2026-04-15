local L0_1, L1_1, L2_1, L3_1, L4_1
L0_1 = blindfoldConfig
L0_1 = L0_1.Enable
if L0_1 then
  L0_1 = false
  L1_1 = RegisterCommand
  L2_1 = blindfoldConfig
  L2_1 = L2_1.Command
  function L3_1()
    local L0_2, L1_2, L2_2
    L0_2 = L0_1
    if not L0_2 then
      L0_2 = SetNuiFocus
      L1_2 = false
      L2_2 = false
      L0_2(L1_2, L2_2)
      L0_2 = SendNUIMessage
      L1_2 = {}
      L1_2.type = "displayblindfold"
      L0_2(L1_2)
      L0_2 = lib
      L0_2 = L0_2.notify
      L1_2 = {}
      L1_2.title = "Blindfold"
      L1_2.icon = "head-side-mask"
      L1_2.duration = 5000
      L1_2.description = "You've put your blindfold on."
      L1_2.type = "inform"
      L0_2(L1_2)
      L0_2 = true
      L0_1 = L0_2
    else
      L0_2 = SetNuiFocus
      L1_2 = false
      L2_2 = false
      L0_2(L1_2, L2_2)
      L0_2 = SendNUIMessage
      L1_2 = {}
      L1_2.type = "removeblindfold"
      L0_2(L1_2)
      L0_2 = lib
      L0_2 = L0_2.notify
      L1_2 = {}
      L1_2.title = "Blindfold"
      L1_2.icon = "head-side-mask"
      L1_2.duration = 5000
      L1_2.description = "You've taken off your blindfold."
      L1_2.type = "inform"
      L0_2(L1_2)
      L0_2 = false
      L0_1 = L0_2
    end
  end
  L4_1 = false
  L1_1(L2_1, L3_1, L4_1)
end
