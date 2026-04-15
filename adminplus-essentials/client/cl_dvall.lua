local L0_1, L1_1, L2_1, L3_1
L0_1 = TriggerEvent
L1_1 = "chat:addSuggestion"
L2_1 = "/dvall"
L3_1 = "Delete all vehicles."
L0_1(L1_1, L2_1, L3_1)
L0_1 = dvallConfig
L0_1 = L0_1.Enable
if L0_1 then
  L0_1 = dvallConfig
  L0_1 = L0_1.WhitelistCars
  L1_1 = RegisterNetEvent
  L2_1 = "k3ap:dvall"
  L1_1(L2_1)
  L1_1 = AddEventHandler
  L2_1 = "k3ap:dvall"
  function L3_1()
    local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2
    L0_2 = EnumerateVehicles
    L0_2, L1_2, L2_2, L3_2 = L0_2()
    for L4_2 in L0_2, L1_2, L2_2, L3_2 do
      L5_2 = false
      L6_2 = pairs
      L7_2 = L0_1
      L6_2, L7_2, L8_2, L9_2 = L6_2(L7_2)
      for L10_2, L11_2 in L6_2, L7_2, L8_2, L9_2 do
        L12_2 = GetEntityModel
        L13_2 = L4_2
        L12_2 = L12_2(L13_2)
        L13_2 = GetHashKey
        L14_2 = L11_2
        L13_2 = L13_2(L14_2)
        if L12_2 == L13_2 then
          L5_2 = true
          break
        end
      end
      L6_2 = IsPedAPlayer
      L7_2 = GetPedInVehicleSeat
      L8_2 = L4_2
      L9_2 = -1
      L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2 = L7_2(L8_2, L9_2)
      L6_2 = L6_2(L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2)
      if not L5_2 and not L6_2 then
        L7_2 = SetEntityAsMissionEntity
        L8_2 = L4_2
        L9_2 = false
        L10_2 = false
        L7_2(L8_2, L9_2, L10_2)
        L7_2 = DeleteEntity
        L8_2 = L4_2
        L7_2(L8_2)
      end
    end
  end
  L1_1(L2_1, L3_1)
  L1_1 = {}
  function L2_1(A0_2)
    local L1_2, L2_2
    L1_2 = A0_2.destructor
    if L1_2 then
      L1_2 = A0_2.handle
      if L1_2 then
        L1_2 = A0_2.destructor
        L2_2 = A0_2.handle
        L1_2(L2_2)
      end
    end
    A0_2.destructor = nil
    A0_2.handle = nil
  end
  L1_1.__gc = L2_1
  function L2_1(A0_2, A1_2, A2_2)
    local L3_2, L4_2
    L3_2 = coroutine
    L3_2 = L3_2.wrap
    function L4_2()
      local L0_3, L1_3, L2_3, L3_3, L4_3, L5_3
      L0_3 = A0_2
      L0_3, L1_3 = L0_3()
      if not L1_3 or 0 == L1_3 then
        L2_3 = A2_2
        L3_3 = L0_3
        L2_3(L3_3)
        return
      end
      L2_3 = {}
      L2_3.handle = L0_3
      L3_3 = A2_2
      L2_3.destructor = L3_3
      L3_3 = setmetatable
      L4_3 = L2_3
      L5_3 = L1_1
      L3_3(L4_3, L5_3)
      L3_3 = true
      repeat
        L4_3 = coroutine
        L4_3 = L4_3.yield
        L5_3 = L1_3
        L4_3(L5_3)
        L4_3 = A1_2
        L5_3 = L0_3
        L4_3, L5_3 = L4_3(L5_3)
        L1_3 = L5_3
        L3_3 = L4_3
      until not L3_3
      L4_3 = nil
      L2_3.handle = nil
      L2_3.destructor = L4_3
      L4_3 = A2_2
      L5_3 = L0_3
      L4_3(L5_3)
    end
    return L3_2(L4_2)
  end
  function L3_1()
    local L0_2, L1_2, L2_2, L3_2
    L0_2 = L2_1
    L1_2 = FindFirstVehicle
    L2_2 = FindNextVehicle
    L3_2 = EndFindVehicle
    return L0_2(L1_2, L2_2, L3_2)
  end
  EnumerateVehicles = L3_1
end
