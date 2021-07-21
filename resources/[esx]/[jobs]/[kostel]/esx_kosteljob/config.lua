Config                              = {}
Config.Locale                       = 'cs'
Config.MarkersDrawDistance          = 90.0
Config.HarvestTime = 2000
Config.CookTime = 6000
Config.Blips = {
	Kostel = {
		Pos     = vector3(-1685.39, -295.35, 51.81),
		Sprite  = 305,
		Display = 4,
		Scale   = 1.2,
		Colour  = 46,
		label = 'Kostel sv. Olivera',
		IsPublic = true,
	},
	
	Sell = {
		Pos     = vector3(-326.86, 2819.69, 57.49),
		Sprite  = 305,
		Display = 4,
		Scale   = 1.2,
		Colour  = 46,
		label = 'Kostel sv. Olivera - Prodej',
		IsPublic = false,
	},
}


Config.Zones = {
	BossActions = {
		Pos   = {x = -1697.19, y = -275.38, z = 51.41},
		Size  = { x = 1.2, y = 1.2, z = 0.5 },
		Color = { r = 0, g = 100, b = 0 },
		Type  = 1,
	},

	Cloakrooms = {
		Pos   = {x = -1691.16, y = -266.7, z = 51.41},
		Size  = { x = 1.2, y = 1.2, z = 0.5 },
		Color = { r = 255, g = 187, b = 255 },
		Type  = 1,
	},

	Vaults = {
		Pos   = {x = -1684.01, y = -267.87, z = 50.86},
		Size  = { x = 1.2, y = 1.2, z = 0.5 },
		Color = { r = 30, g = 144, b = 255 },
		Type  = 1,
	},

	Sell = {
		Pos     = vector3(-326.86, 2819.69, 57.49),
		Size  = { x = 1.7, y = 1.7, z = 0.4 },
		Color = { r = 255, g = 255, b = 255 },
		Type  = 1,
		Items = {
			{item = 'ruzenec', price = 660},
		},
	},

	Transform = {
		Pos     = vector3(-1701.58, -274.18, 50.88),
		Size  = { x = 1.7, y = 1.7, z = 1.2 },
		Color = { r = 40, g = 255, b = 0 },
		Type  = 1,
	},

	Vehicles = {
		Pos          = vector3(-1685.39, -295.35, 51.81),
		Size         = { x = 1.0, y = 1.0, z = 1.0 },
		Color        = { r = 205, g = 168, b = 12 },
		Type         = 36,
		Heading      = 37.4,
	}
}


Config.Clothes = {
	kostel_outfit = {
		male = {
			tshirt_1 = 4,  tshirt_2 = 0,
			torso_1 = 62,   torso_2 = 0,
			decals_1 = 0,   decals_2 = 0,
			arms = 4, arms_2 = 0,
			pants_1 = 6,   pants_2 = 0,
			shoes_1 = 58,   shoes_2 = 0,
			helmet_1 = -1,  helmet_2 = 0,
			chain_1 = 24,    chain_2 = 2,
			bproof_1 = 0,  bproof_2 = 0,
			mask_1 = -1,     mask_2 = 0,
			ears_1 = -1,     ears_2 = 0,
			glasses_1 = 0,  glasses_2 = 0,
			bracelets_1 = -1, bracelets_2 = 0,
			watches_1 = -1, watches_2 = 0,
		},
		female = {
			tshirt_1 = 41,  tshirt_2 = 0,
            torso_1 = 60,   torso_2 = 0,
            decals_1 = 0,   decals_2 = 0,
            arms = 3, arms_2 = 0,
            pants_1 = 6,   pants_2 = 0,
            shoes_1 = 6,   shoes_2 = 0,
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
}

Config.ProductsMarker = {
	Size  = { x = 1.5, y = 1.5, z = 1.2 },
	Color = { r = 205, g = 168, b = 12 },
	Type  = 1,
}

Config.Products = {
	{coords = vector3(-1688.95, -274.84, 50.86), item = 'cross'},
}

Config.VehicleShopCoords = {
	coords = vector3(-1701.49, -267.74, 58.0),
	heading = 106.32,
}
Config.SpawnPoints = {
	{ coords = vector3(-1679.97, -297.77, 50.81), heading = 143.64, radius = 2.0 },
}
Config.AuthorizedVehicles = {
	{ model = 'romero',  label = 'Pohrebni vuz', price = 1 },
	{ model = '560sec',  label = 'Mercedes 560 SEC', price = 1 },
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