Config                              = {}
Config.Locale                       = 'cs'
Config.MarkersDrawDistance          = 90.0

Config.Blips = {
	LifeInvader = {
		Pos     = vector3(-1082.64, -249.47, 37.82),
		Sprite  = 208,
		Display = 4,
		Scale   = 1.2,
		Colour  = 0,
		label = 'Lifeinvader',
		IsPublic = true,
	},
}

Config.Zones = {
	BossActions = {
		Pos   = {x = -1063.35, y = -249.53, z = 43.02},
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
		Pos   = {x = -1068.39, y = -242.03, z = 38.73},
		Size  = { x = 1.2, y = 1.2, z = 0.5 },
		Color = { r = 30, g = 144, b = 255 },
		Type  = 1,
	},

	-- Vehicles = {
	-- 	Pos          = vector3(-1086.26, -262.49, 37.78),
	-- 	Size         = { x = 1.0, y = 1.0, z = 1.0 },
	-- 	Color        = { r = 40, g = 255, b = 0 },
	-- 	Type         = 36,
	-- 	Heading      = 207.43,
	-- }
}


-- Config.Clothes = {

-- }

-- Config.VehicleShopCoords = {
-- 	coords = vector3(2409.1, 4971.73, 46.08),
-- 	heading = 215.17,
-- }
-- Config.SpawnPoints = {
-- 	{ coords = vector3(2408.63, 4985.92, 46.18), heading = 170.0, radius = 2.0 },
-- }
-- Config.AuthorizedVehicles = {

-- }


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