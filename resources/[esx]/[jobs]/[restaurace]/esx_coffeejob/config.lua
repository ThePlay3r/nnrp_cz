Config                              = {}
Config.Locale                       = 'cs'
Config.MarkersDrawDistance          = 90.0
Config.Blips = {
	Coffee = {
		Pos     = vector3(-628.43, 239.09, 81.9),
		Sprite  = 400,
		Display = 4,
		Scale   = 1.2,
		Colour  = 0,
		label = 'Bean Machine Coffee',
		IsPublic = true,
	},
	Shop = {
		Pos     = {x = 1182.76, y = -3307.53, z = 5.03},
		Sprite  = 400,
		Display = 4,
		Scale   = 1.2,
		Colour  = 0,
		label = 'Bean Machine Coffee - Shop',
		IsPublic = false,
	},
	Sell = {
		Pos     = vector3(1726.88, 4765.38, 41.91),
		Sprite  = 400,
		Display = 4,
		Scale   = 1.2,
		Colour  = 0,
		label = 'Bean Machine Coffee - Prodej',
		IsPublic = false,
	}
}


local Price = 65
Config.Zones = {
	BossActions = {
		Pos   = {x = -621.22, y = 229.89, z = 80.88},
		Size  = { x = 1.2, y = 1.2, z = 0.5 },
		Color = { r = 0, g = 100, b = 0 },
		Type  = 1,
	},

	Cloakrooms = {
		Pos   = {x = -617.46, y = 236.56, z = 81.09},
		Size  = { x = 1.2, y = 1.2, z = 0.5 },
		Color = { r = 255, g = 187, b = 255 },
		Type  = 1,
	},

	Vaults = {
		Pos   = {x = -621.97, y = 231.48, z = 80.88},
		Size  = { x = 1.2, y = 1.2, z = 0.5 },
		Color = { r = 30, g = 144, b = 255 },
		Type  = 1,
	},

	Vehicles = {
		Pos          = vector3(-638.66, 235.44, 81.62),
		Size         = { x = 1.0, y = 1.0, z = 1.0 },
		Color        = { r = 153, g = 114, b = 76 },
		Type         = 36,
		Heading      = 279.16,
	}
}


Config.Clothes = {
    male = {
        tshirt_1 = 15,  tshirt_2 = 0,
        torso_1 = 115,   torso_2 = 2,
        decals_1 = 0,   decals_2 = 0,
        arms = 4, arms_2 = 0,
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
        tshirt_1 = 14,  tshirt_2 = 0,
        torso_1 = 145,   torso_2 = 2,
        decals_1 = 0,   decals_2 = 0,
        arms = 3, arms_2 = 0,
        pants_1 = 35,   pants_2 = 0,
        shoes_1 = 30,   shoes_2 = 0,
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
	coords = vector3(-630.44, 238.15, 86.05),
	heading = 302.44,
}
Config.SpawnPoints = {
	{ coords = vector3(-644.35, 230.61, 79.37), heading = 354.28, radius = 2.0 },
}
Config.AuthorizedVehicles = {

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