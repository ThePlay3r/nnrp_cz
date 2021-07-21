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
Config.Locale = 'cs'

Config.ShopCoords = {
  coords = vector3(-715.93, 5837.79, 17.77),
  heading = 236.94,
}
Config.SpawnPoints = {
  {coords = vector3(-677.99, 5776.85, 17.33), heading = 58.44, radius = 2},
  {coords = vector3(-675.72, 5779.93, 17.33), heading = 63.16, radius = 2},
  {coords = vector3(-674.1, 5782.96, 17.33), heading = 68.51, radius = 2},
}
Config.SpawnPointsHeli = {
	{coords = vector3(-739.2266, 5814.512, 18.73196), heading = 255.3084, radius = 2},
  }

Config.AuthorizedVehicles = {
	{ model = 'fiat1300', label = 'Fiat Zastava', price = 1},
	{ model = 'nspeedofiremni', label = 'Vapid Speedo', price = 1, props = {modLivery = 8}},
	{ model = 'v60', label = 'Volvo v60', price = 1, props = {color1 = 39}},
}

Config.AuthorizedVehiclesHeli = {
	{ model = 'swift2', label = 'Swift', price = 1, props = {color1 = 39, color2 = 12}},
}

Config.GangStations = {

  Gang = {

	Blip = {
	  Pos     = { x = -692.39, y = 5798.68, z = 17.33 },
	  Sprite  = 381,
	  Display = 4,
	  Scale   = 1.2,
	  isPublic = true,
	  label = "Steakhouse",
	},

	BlipShop = {
		Pos = {x = 2568.61, y = 4652.03, z = 33.08},
		Sprite  = 381,
	  	Display = 4,
	  	Scale   = 1.2,
		isPublic = false,
		label = "Steakhouse - Suroviny",
	},

	BlipSell = {
		Pos = { x = -3151.64, y = 1105.01, z = 19.85 },
		Sprite  = 381,
	  	Display = 4,
	  	Scale   = 1.2,
		isPublic = false,
		label = "Steakhouse - Prodej",
	},

	BossActions = {
		{ x = -691.9, y = 5787.85, z = 16.33 },
	},

	Clothes = {
	  -- OBLEČENÍ PRO CHLAPY
	   male = {
		 soldato = {
			tshirt_1 = 15,  tshirt_2 = 0,
			torso_1 = 47,   torso_2 = 0,
			decals_1 = 0,   decals_2 = 0,
			arms = 11, arms_2 = 0,
			pants_1 = 10,   pants_2 = 2,
			shoes_1 = 3,   shoes_2 = 13,
			helmet_1 = -1,  helmet_2 = 0,
			chain_1 = 0,    chain_2 = 0,
			bproof_1 = 0,  bproof_2 = 0,
			mask_1 = -1,     mask_2 = 0,
			ears_1 = -1,     ears_2 = 0,
			glasses_1 = 0,  glasses_2 = 0,
			bracelets_1 = -1, bracelets_2 = 0,
			watches_1 = -1, watches_2 = 0,
		 },
		 capo = {
			tshirt_1 = 6,  tshirt_2 = 12,
			torso_1 = 29,   torso_2 = 3,
			decals_1 = 0,   decals_2 = 0,
			arms = 11, arms_2 = 0,
			pants_1 = 33,   pants_2 = 0,
			shoes_1 = 24,   shoes_2 = 7,
			helmet_1 = -1,  helmet_2 = 0,
			chain_1 = 0,    chain_2 = 0,
			bproof_1 = 0,  bproof_2 = 0,
			mask_1 = -1,     mask_2 = 0,
			ears_1 = -1,     ears_2 = 0,
			glasses_1 = 0,  glasses_2 = 0,
			bracelets_1 = -1, bracelets_2 = 0,
			watches_1 = -1, watches_2 = 0,
		 },
		 consigliere = {
			tshirt_1 = 15,  tshirt_2 = 0,
			torso_1 = 12,   torso_2 = 0,
			decals_1 = 0,   decals_2 = 0,
			arms = 12, arms_2 = 0,
			pants_1 = 10,   pants_2 = 7,
			shoes_1 = 46,   shoes_2 = 0,
			helmet_1 = 12,  helmet_2 = 7,
			chain_1 = 0,    chain_2 = 0,
			bproof_1 = 0,  bproof_2 = 0,
			mask_1 = -1,     mask_2 = 0,
			ears_1 = -1,     ears_2 = 0,
			glasses_1 = 0,  glasses_2 = 0,
			bracelets_1 = -1, bracelets_2 = 0,
			watches_1 = -1, watches_2 = 0,
		 },
		 sefkuchar = {
			tshirt_1 = 15,  tshirt_2 = 0,
			torso_1 = 12,   torso_2 = 0,
			decals_1 = 0,   decals_2 = 0,
			arms = 12, arms_2 = 0,
			pants_1 = 10,   pants_2 = 7,
			shoes_1 = 46,   shoes_2 = 0,
			helmet_1 = 12,  helmet_2 = 7,
			chain_1 = 0,    chain_2 = 0,
			bproof_1 = 0,  bproof_2 = 0,
			mask_1 = -1,     mask_2 = 0,
			ears_1 = -1,     ears_2 = 0,
			glasses_1 = 0,  glasses_2 = 0,
			bracelets_1 = -1, bracelets_2 = 0,
			watches_1 = -1, watches_2 = 0,
		 },
		 lowerboss1 = {
			tshirt_1 = 10,  tshirt_2 = 5,
			torso_1 = 119,   torso_2 = 0,
			decals_1 = 0,   decals_2 = 0,
			arms = 12, arms_2 = 0,
			pants_1 = 31,   pants_2 = 6,
			shoes_1 = 24,   shoes_2 = 2,
			helmet_1 = 12,  helmet_2 = 7,
			chain_1 = 0,    chain_2 = 0,
			bproof_1 = 0,  bproof_2 = 0,
			mask_1 = -1,     mask_2 = 0,
			ears_1 = -1,     ears_2 = 0,
			glasses_1 = 7,  glasses_2 = 0,
			bracelets_1 = -1, bracelets_2 = 0,
			watches_1 = -1, watches_2 = 0,
		 },
		boss = {
			tshirt_1 = 11,  tshirt_2 = 14,
			torso_1 = 32,   torso_2 = 0,
			decals_1 = 0,   decals_2 = 0,
			arms = 12, arms_2 = 0,
			pants_1 = 13,   pants_2 = 0,
			shoes_1 = 40,   shoes_2 = 1,
			helmet_1 = 12,  helmet_2 = 0,
			chain_1 = 0,    chain_2 = 0,
			bproof_1 = 0,  bproof_2 = 0,
			mask_1 = -1,     mask_2 = 0,
			ears_1 = -1,     ears_2 = 0,
			glasses_1 = 4,  glasses_2 = 4,
			bracelets_1 = -1, bracelets_2 = 0,
			watches_1 = -1, watches_2 = 0,
		},
	   },
	 -- OBLEČENÍ PRO ŽENSKÝ
	   female = {},
	 },

	Cloakrooms = {
	  { x = -685.41, y = 5793.18, z = 16.33},
	},

	Armories = {
	  { x = -695.42, y = 5787.74, z = 16.33},
	},
	Armories2 = {
		{ x = -687.11, y = 5798.41, z = 16.33},
	},
	Vault = {
		{ x = -679.8, y = 5800.1, z = 16.33},
	},

	Vehicles = {
	  {
		Spawner    = { x = -683.26, y = 5787.04, z = 17.33 },
		SpawnPoint = { x = 0, y = 0, z = 0 },
		Heading    = 113.52,
		MarkerSize = { x = 1.0, y = 1.0, z = 1.0},
		MarkerColor = {r = 255, g = 10, b = 0},
		type = 36,
	  }
	},

	AuthorizedWeapons = {},

	-- nepouziva se
	AuthorizedVehicles = {
		{ name = 'Akuma',    label = 'Moto' },
		{ name = 'Granger',   label = '4X4' },
		{ name = 'mule3',      label = 'Camion de Transport' },
	},
	
	Helicopters = {
		{
			Spawner    = { x = -731.86, y = 5814.79, z = 18.83 },
			SpawnPoint = { x = 0, y = 0, z = 0 },
			Heading    = 113.52,
			MarkerSize = { x = 1.0, y = 1.0, z = 1.0},
			MarkerColor = {r = 255, g = 10, b = 0},
			Type = 34,
		  }
	},

	-- nepouziva se
	VehicleDeleters = {
	  { x = 0, y = 0, z = 0 },
	  
	},
  },
}