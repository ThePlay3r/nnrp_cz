Config                            = {}
Config.DrawDistance               = 100.0
Config.MarkerType                 = 1
Config.MarkerSize                 = { x = 1.5, y = 1.5, z = 1.0 }
Config.MarkerColor                = { r = 50, g = 50, b = 204 }
Config.Locale = 'cs'

Config.EnablePlayerManagement     = true
Config.EnableArmoryManagement     = true
Config.EnableESXIdentity          = true -- only turn this on if you are using esx_identity
Config.EnableSocietyOwnedVehicles = false
Config.EnableLicenses             = true
Config.MaxInService               = -1

local fullExtras = {
	["1"] = true,
	["2"] = true,
	["3"] = true,
	["4"] = true,
	["5"] = true,
	["6"] = true,
	["7"] = true,
	["8"] = true,
	["9"] = true,
	["10"] = true,
	["11"] = true,
}

Config.AuthorizedVehicles = {
	{ model = 'onebeast',    label = 'Obrnena Limuzína', price = 1, jobGrades = {'boss', 'lowerboss1', 'highpresident'} },
	{ model = 'fbi',  label = 'SUV', price = 1 },
	{model = 'police4', label = 'Unmarked mercedes', price = 1, jobGrades = {'lowerboss1', 'boss'}},
}

Config.SpawnPoints = {
	{ coords = {x = -580.49, y = -138.1, z = 36.25}, heading = 202.47, radius = 2.0 },
	{ coords = {x = -575.08, y = -134.32, z = 36.0}, heading = 198.66, radius = 2.0 },
}

Config.VehicleShopCoords = {
	coords = vector3(-546.81, -166.6, 38.3),
	heading = 321.62,
}

Config.AuthorizedWeapons = {
	{weapon = 'WEAPON_COMBATPISTOL', components = {0, 0, 500, 500, nil}, price = 300000},
	{weapon = 'WEAPON_ADVANCEDRIFLE', components = {0, 500, 500, 500, 500, nil}, price = 500000},
	{weapon = 'WEAPON_COMBATPDW', components = {0, 500, 500, 500, 500, nil}, price = 5000000},
	{weapon = 'WEAPON_PUMPSHOTGUN', components = {500, 500, nil}, price = 700000},
	{weapon = 'WEAPON_CARBINERIFLE', components = {0, 500, 500, 500, 500, nil}, price = 5000000},
	{weapon = 'WEAPON_NIGHTSTICK', price = 200},
	{weapon = 'WEAPON_STUNGUN', price = 1500},
	{weapon = 'WEAPON_FLASHLIGHT', price = 800}
}

