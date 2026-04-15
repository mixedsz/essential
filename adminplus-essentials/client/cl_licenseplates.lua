-- ============================================================
-- cl_licenseplates.lua | AdminPlus Essentials
-- Replaces default GTA V license plate textures with custom ones
-- from the stream/plates.ytd texture dictionary.
-- ============================================================

Citizen.CreateThread(function()
    -- Load the streamed texture dictionary
    if not HasStreamedTextureDictLoaded("plates") then
        RequestStreamedTextureDict("plates", true)
        while not HasStreamedTextureDictLoaded("plates") do
            Citizen.Wait(0)
        end
    end

    -- List of plate texture names to replace (both diffuse and normal maps)
    local plateTextures = {
        "plate01",
        "plate01_n",
        "plate02",
        "plate02_n",
        "plate03",
        "plate03_n",
        "plate04",
        "plate04_n",
        "plate05",
        "plate05_n",
        "yankton_plate",
        "yankton_plate_n",
        "vehicle_generic_plate_font",
        "vehicle_generic_plate_font_n",
    }

    -- Replace each texture: remove any existing override then add the custom one
    for _, texName in ipairs(plateTextures) do
        RemoveReplaceTexture("vehshare", texName)
        AddReplaceTexture("vehshare", texName, "plates", texName)
    end
end)