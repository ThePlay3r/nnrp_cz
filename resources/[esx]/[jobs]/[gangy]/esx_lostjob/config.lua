Config                              = {}
Config.Locale                       = 'cs'
Config.MarkersDrawDistance          = 90.0

Config.Blips = {
	Lost = {
		Pos     = vector3(1990.76, 3054.31, 47.22),
		Sprite  = 226,
		Display = 4,
		Scale   = 1.2,
		Colour  = 28,
		label = 'The Lost',
		IsPublic = true,
	},
	LostProdej = {
		Pos     = vector3(-2964.35, 365.51, 15.02),
		Sprite  = 226,
		Display = 4,
		Scale   = 1.4,
		Colour  = 28,
		label = 'The Lost - prodej krabek cigar',
		hiddenForGrade = 'prospect',
		IsPublic = false,
	},
}

Config.Zones = {
	BossActions = {
		Pos   = {x = 1993.43, y = 3045.18, z = 49.51},
		Size  = { x = 1.2, y = 1.2, z = 0.5 },
		Color = { r = 0, g = 100, b = 0 },
		Type  = 1,
	},

	-- Cloakrooms = {
	-- 	Pos   = {x = 2443.09, y = 4965.18, z = 45.81},
	-- 	Size  = { x = 1.2, y = 1.2, z = 0.5 },
	-- 	Color = { r = 255, g = 187, b = 255 },
	-- 	Type  = 1,
	-- },

	Vaults = {
		Pos   = {x = 1985.27, y = 3025.69, z = 46.06},
		Size  = { x = 1.2, y = 1.2, z = 0.5 },
		Color = { r = 30, g = 144, b = 255 },
		Type  = 1,
	},

	Vaults2 = {
		Pos   = {x = 1982.4, y = 3053.06, z = 46.22},
		Size  = { x = 1.2, y = 1.2, z = 0.5 },
		Color = { r = 30, g = 144, b = 255 },
		Type  = 1,
	},

	Armory = {
		Pos   = {x = 1987.64, y = 3024.42, z = 46.06},
		Size  = { x = 1.2, y = 1.2, z = 0.5 },
		Color = { r = 30, g = 144, b = 255 },
		Type  = 1,
	},

	Vehicles = {
		Pos          = vector3(1999.33, 3036.83, 47.21),
		Size         = { x = 1.0, y = 1.0, z = 1.0 },
		Color        = { r = 247, g = 202, b = 0 },
		Type         = 36,
		Heading      = 207.43,
	}
}


-- Config.Clothes = {

-- }

Config.VehicleShopCoords = {
	coords = vector3(2009.91, 3013.62, 46.98),
	heading = 300.23,
}
Config.SpawnPoints = {
	{ coords = vector3(1989.38, 3037.95, 47.03), heading = 76.91, radius = 2.0 },
	{ coords = vector3(1987.36, 3034.6, 47.03), heading = 76.91, radius = 2.0 },
	{ coords = vector3(1985.35, 3030.08, 47.03), heading = 76.91, radius = 2.0 },
}
Config.AuthorizedVehicles = {
	{model = 'gburrito', label = 'Burrito', price = 1},
	{model = 'daemon2', label = 'Daemon 2', price = 1},
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