Config.StateStations = {

  State = {

	Blip = {
		Pos     = { x = -549.07, y = -196.98, z = 38.22 },
		Sprite  = 419,
		Display = 4,
		Scale   = 1.2,
	},

	Clothes = {
		-- OBLEČENÍ PRO CHLAPY
		male = {
			vicepresident = {
				['tshirt_1'] = 10, ['tshirt_2'] = 0,
				['torso_1'] = 32, ['torso_2'] = 0,
				['arms'] = 29,
				['chain_1'] = 10, ['chain_2'] = 0,
				['pants_1'] = 17, ['pants_2'] = 1,
				['shoes_1'] = 55, ['shoes_2'] = 0,
				['glasses_1'] = 7, ['glasses_2'] = 0,
				['mask_1'] = 12, ['mask_2'] = 0,
			},
			president = {
				['tshirt_1'] = 10, ['tshirt_2'] = 0,
				['torso_1'] = 32, ['torso_2'] = 0,
				['arms'] = 29,
				['chain_1'] = 10, ['chain_2'] = 0,
				['pants_1'] = 17, ['pants_2'] = 1,
				['shoes_1'] = 55, ['shoes_2'] = 0,
				['glasses_1'] = 7, ['glasses_2'] = 0,
				['mask_1'] = 12, ['mask_2'] = 0,
			},
			highpresident = {
				['tshirt_1'] = 4, ['tshirt_2'] = 0,
				['torso_1'] = 10, ['torso_2'] = 0,
				['arms'] = 4,
				['chain_1'] = 23,
				['bproof_1'] = 0, ['bproof_2'] = 0,
				['pants_1'] = 10, ['pants_2'] = 0,
				['shoes_1'] = 15, ['shoes_2'] = 0,
			},
			realestateagent = {
				['tshirt_1'] = 24, ['tshirt_2'] = 0,
				['torso_1'] = 27, ['torso_2'] = 3,
				['arms'] = 4,
				['chain_1'] = 23, ['chain_2'] = 11,
				['bproof_1'] = 0, ['bproof_2'] = 0,
				['pants_1'] = 17, ['pants_2'] = 1,
				['shoes_1'] = 10, ['shoes_2'] = 0,
			},
			lowerboss1 = {
				['tshirt_1'] = 4, ['tshirt_2'] = 0,
				['torso_1'] = 4, ['torso_2'] = 0,
				['arms'] = 4,
				['chain_1'] = 24, ['chain_2'] = 15,
				['bproof_1'] = 0, ['bproof_2'] = 0,
				['pants_1'] = 17, ['pants_2'] = 2,
				['shoes_1'] = 10, ['shoes_2'] = 0,
			},
			boss = {
				['tshirt_1'] = 4, ['tshirt_2'] = 0,
				['torso_1'] = 10, ['torso_2'] = 0,
				['arms'] = 4,
				['chain_1'] = 13,
				['bproof_1'] = 0, ['bproof_2'] = 0,
				['pants_1'] = 10, ['pants_2'] = 0,
				['shoes_1'] = 10, ['shoes_2'] = 0,
			}
		},
		-- OBLEČENÍ PRO ŽENSKÝ
		female = {
			vicepresident = {
				['tshirt_1'] = 41, ['tshirt_2'] = 2,
				['torso_1'] = 6, ['torso_2'] = 0,
				['arms'] = 1,
				['chain_1'] = 0,
				['bproof_1'] = 0, ['bproof_2'] = 0,
				['pants_1'] = 7, ['pants_2'] = 0,
				['shoes_1'] = 0, ['shoes_2'] = 0,
			},
			president = {
				['tshirt_1'] = 41, ['tshirt_2'] = 2,
				['torso_1'] = 6, ['torso_2'] = 4,
				['arms'] = 1,
				['chain_1'] = 0,
				['bproof_1'] = 0, ['bproof_2'] = 0,
				['pants_1'] = 6, ['pants_2'] = 0,
				['shoes_1'] = 7, ['shoes_2'] = 0,
			},
			highpresident = {
				['tshirt_1'] = 41, ['tshirt_2'] = 2,
				['torso_1'] = 6, ['torso_2'] = 4,
				['arms'] = 1,
				['chain_1'] = 0,
				['bproof_1'] = 0, ['bproof_2'] = 0,
				['pants_1'] = 6, ['pants_2'] = 0,
				['shoes_1'] = 7, ['shoes_2'] = 0,
			},
			realestateagent = {
				['tshirt_1'] = 41, ['tshirt_2'] = 1,
				['torso_1'] = 7, ['torso_2'] = 1,
				['arms'] = 3,
				['chain_1'] = 0,
				['bproof_1'] = 0, ['bproof_2'] = 0,
				['pants_1'] = 7, ['pants_2'] = 1,
				['shoes_1'] = 0, ['shoes_2'] = 2,
			},
			lowerboss1 = {
				['tshirt_1'] = 41, ['tshirt_2'] = 0,
				['torso_1'] = 67, ['torso_2'] = 0,
				['arms'] = 3,
				['chain_1'] = 0,
				['bproof_1'] = 0, ['bproof_2'] = 0,
				['pants_1'] = 7, ['pants_2'] = 0,
				['shoes_1'] = 0, ['shoes_2'] = 0,
			},
			boss = {
				['tshirt_1'] = 4, ['tshirt_2'] = 0,
				['torso_1'] = 10, ['torso_2'] = 0,
				['arms'] = 4,
				['chain_1'] = 13,
				['bproof_1'] = 0, ['bproof_2'] = 0,
				['pants_1'] = 10, ['pants_2'] = 0,
				['shoes_1'] = 10, ['shoes_2'] = 0,
			},
		},
	},


	AuthorizedVehicles = {
		{ name = 'volatus', label = 'Helikoptéra', type = 'heli' },
	},

	Cloakrooms = {
		{ x = -550.56, y = -182.29, z = 37.22 },
		Heading = 357.10,
	},

	Armories = {
		{ x = -550.52, y = -199.69, z = 46.41 },
		Heading = 17.57,
	},

	VehicleSpawner = {
		Pos   = {x = -579.07, y = -151.1, z = 37.95},
		Size  = {x = 1.0, y = 1.0, z = 1.0},
		Color = {r = 0, g = 0, b = 255},
		Type  = 36, Rotate = false
	},

	-- pro helikoptery
	Vehicles = {
	  {
		Spawner    = vector3(-497.54, -227.43, 35.41),
		SpawnPoint = { x = -574.35, y = -168.19, z = 36.95 },
		SpawnPointHeli = vector3(-505.08, -234.81, 36.0),
		Heading    = 293.74,
		HeliHeading = 217.0,
	  }
	},

	-- nepouziva se
	Helicopters = {
	  {
		Spawner    = { x = -607.04, y = -128.3, z = 39.01 },
		SpawnPoint = { x = -606.59, y = -135.8, z = 39.01 },
		Heading    = 0.0,
	  }
	},

	VehicleDeleters = {
	--   { x = -574.82, y = -153.05, z = 36.9, MarkerSize = { x = 1.5, y = 1.5, z = 1.0 } },
	  { x = -505.08, y = -234.81, z = 37.0, MarkerSize = {x = 9.5, y = 9.5, z = 1.5} },
	},

	BossActions = {
	  { x = -543.79, y = -202.12, z = 46.41 },
	  Heading    = 3.36,
	},

  },
  
}