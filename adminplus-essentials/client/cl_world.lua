local L0_1, L1_1
L0_1 = worldConfig
L0_1 = L0_1.Enable
if L0_1 then
  L0_1 = worldConfig
  L0_1 = L0_1.World
  L0_1 = L0_1.DrivingVehicles
  DrivingVehicles = L0_1
  L0_1 = worldConfig
  L0_1 = L0_1.World
  L0_1 = L0_1.NPCS
  NPCS = L0_1
  L0_1 = worldConfig
  L0_1 = L0_1.World
  L0_1 = L0_1.SCENARIONPCS
  SCENARIONPCS = L0_1
  L0_1 = worldConfig
  L0_1 = L0_1.World
  L0_1 = L0_1.ParkedVehicles
  ParkedVehicles = L0_1
  L0_1 = CreateThread
  function L1_1()
    local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2
    L0_2 = worldConfig
    L0_2 = L0_2.World
    L0_2 = L0_2.GunStoreSounds
    if L0_2 then
      L0_2 = ClearAmbientZoneState
      L1_2 = "collision_ybmrar"
      L2_2 = false
      L0_2(L1_2, L2_2)
      L0_2 = SetAmbientZoneState
      L1_2 = "collision_ybmrar"
      L2_2 = false
      L3_2 = false
      L0_2(L1_2, L2_2, L3_2)
    end
    L0_2 = worldConfig
    L0_2 = L0_2.World
    L0_2 = L0_2.AntiVDM
    if L0_2 then
      L0_2 = N_0x4757f00bc6323cfe
      L1_2 = -1553120962
      L2_2 = 0.0
      L0_2(L1_2, L2_2)
    end
    while true do
      L0_2 = worldConfig
      L0_2 = L0_2.World
      L0_2 = L0_2.StealthPunch
      if L0_2 then
        L0_2 = GetPedStealthMovement
        L1_2 = PlayerPedId
        L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2 = L1_2()
        L0_2 = L0_2(L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2)
        if L0_2 then
          L0_2 = SetPedStealthMovement
          L1_2 = PlayerPedId
          L1_2 = L1_2()
          L2_2 = 0
          L0_2(L1_2, L2_2)
        end
      end
      L0_2 = Wait
      L1_2 = 0
      L0_2(L1_2)
      L0_2 = worldConfig
      L0_2 = L0_2.World
      L0_2 = L0_2.Combatroll
      if L0_2 then
        L0_2 = IsPedArmed
        L1_2 = PlayerPedId
        L1_2 = L1_2()
        L2_2 = 6
        L0_2 = L0_2(L1_2, L2_2)
        if L0_2 then
          L0_2 = DisableControlAction
          L1_2 = 0
          L2_2 = 22
          L3_2 = true
          L0_2(L1_2, L2_2, L3_2)
        end
      end
      L0_2 = GetEntityCoords
      L1_2 = PlayerPedId
      L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2 = L1_2()
      L0_2 = L0_2(L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2)
      L1_2 = RemoveVehiclesFromGeneratorsInArea
      L2_2 = L0_2.x
      L2_2 = L2_2 - 500.0
      L3_2 = L0_2.y
      L3_2 = L3_2 - 500.0
      L4_2 = L0_2.z
      L4_2 = L4_2 - 500.0
      L5_2 = L0_2.x
      L5_2 = L5_2 + 500.0
      L6_2 = L0_2.y
      L6_2 = L6_2 + 500.0
      L7_2 = L0_2.z
      L7_2 = L7_2 + 500.0
      L1_2(L2_2, L3_2, L4_2, L5_2, L6_2, L7_2)
      L1_2 = _ENV
      L2_2 = "SetParkedVehicleDensityMultiplierThisFrame"
      L1_2 = L1_2[L2_2]
      L2_2 = ParkedVehicles
      L1_2(L2_2)
      L1_2 = SetPedDensityMultiplierThisFrame
      L2_2 = NPCS
      L1_2(L2_2)
      L1_2 = SetScenarioPedDensityMultiplierThisFrame
      L2_2 = SCENARIONPCS
      L3_2 = SCENARIONPCS
      L1_2(L2_2, L3_2)
      L1_2 = SetVehicleDensityMultiplierThisFrame
      L2_2 = DrivingVehicles
      L1_2(L2_2)
      L1_2 = _ENV
      L2_2 = "SetRandomVehicleDensityMultiplierThisFrame"
      L1_2 = L1_2[L2_2]
      L2_2 = DrivingVehicles
      L1_2(L2_2)
    end
  end
  L0_1(L1_1)
end
