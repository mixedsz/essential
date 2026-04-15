local L0_1, L1_1
L0_1 = Citizen
L0_1 = L0_1.CreateThread
function L1_1()
  local L0_2, L1_2, L2_2, L3_2, L4_2
  L0_2 = HasStreamedTextureDictLoaded
  L1_2 = "plates"
  L0_2 = L0_2(L1_2)
  if not L0_2 then
    L0_2 = RequestStreamedTextureDict
    L1_2 = "plates"
    L2_2 = true
    L0_2(L1_2, L2_2)
    while true do
      L0_2 = HasStreamedTextureDictLoaded
      L1_2 = "plates"
      L0_2 = L0_2(L1_2)
      if L0_2 then
        break
      end
      L0_2 = Citizen
      L0_2 = L0_2.Wait
      L1_2 = 0
      L0_2(L1_2)
    end
  end
  L0_2 = RemoveReplaceTexture
  L1_2 = "vehshare"
  L2_2 = "plate01"
  L0_2(L1_2, L2_2)
  L0_2 = AddReplaceTexture
  L1_2 = "vehshare"
  L2_2 = "plate01"
  L3_2 = "plates"
  L4_2 = "plate01"
  L0_2(L1_2, L2_2, L3_2, L4_2)
  L0_2 = RemoveReplaceTexture
  L1_2 = "vehshare"
  L2_2 = "plate01_n"
  L0_2(L1_2, L2_2)
  L0_2 = AddReplaceTexture
  L1_2 = "vehshare"
  L2_2 = "plate01_n"
  L3_2 = "plates"
  L4_2 = "plate01_n"
  L0_2(L1_2, L2_2, L3_2, L4_2)
  L0_2 = RemoveReplaceTexture
  L1_2 = "vehshare"
  L2_2 = "plate02"
  L0_2(L1_2, L2_2)
  L0_2 = AddReplaceTexture
  L1_2 = "vehshare"
  L2_2 = "plate02"
  L3_2 = "plates"
  L4_2 = "plate02"
  L0_2(L1_2, L2_2, L3_2, L4_2)
  L0_2 = RemoveReplaceTexture
  L1_2 = "vehshare"
  L2_2 = "plate02_n"
  L0_2(L1_2, L2_2)
  L0_2 = AddReplaceTexture
  L1_2 = "vehshare"
  L2_2 = "plate02_n"
  L3_2 = "plates"
  L4_2 = "plate02_n"
  L0_2(L1_2, L2_2, L3_2, L4_2)
  L0_2 = RemoveReplaceTexture
  L1_2 = "vehshare"
  L2_2 = "plate03"
  L0_2(L1_2, L2_2)
  L0_2 = AddReplaceTexture
  L1_2 = "vehshare"
  L2_2 = "plate03"
  L3_2 = "plates"
  L4_2 = "plate03"
  L0_2(L1_2, L2_2, L3_2, L4_2)
  L0_2 = RemoveReplaceTexture
  L1_2 = "vehshare"
  L2_2 = "plate03_n"
  L0_2(L1_2, L2_2)
  L0_2 = AddReplaceTexture
  L1_2 = "vehshare"
  L2_2 = "plate03_n"
  L3_2 = "plates"
  L4_2 = "plate03_n"
  L0_2(L1_2, L2_2, L3_2, L4_2)
  L0_2 = RemoveReplaceTexture
  L1_2 = "vehshare"
  L2_2 = "plate04"
  L0_2(L1_2, L2_2)
  L0_2 = AddReplaceTexture
  L1_2 = "vehshare"
  L2_2 = "plate04"
  L3_2 = "plates"
  L4_2 = "plate04"
  L0_2(L1_2, L2_2, L3_2, L4_2)
  L0_2 = RemoveReplaceTexture
  L1_2 = "vehshare"
  L2_2 = "plate04_n"
  L0_2(L1_2, L2_2)
  L0_2 = AddReplaceTexture
  L1_2 = "vehshare"
  L2_2 = "plate04_n"
  L3_2 = "plates"
  L4_2 = "plate04_n"
  L0_2(L1_2, L2_2, L3_2, L4_2)
  L0_2 = RemoveReplaceTexture
  L1_2 = "vehshare"
  L2_2 = "plate05"
  L0_2(L1_2, L2_2)
  L0_2 = AddReplaceTexture
  L1_2 = "vehshare"
  L2_2 = "plate05"
  L3_2 = "plates"
  L4_2 = "plate05"
  L0_2(L1_2, L2_2, L3_2, L4_2)
  L0_2 = RemoveReplaceTexture
  L1_2 = "vehshare"
  L2_2 = "plate05_n"
  L0_2(L1_2, L2_2)
  L0_2 = AddReplaceTexture
  L1_2 = "vehshare"
  L2_2 = "plate05_n"
  L3_2 = "plates"
  L4_2 = "plate05_n"
  L0_2(L1_2, L2_2, L3_2, L4_2)
  L0_2 = RemoveReplaceTexture
  L1_2 = "vehshare"
  L2_2 = "yankton_plate"
  L0_2(L1_2, L2_2)
  L0_2 = AddReplaceTexture
  L1_2 = "vehshare"
  L2_2 = "yankton_plate"
  L3_2 = "plates"
  L4_2 = "yankton_plate"
  L0_2(L1_2, L2_2, L3_2, L4_2)
  L0_2 = RemoveReplaceTexture
  L1_2 = "vehshare"
  L2_2 = "yankton_plate_n"
  L0_2(L1_2, L2_2)
  L0_2 = AddReplaceTexture
  L1_2 = "vehshare"
  L2_2 = "yankton_plate_n"
  L3_2 = "plates"
  L4_2 = "yankton_plate_n"
  L0_2(L1_2, L2_2, L3_2, L4_2)
  L0_2 = RemoveReplaceTexture
  L1_2 = "vehshare"
  L2_2 = "vehicle_generic_plate_font"
  L0_2(L1_2, L2_2)
  L0_2 = AddReplaceTexture
  L1_2 = "vehshare"
  L2_2 = "vehicle_generic_plate_font"
  L3_2 = "plates"
  L4_2 = "vehicle_generic_plate_font"
  L0_2(L1_2, L2_2, L3_2, L4_2)
  L0_2 = RemoveReplaceTexture
  L1_2 = "vehshare"
  L2_2 = "vehicle_generic_plate_font_n"
  L0_2(L1_2, L2_2)
  L0_2 = AddReplaceTexture
  L1_2 = "vehshare"
  L2_2 = "vehicle_generic_plate_font_n"
  L3_2 = "plates"
  L4_2 = "vehicle_generic_plate_font_n"
  L0_2(L1_2, L2_2, L3_2, L4_2)
end
L0_1(L1_1)
