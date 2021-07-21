Config.AuthorizedVehicles = {
	-- { model = 'regalia',  label = 'Quartz Regalia (vedeni)', price = 1, props = {modEngine = 3, modTransmission = 2, modBrakes = 2, modTurbo = 1}, jobGrades = {'boss'}},
	{ model = 'raptor150',  label = 'Ford Raptor 2017', price = 1 },
	{ model = 'nspeedofiremni',  label = 'Vapid Speedo', price = 1, props = { modLivery = 13} },
	{ model = '2015s3',  label = 'Audi S3', price = 1 },
}

Config.AuthorizedHeli = {
	{ model = 'swift2', label = 'Swift', price = 20000000, props = {color1 = 134, color2 = 134}},
}

Config.AuthorizedBoats = {
	{ name = 'seashark', label = 'Vodní skůtr' },
}

Config.SpawnPoints = {
	{ coords = vector3(-2103.592, -480.23, 12.1), heading = 205.43, radius = 2.0 },
	{ coords = vector3(-2094.137, -477.17, 12.1), heading = 193.00, radius = 2.0 },
	{ coords = vector3(-2086.047, -476.08, 12.1), heading = 179.43, radius = 2.0 },
	{ coords = vector3(-2077.836, -477.969, 12.1), heading = 154.43, radius = 2.0 },
}

Config.SpawnPointsHeli = {
	{ coords = vector3(-2319.81, -658.31, 13.48), heading = 88.59, radius = 2.0 },
}


Config.VehicleShopCoords = {
	coords = vector3(-2135.39, -484.93, 3.20),
	heading = 135.0,
}

Config.Zones['Vehicles'] = {
	Pos          = { x = -2110.35, y = -482.71, z = 12.1 },
	Size         = { x = 1.0, y = 1.0, z = 1.0 },
	Color        = { r = 255, g = 255, b = 0 },
	Type         = 36,
	Heading      = 207.43,
}

Config.Zones['Helicopters'] = {
	Pos          = { x = -2324.58, y = -652.11, z = 13.42 },
	Size         = { x = 1.0, y = 1.0, z = 1.0 },
	Color        = { r = 255, g = 255, b = 0 },
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