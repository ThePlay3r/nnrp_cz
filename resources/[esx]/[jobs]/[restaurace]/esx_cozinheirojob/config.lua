Config                            = {}
Config.DrawDistance               = 100.0

Config.EnablePlayerManagement     = true
Config.EnableSocietyOwnedVehicles = false
Config.EnableVaultManagement      = true
Config.EnableHelicopters          = false
Config.EnableMoneyWash            = true
Config.MaxInService               = -1
Config.Locale                     = 'cs'

Config.MissCraft                  = 0 -- %


Config.VehicleShopCoords = {
	coords = vector3(129.69, -1035.68, 57.8),
	heading = 69.44,
}
Config.SpawnPoints = {
	{ coords = vector3(124.25, -1048.32, 29.19), heading = 157.18, radius = 2.0 },
}
Config.AuthorizedVehicles = {
	{ model = 'peyote',  label = 'Peyote', price = 1 },
	{ model = 'nspeedofiremni',  label = 'Vapid Speedo', price = 1, props = { modLivery = 10} },
}


Config.Blips = {
    
    Blip = {
      Pos     = { x = 135.21, y = -1042.01, z = 22.96 },
      Sprite  = 383,
      Display = 4,
      Scale   = 1.2,
      publicBlip = true,
      label = "Restaurace Zensai",
    },

    Sklad = {
        Pos     = {x = 2589.61, y = 4678.27, z = 33.08},
        Sprite  = 383,
        Display = 4,
        Scale   = 1.2,
        publicBlip = false,
        label = "Restaurace Zensai - Sklad",
    },

    Prodej = {
      Pos     = {x = 1181.08, y = -3288.33, z = 4.54},
        Sprite  = 383,
        Display = 4,
        Scale   = 1.2,
        publicBlip = false,
        label = "Restaurace Zensai - Prodej",
    }

}

Config.Zones = {

    Cloakrooms = {
        Pos   = { x = 140.47, y = -1061.83, z = 21.96 },
        Size  = { x = 1.5, y = 1.5, z = 1.0 },
        Color = { r = 255, g = 187, b = 255 },
        Type  = 1,
    },

    Vaults = {
        Pos   = { x = 135.27, y = -1060.34, z = 21.96},
        Size  = { x = 1.3, y = 1.3, z = 1.0 },
        Color = { r = 30, g = 144, b = 255 },
        Type  = 1,
    },

    Fridge = {
        Pos   = { x = 148.61, y = -1054.55, z = 21.96 },
        Size  = { x = 1.6, y = 1.6, z = 1.0 },
        Color = { r = 255, g = 0, b = 0 },
        Type  = 1,
    },

    Fridge2 = {
      Pos   = { x = 123.79, y = -1040.59, z = 28.21 },
      Size  = { x = 1.6, y = 1.6, z = 1.0 },
      Color = { r = 255, g = 0, b = 0 },
      Type  = 1,
    },
    
    Fridge3 = {
      Pos   = { x = 126.18, y = -1034.77, z = 28.28 },
      Size  = { x = 1.6, y = 1.6, z = 1.0 },
      Color = { r = 255, g = 0, b = 0 },
      Type  = 1,
    },

    Vehicles = {
        Pos          = { x = 125.7, y = -1053.26, z = 29.19 },
        SpawnPoint   = { x = 111.49, y = -1049.13, z = 28.21 },
        Size         = { x = 1.0, y = 1.0, z = 1.0 },
	      Color        = { r = 255, g = 255, b = 0 },
	      Type         = 36,
	      Heading      = 207.43,
    },

--[[
    Helicopters = {
        Pos          = { x = 137.177, y = -1278.757, z = 28.371 },
        SpawnPoint   = { x = 138.436, y = -1263.095, z = 28.626 },
        Size         = { x = 1.8, y = 1.8, z = 1.0 },
        Color        = { r = 255, g = 255, b = 0 },
        Type         = 23,
        Heading      = 207.43,
    },

    HelicopterDeleters = {
        Pos   = { x = 133.203, y = -1265.573, z = 28.396 },
        Size  = { x = 3.0, y = 3.0, z = 0.2 },
        Color = { r = 255, g = 255, b = 0 },
        Type  = 1,
    },
]]--

    BossActions = {
        Pos   = { x = 134.76, y = -1061.96, z = 21.96 },
        Size  = { x = 1.5, y = 1.5, z = 1.0 },
        Color = { r = 0, g = 100, b = 0 },
        Type  = 1,
    },

-----------------------
-------- SHOPS --------
}


