Config                              = {}
Config.Locale                       = 'cs'
Config.MarkersDrawDistance          = 90.0
Config.HarvestTime = 1500
Config.CookTime = 3000
Config.Blips = {
	Ranch = {
		Pos     = vector3(1384.65, 1146.41, 114.88),
		Sprite  = 209,
		Display = 4,
		Scale   = 1.2,
		Colour  = 46,
		label = 'Ranch New Texas',
		IsPublic = true,
	},
	
	Sell = {
		Pos     = vector3(1589.44, 6448.99, 24.32),
		Sprite  = 209,
		Display = 4,
		Scale   = 1.2,
		Colour  = 46,
		label = 'Ranch New Texas - Prodej',
		IsPublic = false,
	},
}


local Price1 = 50
local Price2 = 125
local Price3 = 200

Config.Zones = {
	BossActions = {
		Pos   = {x = 1394.49, y = 1159.91, z = 113.37},
		Size  = { x = 1.2, y = 1.2, z = 0.5 },
		Color = { r = 0, g = 100, b = 0 },
		Type  = 1,
	},

	Cloakrooms = {
		Pos   = {x = 1443.73, y = 1131.22, z = 113.33},
		Size  = { x = 1.2, y = 1.2, z = 0.5 },
		Color = { r = 121, g = 93, b = 2 },
		Type  = 1,
	},

	Vaults = {
		Pos   = {x = 1441.08, y = 1142.38, z = 113.33},
		Size  = { x = 1.4, y = 1.4, z = 0.5 },
		Color = { r = 30, g = 144, b = 255 },
		Type  = 1,
	},

	Armory = {
		Pos   = {x = 1392.02, y = 1160.27, z = 113.37},
		Size  = { x = 1.2, y = 1.2, z = 0.5 },
		Color = { r = 30, g = 144, b = 255 },
		Type  = 1,
	},

	Transform = {
		Pos     = vector3(1451.04, 1134.42, 113.33),
		Size  = { x = 1.5, y = 1.5, z = 1.2 },
		Color = { r = 40, g = 255, b = 0 },
		Type  = 1,
		FromItem = 'mleko',
		ToItem = 'slehacka',
	},

	Transform2 = {
		Pos     = vector3(1452.51, 1137.29, 113.33),
		Size  = { x = 1.5, y = 1.5, z = 1.2 },
		Color = { r = 40, g = 255, b = 0 },
		Type  = 1,
		FromItem = 'mleko',
		ToItem = 'smetana',
	},

	Transform3 = {
		Pos     = vector3(1455.5, 1137.4, 113.33),
		Size  = { x = 1.5, y = 1.5, z = 1.2 },
		Color = { r = 40, g = 255, b = 0 },
		Type  = 1,
		FromItem = 'mleko',
		ToItem = 'queijo',
	},

	Transform4 = {
		Pos     = vector3(1454.81, 1134.75, 113.33),
		Size  = { x = 1.5, y = 1.5, z = 1.2 },
		Color = { r = 40, g = 255, b = 0 },
		Type  = 1,
		FromItem = 'mleko',
		ToItem = 'manteiga',
	},

	Sell = {
		Pos     = {x = 1589.44, y = 6448.99, z = 24.32},
		Size  = { x = 3.0, y = 3.0, z = 1.0 },
		Color = { r = 255, g = 255, b = 255 },
		Type  = 1,
		Items = {
			{item = 'mleko', price = Price1},
			{item = 'smetana', price = Price2},
			{item = 'slehacka', price = Price2},
			{item = 'manteiga', price = Price2},
			{item = 'queijo', price = Price2},
			{item = 'pork', price = Price3},
			{item = 'vitela', price = Price3},
		},
	},

	Vehicles = {
		Pos          = vector3(1415.46, 1122.13, 114.84),
		Size         = { x = 1.0, y = 1.0, z = 1.0 },
		Color        = { r = 121, g = 93, b = 2 },
		Type         = 36,
		Heading      = 234.07,
	}
}


Config.Clothes = {
	ranch_outfit = {
		male = {
			tshirt_1 = 15,  tshirt_2 = 0,
			torso_1 = 60,   torso_2 = 0,
			decals_1 = 0,   decals_2 = 0,
			arms = 21, arms_2 = 1,
			pants_1 = 0,   pants_2 = 11,
			shoes_1 = 12,   shoes_2 = 6,
			helmet_1 = 58,  helmet_2 = 2,
			chain_1 = 0,    chain_2 = 0,
			bproof_1 = 0,  bproof_2 = 0,
			mask_1 = -1,     mask_2 = 0,
			ears_1 = -1,     ears_2 = 0,
			glasses_1 = 0,  glasses_2 = 0,
			bracelets_1 = -1, bracelets_2 = 0,
			watches_1 = -1, watches_2 = 0,
		},
	}
}


Config.ProductsMarker = {
	Size  = { x = 1.5, y = 1.5, z = 0.6 },
	Color = { r = 40, g = 255, b = 0 },
	Type  = 1,
}

Config.Products = {
	{coords = vector3(1468.96, 1137.11, 113.32), item = 'mleko'},
	{coords = vector3(1459.92, 1137.23, 113.32), item = 'mleko'},
}

Config.VehicleShopCoords = {
	coords = vector3(1422.42, 1120.07, 113.63),
	heading = 177.66,
}
Config.SpawnPoints = {
	{ coords = vector3(1402.97, 1118.12, 113.84), heading = 94.98, radius = 2.0 },
}
Config.AuthorizedVehicles = {
	{ model = 'benson',  label = 'Benson', price = 1 },
	{ model = 'nspeedofiremni',  label = 'Vapid Speedo', price = 1, props = {modLivery = 7} },
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