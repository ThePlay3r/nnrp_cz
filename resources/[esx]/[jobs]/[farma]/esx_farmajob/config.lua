Config                              = {}
Config.Locale                       = 'cs'
Config.MarkersDrawDistance          = 90.0
Config.HarvestTime = 2000
Config.Blips = {
	Farma = {
		Pos     = vector3(2449.73, 4968.01, 46.57),
		Sprite  = 384,
		Display = 4,
		Scale   = 1.2,
		Colour  = 0,
		label = 'Farma O\'Neill',
		IsPublic = true,
	},
	
	Sell = {
		Pos     = vector3(-3152.67, 1110.23, 20.87),
		Sprite  = 384,
		Display = 4,
		Scale   = 1.2,
		Colour  = 0,
		label = 'Farma O\'Neill - Prodej',
		IsPublic = false,
	},
}


local Price = 65
Config.Zones = {
	BossActions = {
		Pos   = {x = 2445.31, y = 4988.68, z = 50.56},
		Size  = { x = 1.2, y = 1.2, z = 0.5 },
		Color = { r = 0, g = 100, b = 0 },
		Type  = 1,
	},

	Cloakrooms = {
		Pos   = {x = 2443.09, y = 4965.18, z = 45.81},
		Size  = { x = 1.2, y = 1.2, z = 0.5 },
		Color = { r = 255, g = 187, b = 255 },
		Type  = 1,
	},

	Vaults = {
		Pos   = {x = 2415.56, y = 4993.36, z = 45.23},
		Size  = { x = 1.2, y = 1.2, z = 0.5 },
		Color = { r = 30, g = 144, b = 255 },
		Type  = 1,
	},

	Sell = {
		Pos     = {x = -3150.14, y = 1108.77, z = 20.06},
		Size  = { x = 1.0, y = 1.0, z = 0.4 },
		Color = { r = 255, g = 255, b = 255 },
		Type  = 1,
		Items = {
			{item = 'avocado', price = Price},
			{item = 'freshcoffe', price = Price},
			{item = 'coco', price = Price},
			{item = 'lime', price = Price},
			{item = 'mango', price = Price},
			{item = 'potato', price = Price},
			{item = 'garlic', price = Price},
			{item = 'onion', price = Price},
			{item = 'strawberries', price = Price},
			{item = 'flour', price = Price},
			{item = 'carrot', price = Price},
			{item = 'cucumber', price = Price},
			{item = 'ginger', price = Price},
			{item = 'alface', price = Price},
			{item = 'pomrdanc', price = Price},
			{item = 'lemon', price = Price},
			{item = 'tresen', price = Price},
			{item = 'olives', price = Price},
			{item = 'tomate', price = Price},
			{item = 'pepperoni', price = Price},
			{item = 'rice', price = Price},
			{item = 'apple', price = Price},
		},
	},

	Vehicles = {
		Pos          = vector3(2409.13, 4992.78, 46.3),
		Size         = { x = 1.0, y = 1.0, z = 1.0 },
		Color        = { r = 40, g = 255, b = 0 },
		Type         = 36,
		Heading      = 207.43,
	}
}


Config.Clothes = {

}


Config.ProductsMarker = {
	Size  = { x = 3.0, y = 3.0, z = 1.2 },
	Color = { r = 37, g = 156, b = 43 },
	Type  = 1,
}

Config.Products = {
	{coords = vector3(2346.34,5008.53, 41.83), item = 'avocado'},
	{coords = vector3(2357.96, 5018.34, 42.81), item = 'freshcoffe'},
	{coords = vector3(2367.57, 5011.94, 43.25), item = 'coco'},
	{coords = vector3(2363.1, 5003.25, 42.56), item = 'lime'},
	{coords = vector3(2351.52, 4990.64, 42.07), item = 'mango'},
	{coords = vector3(2361.58,4990.84, 42.34), item = 'pomrdanc'},
	{coords = vector3(2336.16, 4978.23, 41.6), item = 'apple'},
	{coords = vector3(2334.65,4997.14, 41.19), item = 'lemon'},
	{coords = vector3(2333.55,5006.46, 41.38), item = 'tresen'},
	{coords = vector3(2342.44,5020.55, 42.34), item = 'olives'},
	{coords = vector3(2477.2, 4833.0, 34.46), item = 'potato'},
	{coords = vector3(2465.52, 4838.24, 35.06), item = 'garlic'},
	{coords = vector3(2461.86, 4848.06, 36.14), item = 'onion'},
	{coords = vector3(2502.23, 4841.56, 34.89), item = 'strawberries'},
	{coords = vector3(2511.66, 4850.88, 35.57), item = 'flour'},
	{coords = vector3(2517.25, 4860.46, 36.92), item = 'carrot'},
	{coords = vector3(2530.08, 4846.22, 35.26), item = 'cucumber'},
	{coords = vector3(2520.17, 4836.81, 34.33), item = 'ginger'},
	{coords = vector3(2510.18, 4827.99, 34.0), item = 'alface'},
	{coords = vector3(2502.23, 4817.51, 34.06), item = 'tomate'},
	{coords = vector3(2511.09, 4808.23, 33.49), item = 'pepperoni'},
	{coords = vector3(2512.38, 4867.4, 37.45), item = 'rice'},
}

Config.VehicleShopCoords = {
	coords = vector3(2409.1, 4971.73, 46.08),
	heading = 215.17,
}
Config.SpawnPoints = {
	{ coords = vector3(2408.63, 4985.92, 46.18), heading = 170.0, radius = 2.0 },
}
Config.AuthorizedVehicles = {
	{ model = 'f15078',  label = 'Ford F150 1978', price = 1 },
	{ model = 'nspeedofiremni',  label = 'Vapid Speedo', price = 1, props = { modLivery = 4} },
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