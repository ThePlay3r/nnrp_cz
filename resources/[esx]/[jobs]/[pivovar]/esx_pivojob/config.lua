Config                              = {}
Config.Locale                       = 'cs'
Config.MarkersDrawDistance          = 90.0
Config.HarvestTime = 2000
Config.CookTime = 6000
Config.Blips = {
	Pivovar = {
		Pos     = vector3(855.42, -1917.92, 39.15),
		Sprite  = 385,
		Display = 4,
		Scale   = 1.2,
		Colour  = 0,
		label = 'Pivovar',
		IsPublic = true,
	},
	
	Sell = {
		Pos     = vector3(-735.78, -286.29, 35.95),
		Sprite  = 385,
		Display = 4,
		Scale   = 1.2,
		Colour  = 0,
		label = 'Pivovar - Prodej',
		IsPublic = false,
	},
}


Config.Zones = {
	BossActions = {
		Pos   = {x = 829.19, y = -1981.07, z = 28.3},
		Size  = { x = 1.2, y = 1.2, z = 0.5 },
		Color = { r = 0, g = 100, b = 0 },
		Type  = 1,
	},

	Cloakrooms = {
		Pos   = {x = 831.55, y = -1985.33, z = 28.3},
		Size  = { x = 1.2, y = 1.2, z = 0.5 },
		Color = { r = 255, g = 187, b = 255 },
		Type  = 1,
	},

	Vaults = {
		Pos   = {x = 833.1, y = -1994.07, z = 28.3},
		Size  = { x = 1.2, y = 1.2, z = 0.5 },
		Color = { r = 30, g = 144, b = 255 },
		Type  = 1,
	},

	Sell = {
		Pos     = vector3(-735.78, -286.29, 35.95),
		Size  = { x = 1.5, y = 1.5, z = 0.4 },
		Color = { r = 255, g = 255, b = 255 },
		Type  = 1,
		Items = {
			{item = 'beer', price = 660},
			{item = 'beer_nealko', price = 540},
			{item = 'beer_fruit', price = 680},
		},
	},

	Transform = {
		Pos     = vector3(849.48, -1995.49, 28.98),
		Size  = { x = 3.0, y = 3.0, z = 1.2 },
		Color = { r = 194, g = 150, b = 19 },
		Type  = 1,
		FromItem = 'chmel',
		FromItem2 = 'jecmen',
		FromItem3 = 'apple',
		Count1 = 5,
		Count2 = 2,
		Count3 = 0,
		ToItem = 'beer',
	},

	Transform2 = {
		Pos     = vector3(858.33, -1957.9, 29.07),
		Size  = { x = 3.0, y = 3.0, z = 1.2 },
		Color = { r = 194, g = 150, b = 19 },
		Type  = 1,
		FromItem = 'chmel',
		FromItem2 = 'jecmen',
		FromItem3 = 'apple',
		Count1 = 3,
		Count2 = 2,
		Count3 = 0,
		ToItem = 'beer_nealko',
	},

	Transform3 = {
		Pos     = vector3(832.36, -1924.02, 29.31),
		Size  = { x = 3.0, y = 3.0, z = 1.2 },
		Color = { r = 194, g = 150, b = 19 },
		Type  = 1,
		FromItem = 'chmel',
		FromItem2 = 'jecmen',
		FromItem3 = 'apple',
		Count1 = 3,
		Count2 = 2,
		Count3 = 2,
		ToItem = 'beer_fruit',
	},

	Vehicles = {
		Pos          = vector3(829.58, -1944.83, 28.93),
		Size         = { x = 1.0, y = 1.0, z = 1.0 },
		Color        = { r = 255, g = 72, b = 107 },
		Type         = 36,
		Heading      = 207.43,
	}
}


