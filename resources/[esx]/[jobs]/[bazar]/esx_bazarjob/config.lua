Config                              = {}
Config.Locale                       = 'cs'
Config.MarkersDrawDistance          = 90.0

Config.Blips = {
	LifeInvader = {
		Pos     = vector3(2150.34, 3845.67, 39.24),
		Sprite  = 124,
		Display = 4,
		Scale   = 1.2,
		Colour  = 0,
		label = 'Autobazar Mosley',
		IsPublic = true,
	},
}

Config.Zones = {
	BossActions = {
		Pos   = {x = 2186.19, y = 3843.22, z = 38.24},
		Size  = { x = 1.2, y = 1.2, z = 0.5 },
		Color = { r = 0, g = 100, b = 0 },
		Type  = 1,
	},

	Cloakrooms = {
		Pos   = {x = 2180.29, y = 3840.07, z = 32.1},
		Size  = { x = 1.2, y = 1.2, z = 0.5 },
		Color = { r = 255, g = 187, b = 255 },
		Type  = 1,
	},

	Vaults = {
		Pos   = {x = 2186.37, y = 3843.15, z = 32.14},
		Size  = { x = 1.2, y = 1.2, z = 0.5 },
		Color = { r = 30, g = 144, b = 255 },
		Type  = 1,
	},

	Diagnostic = {
		Pos   = {x = 2144.54, y = 3825.07, z = 32.09},
		Size  = { x = 4.0, y = 4.0, z = 1.0 },
		Color = { r = 255, g = 60, b = 0 },
		Type  = 1,
	},

	Vehicles = {
		Pos          = vector3(2142.96, 3833.23, 33.1),
		Size         = { x = 1.0, y = 1.0, z = 1.0 },
		Color        = { r = 40, g = 255, b = 0 },
		Type         = 36,
		Heading      = 207.43,
	}
}


