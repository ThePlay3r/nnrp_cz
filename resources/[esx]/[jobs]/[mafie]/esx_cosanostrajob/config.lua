Config                            = {}
Config.DrawDistance               = 100.0
Config.MarkerType                 = 1
Config.MarkerSize                 = { x = 1.5, y = 1.5, z = 1.0 }
Config.MarkerColor                = { r = 50, g = 50, b = 204 }
Config.EnablePlayerManagement     = true
Config.EnableArmoryManagement     = true
Config.EnableESXIdentity          = true -- only turn this on if you are using esx_identity
Config.EnableNonFreemodePeds      = false -- turn this on if you want custom peds
Config.EnableSocietyOwnedVehicles = false
Config.EnableLicenses             = true
Config.MaxInService               = -1
Config.Locale                     = 'en'

Config.ShopCoords = {
  coords = vector3(-2677.35, 1306.05, 155.93),
  heading = 85.18,
}
Config.SpawnPoints = {
	{coords = vector3(-2669.07, 1305.01, 146.12), heading = 268.35, radius = 2},
}

Config.AuthorizedVehicles = {
	{model = 'g770', label = 'Lumma G770', price = 1, props = {modEngine = 3, modTransmission = 2, modBrakes = 2, modTurbo = 1}},
}

Config.VehicleShopCoords = {
	coords = vector3(939.08, -208.73, 82.73),
	heading = 42.14,
}

Config.AuthorizedVehiclesTaxi = {
	{model = 'caravantaxi', label = 'Taxi', price = 1, props = {color1 = 42, color2 = 42}}
}

Config.SpawnPointsTaxi = {
	{ coords = {x = 919.61, y = -163.56, z = 74.79}, heading = 99.71, radius = 2.0 },
	{ coords = {x = 918.16, y = -167.2, z = 74.61}, heading = 99.02, radius = 2.0 },
	{ coords = {x = 916.37, y = -170.66, z = 74.43}, heading = 94.27, radius = 2.0 },
}


Config.CosaNostraStations = {

  CosaNostra = {

	Blip = {
		Pos     = { x = 425.130, y = -979.558, z = 30.711 },
		Sprite  = 60,
		Display = 4,
		Scale   = 1.2,
		Colour  = 29,
	},

	Cloakrooms = {
	  { x = -2675.26, y = 1307.35, z = 151.01},
	  { x = 899.05, y = -168.13, z = 73.17},
	},

	Armories = {
		{ x = -2675.55, y = 1327.61, z = 139.88},
		{ x = 243.65, y = 370.87, z = 104.74},
	},

	BossActions = {
		{ x = -2677.92, y = 1339.92, z = 151.02},
		{ x = 909.84, y = -152.92, z = 74.17},
	  },

	Vehicles = {
	  {
		Spawner    = { x = -2669.92, y = 1301.88, z = 147.45},
		SpawnPoint = { x = 0, y = 0, z = 0 },
		Heading    = 268.35,
		MarkerSize = { x = 1.0, y = 1.0, z = 1.0},
		MarkerColor = {r = 12, g = 130, b = 18},
		type = 36,
	  }
	},

	Vehicles2 = {
		{
		  Spawner    = {x = 913.43, y = -158.77, z = 74.5},
		  SpawnPoint = { x = 0, y = 0, z = 0 },
		  Heading    = 268.35,
		  MarkerSize = { x = 1.0, y = 1.0, z = 1.0},
		  MarkerColor = {r = 204, g = 204, b = 0},
		  type = 36,
		}
	  },
  

	Clothes = {
		male = {
			tshirt_1 = 15,  tshirt_2 = 0,
			torso_1 = 13,   torso_2 = 8,
			decals_1 = 0,   decals_2 = 0,
			arms = 28, arms_2 = 0,
			pants_1 = 4,   pants_2 = 0,
			shoes_1 = 30,   shoes_2 = 1,
			helmet_1 = 7,  helmet_2 = 2,
			chain_1 = 11,    chain_2 = 2,
			bproof_1 = 0,  bproof_2 = 0,
			mask_1 = -1,     mask_2 = 0,
			ears_1 = 0,     ears_2 = 0,
			glasses_1 = 5,  glasses_2 = 0,
			bracelets_1 = -1, bracelets_2 = 0,
			watches_1 = -1, watches_2 = 0,
		},
		female = {
			tshirt_1 = 0,  tshirt_2 = 0,
			torso_1 = 0,   torso_2 = 0,
			decals_1 = 0,   decals_2 = 0,
			arms = 0, arms_2 = 0,
			pants_1 = 0,   pants_2 = 0,
			shoes_1 = 0,   shoes_2 = 0,
			helmet_1 = -1,  helmet_2 = 0,
			chain_1 = 0,    chain_2 = 0,
			bproof_1 = 0,  bproof_2 = 0,
			mask_1 = -1,     mask_2 = 0,
			ears_1 = -1,     ears_2 = 0,
			glasses_1 = 12,  glasses_2 = 0,
			bracelets_1 = -1, bracelets_2 = 0,
			watches_1 = -1, watches_2 = 0,
		},
	},

	AuthorizedWeapons = {},

	-- nepouziva se
	AuthorizedVehicles = {},

	-- nepouziva se
	Helicopters = {
	  {
		Spawner    = { x = 0, y = 0, z = 0 },
		SpawnPoint = { x = 112.94457244873, y = -3102.5942382813, z = 6.0050659179688 },
		Heading    = 0.0,
	  }
	},

	-- nepouziva se
	VehicleDeleters = {
	  { x = 0, y = 0, z = 0 },
	  
	},
  },

}
