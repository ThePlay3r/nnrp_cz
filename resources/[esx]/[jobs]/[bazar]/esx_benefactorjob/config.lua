Config                              = {}
Config.Locale                       = 'cs'
Config.MarkersDrawDistance          = 90.0

Config.Blips = {
	LifeInvader = {
		Pos     = vector3(-52.58, 71.79, 70.94),
		Sprite  = 120,
		Display = 4,
		Scale   = 1.2,
		Colour  = 0,
		label = 'Autobazar Benefactor',
		IsPublic = true,
	},
}

Config.Zones = {
	BossActions = {
		Pos   = {x = -52.48, y = 71.57, z = 70.94},
		Size  = { x = 1.2, y = 1.2, z = 0.5 },
		Color = { r = 0, g = 100, b = 0 },
		Type  = 1,
	},

	Cloakrooms = {
		Pos   = {x = -54.29, y = 66.48, z = 70.96},
		Size  = { x = 1.2, y = 1.2, z = 0.5 },
		Color = { r = 255, g = 187, b = 255 },
		Type  = 1,
	},

	Vaults = {
		Pos   = {x = -50.91, y = 76.44, z = 70.94},
		Size  = { x = 1.2, y = 1.2, z = 0.5 },
		Color = { r = 30, g = 144, b = 255 },
		Type  = 1,
	},

	Diagnostic = {
		Pos   = {x = -67.45, y = 75.07, z = 70.62},
		Size  = { x = 4.0, y = 4.0, z = 1.0 },
		Color = { r = 255, g = 60, b = 0 },
		Type  = 1,
	},

	Vehicles = {
		Pos          = vector3(-66.09, 78.04, 71.62),
		Size         = { x = 1.0, y = 1.0, z = 1.0 },
		Color        = { r = 40, g = 255, b = 0 },
		Type         = 36,
		Heading      = 325.16,
	},

	Heli = {
		Pos          = vector3(-93.42, 42.82, 71.76),
		Size         = { x = 1.0, y = 1.0, z = 1.0 },
		Color        = { r = 40, g = 255, b = 0 },
		Type         = 34,
		Heading      = 207.43,
	},

	Heli2 = {
		Pos          = vector3(-122.36, 971.06, 235.9),
		Size         = { x = 1.0, y = 1.0, z = 1.0 },
		Color        = { r = 40, g = 255, b = 0 },
		Type         = 34,
		Heading      = 207.43,
	},

	OpenSign = {
		Pos          = vector3(-67.66, 62.41, 70.92),
		Size         = { x = 1.2, y = 1.2, z = 0.5 },
		Color = { r = 0, g = 220, b = 255 },
		Type  = 1,
	}
}


Config.Clothes = {
	male = {
		tshirt_1 = 6,  tshirt_2 = 2,
		torso_1 = 11,   torso_2 = 1,
		decals_1 = 0,   decals_2 = 0,
		arms = 11, arms_2 = 0,
		pants_1 = 33,   pants_2 = 0,
		shoes_1 = 10,   shoes_2 = 0,
		helmet_1 = -1,  helmet_2 = 0,
		chain_1 = 0,    chain_2 = 0,
		bproof_1 = 0,  bproof_2 = 0,
		mask_1 = -1,     mask_2 = 0,
		ears_1 = -1,     ears_2 = 0,
		glasses_1 = 0,  glasses_2 = 0,
		bracelets_1 = -1, bracelets_2 = 0,
		watches_1 = -1, watches_2 = 0,
	},
	female = {
		tshirt_1 = 27,  tshirt_2 = 1,
		torso_1 = 37,   torso_2 = 3,
		decals_1 = 0,   decals_2 = 0,
		arms = 0, arms_2 = 0,
		pants_1 = 8,   pants_2 = 0,
		shoes_1 = 13,   shoes_2 = 0,
		helmet_1 = -1,  helmet_2 = 0,
		chain_1 = 0,    chain_2 = 0,
		bproof_1 = 0,  bproof_2 = 0,
		mask_1 = -1,     mask_2 = 0,
		ears_1 = -1,     ears_2 = 0,
		glasses_1 = 5,  glasses_2 = 0,
		bracelets_1 = -1, bracelets_2 = 0,
		watches_1 = -1, watches_2 = 0,
	},
}

Config.VehicleShopCoords = {
	coords = vector3(-59.12, 72.91, 76.88),
	heading = 315.16,
}
Config.VehicleShopCoordsHeli = {
	coords = vector3(-73.07, 20.01, 77.77),
	heading = 65.81,
}

Config.SpawnPoints = {
	{ coords = vector3(-67.5, 82.51, 71.53), heading = 64.03, radius = 2.0 },
}
Config.AuthorizedVehicles = {
	{ model = 'nspeedofiremni', label = 'Vapid Speedo', price = 1, props = { modLivery = 9, pearlescentColor = 140}},
	{ model = 'raptor150firemni', label = 'Raptor 2017', price = 1, props = { modLivery = 2, pearlescentColor = 140}},
	{ model = 'RS62firemni', label = 'Audi RS62', price = 1, props = { modLivery = 7, pearlescentColor = 140} },
	{ model = 'africat', label = 'Honda CRF1000L 2018 Africa', price = 1, props = { color1 = 143, color2 = 143, modLivery = 2, pearlescentColor = 140}},
}
Config.SpawnPointsHeli = {
	{ coords = vector3(-95.84, 31.31, 76.37), heading = 331.52, radius = 2.0 },
}
Config.AuthorizedVehiclesHeli = {
	{ model = 'swift2', label = 'Swift', price = 20000000, props = {color1 = 12, color2 = 12, pearlescentColor = 42}},
}
Config.SpawnPointsHeli2 = {
	{ coords = vector3(-116.0267, 960.9817, 234.7974), heading = 224.388961, radius = 2.0 },
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