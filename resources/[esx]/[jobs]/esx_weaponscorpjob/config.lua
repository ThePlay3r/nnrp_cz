Config                              = {}
Config.Locale                       = 'cs'
Config.MarkersDrawDistance          = 90.0
Config.HarvestTime = 5000

Config.Blips = {
	Wcorp = {
		Pos     = vector3(811.51, -2150.83, 28.62),
		Sprite  = 150,
		Display = 4,
		Scale   = 1.2,
		Colour  = 0,
		label = 'WCorp - sidlo',
		IsPublic = false,
	},
	
	Zelezo = {
		Pos     = vector3(-596.35, 2089.42, 130.41),
		Sprite  = 150,
		Display = 4,
		Scale   = 1.2,
		Colour  = 0,
		label = 'WCorp - Sber zeleza',
		IsPublic = false,
	},

	Soucastky = {
		Pos     = vector3(2467.09, 4100.83, 37.06),
		Sprite  = 150,
		Display = 4,
		Scale   = 1.2,
		Colour  = 0,
		label = 'WCorp - Sber soucastek',
		IsPublic = false,
	},

	Sell = {
		Pos     = vector3(-331.72, 6082.22, 30.45),
		Sprite  = 150,
		Display = 4,
		Scale   = 1.2,
		Colour  = 0,
		label = 'WCorp - Prodej',
		IsPublic = false,
	},
}


Config.Zones = {
	BossActions = {
		Pos   = {x = 818.03, y = -2155.6, z = 28.62},
		Size  = { x = 1.2, y = 1.2, z = 0.5 },
		Color = { r = 0, g = 100, b = 0 },
		Type  = 1,
	},

	Cloakrooms = {
		Pos   = {x = 826.94, y = -2152.96, z = 28.62},
		Size  = { x = 1.2, y = 1.2, z = 0.5 },
		Color = { r = 255, g = 187, b = 255 },
		Type  = 1,
	},

	Vaults = {
		Pos   = {x = 808.21, y = -2159.35, z = 28.62},
		Size  = { x = 1.2, y = 1.2, z = 0.5 },
		Color = { r = 30, g = 144, b = 255 },
		Type  = 1,
	},

	Vaults2 = {
		Pos   = {x = 880.16, y = -3248.47, z = -99.29},
		Size  = { x = 1.2, y = 1.2, z = 0.5 },
		Color = { r = 30, g = 144, b = 255 },
		Type  = 1,
	},

	Sell = {
		Pos     = {x = -331.75, y = 6082.22, z = 30.45},
		Size  = { x = 2.0, y = 2.0, z = 1.0 },
		Color = { r = 255, g = 255, b = 255 },
		Type  = 1,
		Items = {
			{item = 'weapon_knuckle', price = 4500},
			{item = 'weapon_bat', price = 1800},
			{item = 'weapon_flashlight', price = 1800},
			{item = 'weapon_crowbar', price = 6200},
			{item = 'weapon_hammer', price = 6200},
			{item = 'weapon_battleaxe', price = 13200},
			{item = 'weapon_stungun', price = 17600},
			{item = 'weapon_switchblade', price = 2800},
			{item = 'weapon_knife', price = 2800},
			{item = 'weapon_snspistol', price = 16000},
			{item = 'weapon_revolver', price = 60000},
			{item = 'weapon_heavypistol', price = 38800},
			{item = 'weapon_doubleaction', price = 167200},
			{item = 'weapon_vintagepistol', price = 45000},
			{item = 'weapon_marksmanpistol', price = 45000},
			{item = 'weapon_pistol', price = 22000},
			{item = 'weapon_combatpistol', price = 22000},
			{item = 'weapon_pistol50', price = 57600},
			{item = 'weapon_pumpshotgun', price = 105600},
			{item = 'weapon_sawnoffshotgun', price = 88000},
			{item = 'weapon_musket', price = 150000},
			{item = 'WEAPON_COMBATPDW', price = 195000},
			{item = 'WEAPON_CARBINERIFLE', price = 215000},
			{item = 'WEAPON_SMG', price = 75000},
			{item = 'WEAPON_ADVANCEDRIFLE', price = 160000},
			{item = 'WEAPON_COMPACTRIFLE', price = 155000},
			{item = 'WEAPON_ASSAULTRIFLE', price = 205000},
			{item = 'WEAPON_HEAVYSHOTGUN', price = 200000},
			{item = 'WEAPON_DBSHOTGUN', price = 150000},
		},
	},

	Vehicles = {
		Pos          = vector3(817.22, -2141.93, 29.29),
		Size         = { x = 1.0, y = 1.0, z = 1.0 },
		Color        = { r = 0, g = 0, b = 0 },
		Type         = 36,
		Heading      = 207.43,
	}
}


