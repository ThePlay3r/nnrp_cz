Config                              = {}
Config.Locale                       = 'cs'
Config.MarkersDrawDistance          = 90.0
Config.HarvestTime = 4000
Config.Blips = {
	Sidlo = {
		Pos     = vector3(523.52, -3151.39, 5.79),
		Sprite  = 388,
		Display = 4,
		Scale   = 1.6,
		Colour  = 0,
		label = 'EasyWay Delivery',
		IsPublic = true,
	},
		
	Sell = {
		Pos     = vector3(2876.76, 4461.25, 47.51),
		Sprite  = 388,
		Display = 4,
		Scale   = 1.6,
		Colour  = 0,
		label = 'EasyWay Delivery - Prodej dreva',
		IsPublic = false,
	},
	Sell2 = {
		Pos     = vector3(-69.75, 6266.18, 31.16),
		Sprite  = 388,
		Display = 4,
		Scale   = 1.6,
		Colour  = 0,
		label = 'EasyWay Delivery - Prodej kurat',
		IsPublic = false,
	},
	Sell3 = {
		Pos     = vector3(434.31, 3574.0, 33.28),
		Sprite  = 388,
		Display = 4,
		Scale   = 1.6,
		Colour  = 0,
		label = 'EasyWay Delivery - Prodej lana',
		IsPublic = false,
	},
}


Config.Zones = {
	BossActions = {
		Pos   = {x = 499.37, y = -3128.53, z = 5.07},
		Size  = { x = 1.2, y = 1.2, z = 0.5 },
		Color = { r = 0, g = 100, b = 0 },
		Type  = 1,
	},

	Cloakrooms = {
		Pos   = {x = 503.9, y = -3121.99, z = 8.79},
		Size  = { x = 1.2, y = 1.2, z = 0.5 },
		Color = { r = 255, g = 187, b = 255 },
		Type  = 1,
	},

	Vaults = {
		Pos   = {x = 465.67, y = -3128.19, z = 5.07},
		Size  = { x = 5.0, y = 5.0, z = 0.5 },
		Color = { r = 30, g = 144, b = 255 },
		Type  = 1,
	},

	Vehicles = {
		Pos          = vector3(507.9, -3167.01, 6.07),
		Size         = { x = 1.0, y = 1.0, z = 1.0 },
		Color        = { r = 40, g = 255, b = 0 },
		Type         = 36,
		Heading      = 207.43,
	},

	Sell = {
		Pos     = vector3(2876.76, 4461.25, 47.51),
		Size  = { x = 3.0, y = 3.0, z = 0.4 },
		Color = { r = 255, g = 255, b = 255 },
		Type  = 1,
		Items = {
			{item = 'packaged_plank', price = 135},
		},
	},
	Sell2 = {
		Pos     = vector3(-69.75, 6266.18, 30.16),
		Size  = { x = 3.0, y = 3.0, z = 0.4 },
		Color = { r = 255, g = 255, b = 255 },
		Type  = 1,
		Items = {
			{item = 'packaged_chicken', price = 135},
		},
	},
	Sell3 = {
		Pos     = vector3(434.31, 3574.0, 32.28),
		Size  = { x = 3.0, y = 3.0, z = 0.4 },
		Color = { r = 255, g = 255, b = 255 },
		Type  = 1,
		Items = {
			{item = 'rope', price = 135},
		},
	},
}


Config.ProductsMarker = {
	Size  = { x = 5.0, y = 5.0, z = 1.2 },
	Color = { r = 40, g = 255, b = 0 },
	Type  = 1,
}

Config.Products = {
	{coords = vector3(480.94,-3228.18, 5.07), item = 'packaged_plank'},
	{coords = vector3(462.48,-3235.61, 5.07), item = 'packaged_chicken'},
	{coords = vector3(463.67,-3191.61, 5.07), item = 'rope'},
}


Config.Clothes = {

}

Config.VehicleShopCoords = {
	coords = vector3(526.03, -3168.71, 46.3),
	heading = 357.22,
}
Config.SpawnPoints = {
	{ coords = vector3(488.33, -3148.01, 6.07), heading = 358.94, radius = 2.0 },
	{ coords = vector3(478.76, -3145.46, 6.07), heading = 358.94, radius = 2.0 },
	{ coords = vector3(492.25, -3147.36, 6.07), heading = 358.94, radius = 2.0 },
}
Config.AuthorizedVehicles = {
	{ model = 'hauler',  label = 'Hauler', price = 1 },
	{ model = 'trailers2',  label = 'Prives', price = 1 },
	{ model = 'pounder', label = 'Pounder', price = 1},
}


Config.Keys = {
    ["ESC"] = 322, ["F1"] = 288, ["F2"] = 289, ["F3"] = 170, ["F5"] = 166, ["F6"] = 167, ["F7"] = 168, ["F8"] = 169, ["F9"] = 56, ["F10"] = 57,
	["~"] = 243, ["1"] = 157, ["2"] = 158, ["3"] = 160, ["4"] = 164, ["5"] = 165, ["6"] = 159, ["7"] = 161, ["8"] = 162, ["9"] = 163, ["-"] = 84, ["="] = 83, ["BACKSPACE"] = 177,
	["TAB"] = 37, ["Q"] = 44, ["W"] = 32, ["E"] = 38, ["R"] = 45, ["T"] = 245, ["Y"] = 246, ["U"] = 303, ["P"] = 199, ["["] = 39, ["]"] = 40, ["ENTER"] = 18,
	["CAPS"] = 137, ["A"] = 34, ["S"] = 8, ["D"] = 9, ["F"] = 23, ["G"] = 47, ["H"] = 74, ["K"] = 311, ["L"] = 182,
	["LEFTSHIFT"] = 21, ["Z"] = 20, ["X"] = 73, ["C"] = 26, ["V"] = 0, ["B"] = 29, ["N"] = 249, ["M"] = 244, [","] = 82, ["."] = 81,
	["LEFTCTRL"] = 36, ["LEFTALT"] = 19, ["SPACE"] = 22, ["RIGHTCTRL"] = 70,
	["HOME"] = 213, ["PAGEUP"] = 10, ["PAGEDOWN"] = 11, ["DELETE"] = 178,
	["LEFT"] = 174, ["RIGHT"] = 175, ["TOP"] = 27, ["DOWN"] = 173,
	["NENTER"] = 201, ["N4"] = 108, ["N5"] = 60, ["N6"] = 107, ["N+"] = 96, ["N-"] = 97, ["N7"] = 117, ["N8"] = 61, ["N9"] = 118
}