Config.Clothes = {
	male = {
		trial = {
			tshirt_1 = 15,  tshirt_2 = 0,
			torso_1 = 99,   torso_2 = 2,
			decals_1 = 0,   decals_2 = 0,
			arms = 108, arms_2 = 9,
			pants_1 = 17,   pants_2 = 0,
			shoes_1 = 10,   shoes_2 = 0,
			helmet_1 = -1,  helmet_2 = 0,
			chain_1 = 0,    chain_2 = 0,
			bproof_1 = 0,  bproof_2 = 0,
			mask_1 = -1,     mask_2 = 0,
			ears_1 = -1,     ears_2 = 0,
			glasses_1 = 8,  glasses_2 = 3,
			bracelets_1 = -1, bracelets_2 = 0,
			watches_1 = -1, watches_2 = 0,
		},
		seller = {
			tshirt_1 = 15,  tshirt_2 = 0,
			torso_1 = 3,   torso_2 = 6,
			decals_1 = 0,   decals_2 = 0,
			arms = 4, arms_2 = 0,
			pants_1 = 17,   pants_2 = 1,
			shoes_1 = 44,   shoes_2 = 9,
			helmet_1 = -1,  helmet_2 = 0,
			chain_1 = 0,    chain_2 = 0,
			bproof_1 = 0,  bproof_2 = 0,
			mask_1 = -1,     mask_2 = 0,
			ears_1 = -1,     ears_2 = 0,
			glasses_1 = 8,  glasses_2 = 3,
			bracelets_1 = -1, bracelets_2 = 0,
			watches_1 = -1, watches_2 = 0,
	
		},
		proseller = {
			tshirt_1 = 6,  tshirt_2 = 2,
			torso_1 = 124,   torso_2 = 11,
			decals_1 = 0,   decals_2 = 0,
			arms = 11, arms_2 = 0,
			pants_1 = 17,   pants_2 = 0,
			shoes_1 = 44,   shoes_2 = 11,
			helmet_1 = -1,  helmet_2 = 0,
			chain_1 = 0,    chain_2 = 0,
			bproof_1 = 0,  bproof_2 = 0,
			mask_1 = -1,     mask_2 = 0,
			ears_1 = -1,     ears_2 = 0,
			glasses_1 = 8,  glasses_2 = 3,
			bracelets_1 = -1, bracelets_2 = 0,
			watches_1 = -1, watches_2 = 0,

		},
		lowerboss2 = {
			tshirt_1 = 24,  tshirt_2 = 0,
			torso_1 = 27,   torso_2 = 2,
			decals_1 = 0,   decals_2 = 0,
			arms = 4, arms_2 = 0,
			pants_1 = 17,   pants_2 = 1,
			shoes_1 = 44,   shoes_2 = 9,
			helmet_1 = -1,  helmet_2 = 0,
			chain_1 = 21,    chain_2 = 1,
			bproof_1 = 0,  bproof_2 = 0,
			mask_1 = -1,     mask_2 = 0,
			ears_1 = -1,     ears_2 = 0,
			glasses_1 = 8,  glasses_2 = 3,
			bracelets_1 = -1, bracelets_2 = 0,
			watches_1 = -1, watches_2 = 0,
	
		},
		boss = {
			tshirt_1 = 75,  tshirt_2 = 3,
			torso_1 = 76,   torso_2 = 3,
			decals_1 = 0,   decals_2 = 0,
			arms = 4, arms_2 = 0,
			pants_1 = 17,   pants_2 = 1,
			shoes_1 = 44,   shoes_2 = 9,
			helmet_1 = -1,  helmet_2 = 0,
			chain_1 = 0,    chain_2 = 0,
			bproof_1 = 0,  bproof_2 = 0,
			mask_1 = -1,     mask_2 = 0,
			ears_1 = -1,     ears_2 = 0,
			glasses_1 = 8,  glasses_2 = 3,
			bracelets_1 = -1, bracelets_2 = 0,
			watches_1 = -1, watches_2 = 0,
	
		},
	},
	female = {
		seller = {
			tshirt_1 = 14,  tshirt_2 = 0,
			torso_1 = 180,   torso_2 = 1,
			decals_1 = 0,   decals_2 = 0,
			arms = 4, arms_2 = 0,
			pants_1 = 14,   pants_2 = 2,
			shoes_1 = 10,   shoes_2 = 0,
			helmet_1 = -1,  helmet_2 = 0,
			chain_1 = 0,    chain_2 = 0,
			bproof_1 = 0,  bproof_2 = 0,
			mask_1 = -1,     mask_2 = 0,
			ears_1 = -1,     ears_2 = 0,
			glasses_1 = 11,  glasses_2 = 3,
			bracelets_1 = -1, bracelets_2 = 0,
			watches_1 = -1, watches_2 = 0,
	
		},
		lowerboss1 = {
			tshirt_1 = 43,  tshirt_2 = 5,
			torso_1 = 148,   torso_2 = 0,
			decals_1 = 0,   decals_2 = 0,
			arms = 1, arms_2 = 0,
			pants_1 = 6,   pants_2 = 0,
			shoes_1 = 32,   shoes_2 = 0,
			helmet_1 = -1,  helmet_2 = 0,
			chain_1 = 0,    chain_2 = 0,
			bproof_1 = 0,  bproof_2 = 0,
			mask_1 = -1,     mask_2 = 0,
			ears_1 = -1,     ears_2 = 0,
			glasses_1 = 11,  glasses_2 = 3,
			bracelets_1 = -1, bracelets_2 = 0,
			watches_1 = -1, watches_2 = 0,
	
		},
	},
}

Config.VehicleShopCoords = {
	coords = vector3(2154.8, 3853.13, 45.39),
	heading = 334.19,
}
Config.SpawnPoints = {
	{ coords = vector3(2162.32, 3842.65, 33.09), heading = 30.15, radius = 2.0 },
}
Config.AuthorizedVehicles = {
	{model = '16challenger', label = 'Dodge Challenger 2016', price = 1, props = {modLivery = 3, color1 = 28, color2 = 28, pearlescentColor = 12, modFender = 2, modFrontBumper = 4, modGrille = 0, extras = {["1"] = false}}}
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