-----------------------
----- TELEPORTERS -----

Config.TeleportZones = {
  EnterBuilding = {
    Pos       = { x = 132.608, y = -1293.978, z = 28.269 },
    Size      = { x = 1.2, y = 1.2, z = 0.1 },
    Color     = { r = 128, g = 128, b = 128 },
    Marker    = 1,
    Hint      = _U('e_to_enter_1'),
    Teleport  = { x = 126.742, y = -1278.386, z = 28.569 }
  },

  ExitBuilding = {
    Pos       = { x = 132.517, y = -1290.901, z = 28.269 },
    Size      = { x = 1.2, y = 1.2, z = 0.1 },
    Color     = { r = 128, g = 128, b = 128 },
    Marker    = 1,
    Hint      = _U('e_to_exit_1'),
    Teleport  = { x = 131.175, y = -1295.598, z = 28.569 },
  },

--[[
  EnterHeliport = {
    Pos       = { x = 126.843, y = -729.012, z = 241.201 },
    Size      = { x = 2.0, y = 2.0, z = 0.2 },
    Color     = { r = 204, g = 204, b = 0 },
    Marker    = 1,
    Hint      = _U('e_to_enter_2),
    Teleport  = { x = -65.944, y = -818.589, z =  320.801 }
  },

  ExitHeliport = {
    Pos       = { x = -67.236, y = -821.702, z = 320.401 },
    Size      = { x = 2.0, y = 2.0, z = 0.2 },
    Color     = { r = 204, g = 204, b = 0 },
    Marker    = 1,
    Hint      = _U('e_to_exit_2'),
    Teleport  = { x = 124.164, y = -728.231, z = 241.801 },
  },
]]--
}


-- CHECK SKINCHANGER CLIENT MAIN.LUA for matching elements

Config.Uniforms = {
  barman_outfit = {
    male = {
      tshirt_1 = 15,  tshirt_2 = 0,
      torso_1 = 111,   torso_2 = 0,
      decals_1 = 0,   decals_2 = 0,
      arms = 3, arms_2 = 0,
      pants_1 = 92,   pants_2 = 0,
      shoes_1 = 46,   shoes_2 = 0,
      helmet_1 = -1,  helmet_2 = 0,
      chain_1 = 0,    chain_2 = 0,
      bproof_1 = 0,  bproof_2 = 0,
      mask_1 = -1,     mask_2 = 0,
      ears_1 = -1,     ears_2 = 0,
      glasses_1 = 0,  glasses_2 = 0,
      bracelets_1 = -1, bracelets_2 = 0,
      watches_1 = -1, watches_2 = 0,
    },
    female = {
      tshirt_1 = 14,  tshirt_2 = 0,
      torso_1 = 107,   torso_2 = 0,
      decals_1 = 0,   decals_2 = 0,
      arms = 3, arms_2 = 0,
      pants_1 = 21,   pants_2 = 0,
      shoes_1 = 0,   shoes_2 = 0,
      helmet_1 = -1,  helmet_2 = 0,
      chain_1 = 0,    chain_2 = 0,
      bproof_1 = 0,  bproof_2 = 0,
      mask_1 = -1,     mask_2 = 0,
      ears_1 = -1,     ears_2 = 0,
      glasses_1 = 12,  glasses_2 = 0,
      bracelets_1 = -1, bracelets_2 = 0,
      watches_1 = -1, watches_2 = 0,
    }
  }
}
