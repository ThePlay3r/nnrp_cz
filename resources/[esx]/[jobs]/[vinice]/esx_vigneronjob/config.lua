Config                            = {}
Config.DrawDistance               = 100.0
Config.MaxInService               = -1
Config.EnablePlayerManagement     = true
Config.EnableSocietyOwnedVehicles = false
Config.EnableLicenses = true
Config.Locale = 'en'

Config.AuthorizedVehicles = {
	{ label = 'Truck',  model = 'f10056c', price = 1},
	{ label = 'Ford Raptor', model = 'frr', price = 1},
	{ label = 'Vapid Speedo', model = 'nspeedofiremni', price = 1, props = {modLivery = 12}},
}

Config.VehicleSpawnPoints = {
	{ coords = vector3(-1889.33, 2045.53, 140.87), heading = 67.97, radius = 2.0 },
}
Config.VehicleShopCoords = {
	coords = vector3(-1957.78, 2123.37, 147.38),
	heading = 0.0,
}



Config.Zones = {

	RaisinFarm = {
		Pos   = {x = -1786.46, y = 2196.27, z = 55.48},
		Size  = {x = 60.5, y = 60.5, z = 10.0},
		Color = {r = 136, g = 243, b = 216},
		Name  = "Sber hroznu",
		Type  = 0
	},


	TraitementVin = {
		Pos   = {x = 150.18, y = 322.45, z = 111.14},
		Size  = {x = 3.5, y = 3.5, z = 2.0},
		Color = {r = 136, g = 243, b = 216},
		Name  = "Výroba vína",
		Type  = 1
	},

	TraitementJus = {
		Pos   = {x = 811.337, y = 2179.402, z = 51.388},
		Size  = {x = 3.5, y = 3.5, z = 2.0},
		Color = {r = 136, g = 243, b = 216},
		Name  = "Výroba džusu",
		Type  = 1
	},
	
	SellFarm = {
		Pos   = {x = 387.08, y = -772.0, z = 28.29},
		Size  = {x = 3.5, y = 3.5, z = 2.0},
		Color = {r = 136, g = 243, b = 216},
		Name  = "Prodej vína",
		Type  = 1
	},

	VigneronActions = {
		Pos   = {x = -1898.27, y = 2061.76, z = 140.92},
		Size  = {x = 1.5, y = 1.5, z = 1.0},
		Color = {r = 136, g = 243, b = 216},
		Name  = "Akce",
		Type  = 21
	 },
	  
	VehicleSpawner = {
		Pos   = {x = -1891.15, y = 2042.08, z = 139.94},
		Size = {x = 1.5, y = 1.5, z = 1.0},
		Color = {r = 136, g = 243, b = 216},
		Name  = "Garage",
		Type  = 1
	},

	-- nepouziva se
	VehicleSpawnPoint = {
		Pos   = {x = 0, y = 0, z = 0},
		Size  = {x = 1.5, y = 1.5, z = 1.0},
		Color = {r = 136, g = 243, b = 216},
		Name  = "Spawn point",
		Type  = -1
	},

	-- nepouziva se
	VehicleDeleter = {
		Pos   = {x = 0, y = 0, z = 0},
		Size  = {x = 3.0, y = 3.0, z = 1.0},
		Color = {r = 136, g = 243, b = 216},
		Name  = "Ranger son véhicule",
		Type  = 0
	}

}

