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
  coords = vector3(1423.5, 1117.74, 114.54),
  heading = 25.83,
}
Config.SpawnPoints = {
	{coords = vector3(1398.02, 1117.61, 114.84), heading = 90.81, radius = 2},
	{coords = vector3(1409.38, 1118.07, 114.84), heading = 90.0, radius = 2},
}

Config.AuthorizedVehicles = {
	{model = 'c5rs6', label = 'Audi RS6', price = 1},
	{model = 'kuruma', label = 'Kurkuma', price = 1},
}

Config.PulyaStations = {

  Pulya = {

	Blip = {
		Pos     = { x = 425.130, y = -979.558, z = 30.711 },
		Sprite  = 60,
		Display = 4,
		Scale   = 1.2,
		Colour  = 29,
	},

	Cloakrooms = {
	  { x = 0.0, y = 0.0, z = 0.0},
	},

	Armories = {
		{ x = 1444.17, y = 1131.72, z = 113.33},
	},

	BossActions = {
		{ x = 1392.73, y = 1160.16, z = 113.37},
	  },

	Vehicles = {
	  {
		Spawner    = { x = 1403.81, y = 1122.3, z = 114.84},
		SpawnPoint = { x = 0, y = 0, z = 0 },
		Heading    = 113.52,
		MarkerSize = { x = 1.0, y = 1.0, z = 1.0},
		MarkerColor = {r = 0, g = 0, b = 0},
		type = 36,
	  }
	},

	Clothes = {
		male = {},
		female = {},
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
