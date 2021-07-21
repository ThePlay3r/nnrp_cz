Config                              = {}
Config.Locale                       = 'cs'
Config.MarkersDrawDistance          = 90.0
Config.HarvestTime = 4000
Config.CopperReq = 40
Config.GazReq = 10

Config.Blips = {
	Med = {
		Pos     = vector3(96.26, -2216.37, 6.17),
		Sprite  = 436,
		Display = 4,
		Scale   = 1.2,
		Colour  = 1,
		label = 'Hasici - Sber medi',
		IsPublic = false,
	},

	Lahve = {
		Pos     = vector3(1569.29, -2130.43, 77.33),
		Sprite  = 436,
		Display = 4,
		Scale   = 1.2,
		Colour  = 1,
		label = 'Hasici - Sber lahvi',
		IsPublic = false,
	},

	Sell = {
		Pos     = vector3(1243.37, -3262.5, 5.57),
		Sprite  = 436,
		Display = 4,
		Scale   = 1.2,
		Colour  = 1,
		label = 'Hasici - Prodej hasicaku',
		IsPublic = false,
	},

	Lod = {
		Pos     = {x = -801.1, y = -1513.52, z = 0.6},
		Sprite  = 436,
		Display = 4,
		Scale   = 1.2,
		Colour  = 1,
		label = 'Hasici - Lode',
		IsPublic = false,
	}
}

Config.Zones = {

	Vaults = {
		Pos     = {x = -1676.89, y = 72.43, z = 64.01},
		Size  = { x = 2.0, y = 2.0, z = 1.0 },
		Color = { r = 255, g = 0, b = 0 },
		Type  = 1,
	},

	Vaults2 = {
		Pos   = {x = -1686.94, y = 74.52, z = 64.01},
		Size  = { x = 1.2, y = 1.2, z = 0.5 },
		Color = { r = 30, g = 144, b = 255 },
		Type  = 1,
	},

	Crafting = {
		Pos     = {x = -1683.2, y = 77.01, z = 64.01},
		Size  = { x = 2.0, y = 2.0, z = 1.0 },
		Color = { r = 255, g = 0, b = 0 },
		Type  = 1,
	},

	CarSpawn = {
		Pos     = {x = -801.1, y = -1513.52, z = 0.6},
		Size  = { x = 2.0, y = 2.0, z = 1.0 },
		Color = { r = 255, g = 0, b = 0 },
		Type  = 1,
	},

	CarDel = {
		Pos     = {x = -795.04, y = -1501.77, z = 0.09},
		Size  = { x = 5.0, y = 5.0, z = 1.0 },
		Color = { r = 255, g = 0, b = 0 },
		Type  = 1,
	},

	Sell = {
		Pos     = {x = 1243.37, y = -3262.5, z = 4.57},
		Size  = { x = 2.0, y = 2.0, z = 1.0 },
		Color = { r = 255, g = 0, b = 0 },
		Type  = 1,
		Items = {
			{item = 'WEAPON_FIREEXTINGUISHER', price = 6600},
		},
	},
}

Config.ProductsMarker = {
	Size  = { x = 3.0, y = 3.0, z = 1.2 },
	Color = { r = 40, g = 255, b = 0 },
	Type  = 1,
}

Config.Products = {
	{coords = vector3(1569.29, -2130.43, 77.33), item = 'gazbottle'},
	{coords = vector3(96.26, -2216.37, 5.17), item = 'copper'},
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