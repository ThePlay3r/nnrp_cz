Config.AuthorizedVehicles = {
	{ model = 'stretch', label = 'Stretch', price = 1},
	{ model = 'burrito3', label = 'Burrito', price = 1},
	{ model = 'africat', label = 'Honda CRF1000L 2018 Africa', price = 1},
}

Config.AuthorizedHeli = {
	{ model = 'swift2', label = 'Swift', price = 20000000, props = {color1 = 12, color2 = 12, pearlescentColor = 42}},
}

Config.SpawnPoints = {
	{ coords = vector3(915.16, 45.82, 80.9), heading = 324.52, radius = 2.0 },
}

Config.SpawnPointsHeli = {
	{ coords = vector3(966.7489, 42.39932, 123.0272), heading = 90.996, radius = 2.0 },
}

Config.SpawnPointsHeli2 = {
	{ coords = vector3(-116.0267, 960.9817, 234.7974), heading = 224.388961, radius = 2.0 },
}

Config.VehicleShopCoords = {
	coords = vector3(955.55, -4.06, 111.32),
	heading = 122.27,
}

Config.Zones['Vehicles'] = {
	Pos          = { x = 918.59, y = 38.19, z = 81.1 },
	Size         = { x = 1.0, y = 1.0, z = 1.0 },
	Color        = { r = 255, g = 0, b = 0 },
	Type         = 36,
	Heading      = 207.43,
}

Config.Zones['Helicopters'] = {
	Pos          = { x = 969.06, y = 51.92, z = 123.12 },
	Size         = { x = 1.0, y = 1.0, z = 1.0 },
	Color        = { r = 255, g = 0, b = 0 },
	Type         = 34,
	Heading      = 207.43,
}

Config.Zones['Helicopters2'] = {
	Pos          = { x = -122.33, y = 971.04, z = 235.9 },
	Size         = { x = 1.0, y = 1.0, z = 1.0 },
	Color        = { r = 255, g = 0, b = 0 },
	Type         = 34,
	Heading      = 207.43,
}


-- nepouziva se
Config.Zones['VehicleDeleters'] = {
	Pos   = { x = 0.0, y = 0.0, z = 0.0 },
	-- Pos   = { x = -2347.79, y = -634.04, z = 0.23 },
	Size  = { x = 3.0, y = 3.0, z = 3.0 },
	Color = { r = 238, g = 0, b = 0 },
	Type  = 1,
}