Config.Clothes = {
	first = {
		male = {
			tshirt_1 = 15,  tshirt_2 = 0,
			torso_1 = 46,   torso_2 = 0,
			decals_1 = 0,   decals_2 = 0,
			arms = 11, arms_2 = 0,
			pants_1 = 35,   pants_2 = 0,
			shoes_1 = 29,   shoes_2 = 0,
			helmet_1 = -1,  helmet_2 = 0,
			chain_1 = 0,    chain_2 = 0,
			bproof_1 = 0,  bproof_2 = 0,
			mask_1 = 0,     mask_2 = 0,
			ears_1 = -1,     ears_2 = 0,
			glasses_1 = 3,  glasses_2 = 0,
			bracelets_1 = 0, bracelets_2 = 0,
			watches_1 = 6, watches_2 = 0,
		},
		female = {
			tshirt_1 = 0,  tshirt_2 = 0,
			torso_1 = 0,   torso_2 = 0,
			decals_1 = 0,   decals_2 = 0,
			arms = 0, arms_2 = 0,
			pants_1 = 0,   pants_2 = 0,
			shoes_1 = 0,   shoes_2 = 0,
			helmet_1 = -1,  helmet_2 = 0,
			chain_1 = 0,    chain_2 = 0,
			bproof_1 = 0,  bproof_2 = 0,
			mask_1 = 0,     mask_2 = 0,
			ears_1 = -1,     ears_2 = 0,
			glasses_1 = 0,  glasses_2 = 0,
			bracelets_1 = 0, bracelets_2 = 0,
			watches_1 = 0, watches_2 = 0,
		},	
	},
	second = {
		male = {
			tshirt_1 = 15,  tshirt_2 = 0,
			torso_1 = 3,   torso_2 = 0,
			decals_1 = 0,   decals_2 = 0,
			arms = 24, arms_2 = 0,
			pants_1 = 33,   pants_2 = 0,
			shoes_1 = 24,   shoes_2 = 0,
			helmet_1 = 7,  helmet_2 = 0,
			chain_1 = 0,    chain_2 = 0,
			bproof_1 = 0,  bproof_2 = 0,
			mask_1 = 0,     mask_2 = 0,
			ears_1 = -1,     ears_2 = 0,
			glasses_1 = 3,  glasses_2 = 0,
			bracelets_1 = 0, bracelets_2 = 0,
			watches_1 = 0, watches_2 = 0,
		}
	},
	boss = {
		male = {
			tshirt_1 = 15,  tshirt_2 = 0,
			torso_1 = 46,   torso_2 = 0,
			decals_1 = 0,   decals_2 = 0,
			arms = 83, arms_2 = 0,
			pants_1 = 35,   pants_2 = 0,
			shoes_1 = 28,   shoes_2 = 0,
			helmet_1 = 30,  helmet_2 = 0,
			chain_1 = 0,    chain_2 = 0,
			bproof_1 = 0,  bproof_2 = 0,
			mask_1 = 0,     mask_2 = 0,
			ears_1 = -1,     ears_2 = 0,
			glasses_1 = 7,  glasses_2 = 0,
			bracelets_1 = 2, bracelets_2 = 0,
			watches_1 = 4, watches_2 = 0,
		}
	},
}


Config.ProductsMarker = {
	Size  = { x = 3.0, y = 3.0, z = 1.2 },
	Color = { r = 255, g = 72, b = 107 },
	Type  = 1,
}

Config.Products = {
	{coords = vector3(846.37, -1924.93, 29.31), item = 'chmel'},
	{coords = vector3(853.21, -1852.13, 28.79), item = 'jecmen'},
}

Config.VehicleShopCoords = {
	coords = vector3(755.43, -1908.76, 35.16),
	heading = 264.75,
}
Config.SpawnPoints = {
	{ coords = vector3(831.02, -1951.48, 28.95), heading = 80.0, radius = 2.0 },
}
Config.AuthorizedVehicles = {
	-- { model = 'nspeedo',  label = 'Vapid Speedo', price = 1, props = { modLivery = 14} },
	{ model = 'mule2',  label = 'Truck', price = 1, props = {extras = {["1"] = false, ["2"] = false, ["3"] = false, ["4"] = false, ["5"] = false, ["6"] = false ,["7"] = true}}},
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