Config.Clothes = {
	worker = {
		tshirt_1 = 15, tshirt_2 = 0,
		torso_1 = 54, torso_2 = 0,
		decals_1 = 0, decals_2 = 0,
		arms = 35, arms_2 = 0,
		pants_1 = 55, pants_2 = 0,
		shoes_1 = 29, shoes_2 = 0,
		helmet_1 = 0, helmet_2 = 0,
		chain_1 = 0, chain_2 = 0,
		bproof_1 = 0, bproof_2 = 0,
		mask_1 = -1, mask_2 = 0,
		ears_1 = -1,ears_2 = 0,
		glasses_1 = 0, glasses_2 = 0,
		bracelets_1 = -1, bracelets_2 = 0,
		watches_1 = -1, watches_2 = 0
	},
	leader = {
		tshirt_1 = 9, tshirt_2 = 0,
		torso_1 = 167, torso_2 = 0,
		decals_1 = 0, decals_2 = 0,
		arms = 35, arms_2 = 0,
		pants_1 = 55, pants_2 = 0,
		shoes_1 = 29, shoes_2 = 0,
		helmet_1 = 0, helmet_2 = 0,
		chain_1 = 0, chain_2 = 0,
		bproof_1 = 0, bproof_2 = 0,
		mask_1 = -1, mask_2 = 0,
		ears_1 = -1, ears_2 = 0,
		glasses_1 = 0, glasses_2 = 0,
		bracelets_1 = -1, bracelets_2 = 0,
		watches_1 = -1, watches_2 = 0,
	},
	boss = {
		tshirt_1 = 9, tshirt_2 = 2,
		torso_1 = 167, torso_2 = 0,
		decals_1 = 0, decals_2 = 0,
		arms = 35, arms_2 = 0,
		pants_1 = 55, pants_2 = 0,
		shoes_1 = 29, shoes_2 = 0,
		helmet_1 = 0, helmet_2 = 0,
		chain_1 = 0, chain_2 = 0,
		bproof_1 = 0, bproof_2 = 0,
		mask_1 = -1, mask_2 = 0,
		ears_1 = -1, ears_2 = 0,
		glasses_1 = 0, glasses_2 = 0,
		bracelets_1 = -1, bracelets_2 = 0,
		watches_1 = -1, watches_2 = 0,
	},
}


Config.ProductsMarker = {
	Size  = { x = 3.0, y = 3.0, z = 1.2 },
	Color = { r = 40, g = 255, b = 0 },
	Type  = 1,
}

Config.Products = {
	{coords = vector3(-596.35, 2089.42, 130.41), item = 'iron'},
	{coords = vector3(2467.09, 4100.83, 37.06), item = 'weapon_piece'},
}

Config.VehicleShopCoords = {
	coords = vector3(831.9, -2119.8, 29.39),
	heading = 86.47,
}
Config.SpawnPoints = {
	{ coords = vector3(822.17, -2137.49, 29.29), heading = 356.02, radius = 2.0 },
}
Config.AuthorizedVehicles = {
	{ model = 'baller6',  label = 'SUV', price = 1, props = {color1 = 12, color2 = 12} },
	{model = 'insurgent2', label = 'Insurgent', price = 1, props = {color1 = 12, color2 = 12}, jobGrades = {'boss', 'lowerboss1'}},
	{model = 'brickade', label = 'Brickade', price = 1, props = {color1 = 12, color2 = 12}, jobGrades = {'boss', 'lowerboss1'}}
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