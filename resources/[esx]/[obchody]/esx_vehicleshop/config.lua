Config                            = {}
Config.DrawDistance               = 100
Config.MarkerColor                = {r = 120, g = 120, b = 240}
Config.EnablePlayerManagement     = false -- enables the actual car dealer job. You'll need esx_addonaccount, esx_billing and esx_society
Config.ResellPercentage           = 50

Config.Locale = 'cs'

Config.LicenseEnable = false -- require people to own drivers license when buying vehicles? Only applies if EnablePlayerManagement is disabled. Requires esx_license

-- looks like this: 'LLL NNN'
-- The maximum plate length is 8 chars (including spaces & symbols), don't go past it!
Config.PlateLetters  = 3
Config.PlateNumbers  = 3
Config.PlateUseSpace = true

Config.CarsRequiredMods = {
	['porsche9114scp'] = {modFender = 0, extras = {["1"] = false, ["12"] = false}},
	['models'] = {extras = {["3"] = false}},
}

Config.VehicleLimit = {
    [0] = 30000, --Compact
    [1] = 30000, --Sedan
    [2] = 50000, --SUV
    [3] = 40000, --Coupes
    [4] = 25000, --Muscle
    [5] = 25000, --Sports Classics
    [6] = 25000, --Sports
    [7] = 25000, --Super
    [8] = 10000, --Motorcycles
    [9] = 60000, --Off-road
    [10] = 500000, --Industrial
    [11] = 220000, --Utility
    [12] = 350000, --Vans
    [13] = 0, --Cycles
    [14] = 100000, --Boats
    [15] = 100000, --Helicopters
    [16] = 100000, --Planes
    [17] = 100000, --Service
    [18] = 100000, --Emergency
    [19] = 0, --Military
    [20] = 800000, --Commercial
    [21] = 0 --Trains
}


Config.Zones = {

	ShopEntering = {
		Pos   = vector3(-33.7, -1102.0, 25.4),
		Size  = {x = 1.5, y = 1.5, z = 1.0},
		Type  = 1
	},

	ShopInside = {
		Pos     = vector3(-47.5, -1097.2, 25.4),
		Size    = {x = 1.5, y = 1.5, z = 1.0},
		Heading = -20.0,
		Type    = -1
	},

	ShopOutside = {
		Pos     = vector3(-36.6, -1078.93, 25.64),
		Size    = {x = 1.5, y = 1.5, z = 1.0},
		Heading = 70.0,
		Type    = -1
	},

	ShopEnteringSpecky = {
		Pos   = vector3(-909.74, -223.92, 38.91),
		Size  = {x = 1.5, y = 1.5, z = 1.0},
		Type  = 1
	},

	ShopInsideSpecky = {
		Pos     = vector3(-903.53, -231.36, 39.95),
		Size    = {x = 1.5, y = 1.5, z = 1.0},
		Heading = 243.53,
		Type    = -1
	},

	ShopOutsideSpecky = {
		Pos     = vector3(-903.53, -231.36, 39.95),
		Size    = {x = 1.5, y = 1.5, z = 1.0},
		Heading = 243.53,
		Type    = -1
	},

	BossActions = {
		Pos   = vector3(-32.0, -1114.2, 25.4),
		Size  = {x = 1.5, y = 1.5, z = 1.0},
		Type  = -1
	},

	DealerActions = {
		Pos   = vector3(-32.18, -1111.99, 25.42),
		Size  = {x = 1.5, y = 1.5, z = 1.0},
		Color = {r = 255, g = 255, b = 0},
		Type  = 1
	},

	GiveBackVehicle = {
		Pos   = vector3(-18.2, -1078.5, 25.6),
		Size  = {x = 3.0, y = 3.0, z = 1.0},
		Type  = (Config.EnablePlayerManagement and 1 or -1)
	},

	DestroyVehicle = {
		Pos   = vector3(1356.06, -2092.82, 51.0),
		Size  = {x = 7.0, y = 7.0, z = 1.5},
		Color = {r = 255, g = 162, b = 0},
		Type  = 1
	},

	ReturnRentedCar = {
		Pos   = vector3(-33.96, -1095.75, 25.42),
		Size  = {x = 3.0, y = 3.0, z = 0.5},
		Color = {r = 0, g = 255, b = 0},
		Type  = 1
	},
}
