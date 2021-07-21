Config                            = {}

Config.DrawDistance               = 100.0

Config.Marker                     = { type = 2, x = 0.7, y = 0.7, z = 0.5, r = 102, g = 0, b = 102, a = 100, rotate = false }
Config.Locale = 'cs'


Config.EnablePlayerManagement     = true

Config.Outfits = {
	male = {
		['Hasič']= {
				['tshirt_1'] = 0, ['tshirt_2'] = 0,
				['torso_1'] = 81, ['torso_2'] = 0,
				['arms'] = 112, ['arms_2'] = 5,
				['chain_1'] = 0, ['chain_2'] = 0,
				['pants_1'] = 28, ['pants_2'] = 1,
				['shoes_1'] = 75, ['shoes_2'] = 0,
			['decals_1'] = 16, ['decals_2'] = 0,
			['helmet_1'] = 45, ['helmet_2'] = 0,
			bproof_1 = 0,  bproof_2 = 0,
		},
		['Hasič požár'] = {
			['tshirt_1'] = 71, ['tshirt_2'] = 0,
				['torso_1'] = 81, ['torso_2'] = 0,
				['arms'] = 112, ['arms_2'] = 5,
				['chain_1'] = 0, ['chain_2'] = 0,
				['pants_1'] = 52, ['pants_2'] = 0,
				['shoes_1'] = 75, ['shoes_2'] = 0,
			['decals_1'] = 16, ['decals_2'] = 0,
			['helmet_1'] = 45, ['helmet_2'] = 0,
			bproof_1 = 0,  bproof_2 = 0,
		},
		['Hasič volné'] = {
			tshirt_1 = 56,  tshirt_2 = 0,
			torso_1 = 51,   torso_2 = 1,
			decals_1 = 0,   decals_2 = 0,
			arms = 65, arms_2 = 0,
			pants_1 = 28,   pants_2 = 0,
			shoes_1 = 58,   shoes_2 = 0,
			helmet_1 = 44,  helmet_2 = 2,
			chain_1 = 0,    chain_2 = 0,
			bproof_1 = 0,  bproof_2 = 0,
			mask_1 = -1,     mask_2 = 0,
			ears_1 = -1,     ears_2 = 0,
			glasses_1 = 0,  glasses_2 = 0,
			bracelets_1 = -1, bracelets_2 = 0,
			watches_1 = -1, watches_2 = 0,
		},
		['Potapěč'] = {
			tshirt_1 = 126,  tshirt_2 = 14,
			torso_1 = 247,   torso_2 = 3,
			decals_1 = 0,   decals_2 = 0,
			arms = 98, arms_2 = 0,
			pants_1 = 103,   pants_2 = 3,
			shoes_1 = 71,   shoes_2 = 3,
			helmet_1 = -1,  helmet_2 = 0,
			chain_1 = 0,    chain_2 = 0,
			bproof_1 = 0,  bproof_2 = 0,
			mask_1 = 123,     mask_2 = 0,
			ears_1 = -1,     ears_2 = 0,
			glasses_1 = 26,  glasses_2 = 0,
			bracelets_1 = -1, bracelets_2 = 0,
			watches_1 = -1, watches_2 = 0,
		},
		['Pilot'] = {
			tshirt_1 = 75,  tshirt_2 = 3,
			torso_1 = 232,   torso_2 = 10,
			decals_1 = 0,   decals_2 = 0,
			arms = 98, arms_2 = 0,
			pants_1 = 79,   pants_2 = 0,
			shoes_1 = 75,   shoes_2 = 6,
			helmet_1 =19,  helmet_2 = 0,
			chain_1 = 0,    chain_2 = 0,
			bproof_1 = 0,  bproof_2 = 0,
			mask_1 = -1,     mask_2 = 0,
			ears_1 = -1,     ears_2 = 0,
			glasses_1 = -1,  glasses_2 = 0,
			bracelets_1 = -1, bracelets_2 = 0,
			watches_1 = -1, watches_2 = 0,
		},
		['Horolezec'] = {
			['tshirt_1'] = 77, ['tshirt_2'] = 0,
			['torso_1'] = 235, ['torso_2'] = 0,
			['decals_1'] = 0, ['decals_2'] = 0,
			['arms'] = 141, ['arms_2'] = 3,
			['pants_1'] = 102, ['pants_2'] = 0,
			['shoes_1'] = 55, ['shoes_2'] = 0,
			['chain_1'] = 0, ['chain_2'] = 0,
			['helmet_1'] = 45, ['helmet_2'] = 0,
			['mask_1'] = 127, ['mask_2'] = 0,
			bproof_1 = 0,  bproof_2 = 0,
		},
		['Hazmat'] = {
			tshirt_1 = 56,  tshirt_2 = 0,
			torso_1 = 257,   torso_2 = 0,
			decals_1 = 16,   decals_2 = 0,
			arms = 71, arms_2 = 0,
			pants_1 = 106,   pants_2 = 0,
			shoes_1 = 76,   shoes_2 = 1,
			helmet_1 = -1,  helmet_2 = 0,
			chain_1 = 0,    chain_2 = 0,
			bproof_1 = 13,  bproof_2 = 0,
			mask_1 = 47,     mask_2 = 0,
			ears_1 = -1,     ears_2 = 0,
			glasses_1 = 0,  glasses_2 = 0,
			bracelets_1 = -1, bracelets_2 = 0,
			watches_1 = -1, watches_2 = 0,
		},
		['Ceremonial'] = {
			['tshirt_1'] = 34, ['tshirt_2'] = 0,
			['torso_1'] = 144, ['torso_2'] = 6,
			['decals_1'] = 0, ['decals_2'] = 0,
			['arms'] = 79, ['arms_2'] = 0,
			['pants_1'] = 33, ['pants_2'] = 0,
			['shoes_1'] = 10, ['shoes_2'] = 0,
			['chain_1'] = 25, ['chain_2'] = 2,
			['helmet_1'] = 113, ['helmet_2'] = 3,
			['mask_1'] = 0, ['mask_2'] = 0,
			bproof_1 = 0,  bproof_2 = 0,
		},
		['Pyrotechnik'] = {
			tshirt_1 = 100,  tshirt_2 = 7,
			torso_1 = 190,   torso_2 = 10,
			decals_1 = 16,   decals_2 = 0,
			arms = 112, arms_2 = 3,
			pants_1 = 93,   pants_2 = 10,
			shoes_1 = 29,   shoes_2 = 0,
			helmet_1 = 123,  helmet_2 = 0,
			chain_1 = 0,    chain_2 = 0,
			bproof_1 = 13,  bproof_2 = 0,
			mask_1 = 108,     mask_2 = 18,
			ears_1 = -1,     ears_2 = 0,
			glasses_1 = 0,  glasses_2 = 0,
			bracelets_1 = -1, bracelets_2 = 0,
			watches_1 = -1, watches_2 = 0,
		},
	},
	female = {
		['Hasic'] = {
			tshirt_1 = 0,  tshirt_2 = 0,
			torso_1 = 268,   torso_2 = 0,
			decals_1 = 0,   decals_2 = 0,
			arms = 136, arms_2 = 0,
			pants_1 = 109,   pants_2 = 0,
			shoes_1 = 28,   shoes_2 = 0,
			helmet_1 = 45,  helmet_2 = 0,
			chain_1 = 0,    chain_2 = 0,
			bproof_1 = 0,  bproof_2 = 0,
			mask_1 = -1,     mask_2 = 0,
			ears_1 = -1,     ears_2 = 0,
			glasses_1 = 12,  glasses_2 = 0,
			bracelets_1 = -1, bracelets_2 = 0,
			watches_1 = -1, watches_2 = 0,
		},
		['Hasic Pozar'] = {
			tshirt_1 = 51,  tshirt_2 = 0,
			torso_1 = 268,   torso_2 = 0,
			decals_1 = 0,   decals_2 = 0,
			arms = 83, arms_2 = 0,
			pants_1 = 109,   pants_2 = 0,
			shoes_1 = 28,   shoes_2 = 0,
			helmet_1 = 45,  helmet_2 = 0,
			chain_1 = 0,    chain_2 = 0,
			bproof_1 = 0,  bproof_2 = 0,
			mask_1 = -1,     mask_2 = 0,
			ears_1 = -1,     ears_2 = 0,
			glasses_1 = 12,  glasses_2 = 0,
			bracelets_1 = -1, bracelets_2 = 0,
			watches_1 = -1, watches_2 = 0,
		},
		['Hasic Volny'] = {
			tshirt_1 = 68,  tshirt_2 = 0,
			torso_1 = 14,   torso_2 = 3,
			decals_1 = 0,   decals_2 = 0,
			arms = 76, arms_2 = 0,
			pants_1 = 26,   pants_2 = 0,
			shoes_1 = 58,   shoes_2 = 0,
			helmet_1 = -1,  helmet_2 = 0,
			chain_1 = 0,    chain_2 = 0,
			bproof_1 = 2,  bproof_2 = 0,
			mask_1 = -1,     mask_2 = 0,
			ears_1 = -1,     ears_2 = 0,
			glasses_1 = 12,  glasses_2 = 0,
			bracelets_1 = -1, bracelets_2 = 0,
			watches_1 = -1, watches_2 = 0,
		},
		['Hasic Pyro'] = {
			tshirt_1 = 41,  tshirt_2 = 2,
			torso_1 = 197,   torso_2 = 10,
			decals_1 = 0,   decals_2 = 0,
			arms = 200, arms_2 = 1,
			pants_1 = 94,   pants_2 = 10,
			shoes_1 = 10,   shoes_2 = 0,
			helmet_1 = 125,  helmet_2 = 0,
			chain_1 = 0,    chain_2 = 0,
			bproof_1 = 0,  bproof_2 = 0,
			mask_1 = 35,     mask_2 = 0,
			ears_1 = -1,     ears_2 = 0,
			glasses_1 = 12,  glasses_2 = 0,
			bracelets_1 = -1, bracelets_2 = 0,
			watches_1 = -1, watches_2 = 0,
		},
		['Hasic Ceremonial'] = {
			tshirt_1 = 41,  tshirt_2 = 0,
			torso_1 = 62,   torso_2 = 2,
			decals_1 = 0,   decals_2 = 0,
			arms = 87, arms_2 = 0,
			pants_1 = 6,   pants_2 = 0,
			shoes_1 = 10,   shoes_2 = 0,
			helmet_1 = 113,  helmet_2 = 0,
			chain_1 = 23,    chain_2 = 0,
			bproof_1 = 0,  bproof_2 = 0,
			mask_1 = -1,     mask_2 = 0,
			ears_1 = -1,     ears_2 = 0,
			glasses_1 = 12,  glasses_2 = 0,
			bracelets_1 = -1, bracelets_2 = 0,
			watches_1 = -1, watches_2 = 0,
		},
		['Hasic Potapec'] = {
			tshirt_1 = 156,  tshirt_2 = 0,
			torso_1 = 260,   torso_2 = 0,
			decals_1 = 0,   decals_2 = 0,
			arms = 204, arms_2 = 0,
			pants_1 = 87,   pants_2 = 6,
			shoes_1 = 37,   shoes_2 = 0,
			helmet_1 = -1,  helmet_2 = 0,
			chain_1 = 0,    chain_2 = 0,
			bproof_1 = 0,  bproof_2 = 0,
			mask_1 = 38,     mask_2 = 0,
			ears_1 = -1,     ears_2 = 0,
			glasses_1 = 12,  glasses_2 = 0,
			bracelets_1 = -1, bracelets_2 = 0,
			watches_1 = -1, watches_2 = 0,
		},
	},
}

Config.AuthorizedVehicles = {
	{ model = 'FDbrush', label = 'Brush', price = 1},
	{ model = 'FDladder', label = 'Zebrik', price = 1},
	{ model = 'FDsquad', label = 'Heavy Squad', price = 1},
	{ model = 'bctahoe', label = 'Velitelsky vuz', price = 1, jobGrades = {'lowerboss1', 'boss'}},
	{ model = 'firetruk', label = 'Fire Truck', price = 1},
	{ model = 'hrescue', label = 'Heavy Rescue', price = 1},
	{ model = 'nspeedofiremni', label = 'Vapid Speedo', price = 1, props = { modLivery = 1 }}
}

Config.SpawnPoints = {
	{ coords = vector3(-1661.1, 66.12, 64.45), heading = 95.59, radius = 2.0 },
}

Config.VehicleShopCoords = {
	coords = vector3(-1681.31, 72.82, 72.49),
	heading = 192.0,
}

Config.FireStations = {

	ElBurroHeights = {

		Blip = {
			coords = vector3(-1681.31, 72.82, 72.49),
			sprite = 436,
			scale  = 1.2,
			color  = 1,
			mapLabel = 'Hasici'
		},

		BossActions = {
			vector3(-1674.58, 69.29, 65.01),
			scale  = 0.1,
		},

		Vehicles = {
			{
				Spawner = vector3(-1664.53, 57.79, 64.99),
				InsideShop = vector3(-1681.31, 72.82, 72.49),
				Marker = { type = 36, x = 1.0, y = 1.0, z = 1.0, r = 100, g = 50, b = 200, a = 100, rotate = true },
				SpawnPoints = {
					{ coords = vector3(-1661.1, 66.12, 64.45), heading = 95.59, radius = 2.0 },
				}
			}
		},

		Helicopters = {
			{
				Spawner = vector3(-1699.99, 44.02, 65.18),
				InsideShop = vector3(-1681.31, 72.82, 72.49),
				Marker = { type = 34, x = 1.5, y = 1.5, z = 1.5, r = 100, g = 150, b = 150, a = 100, rotate = true },
				SpawnPoints = {
					{ coords = vector3(-1683.378, 35.41489, 64.52446), heading = 256.53, radius = 2.0 },
				}
			}
		},

		FastTravelsPrompt = {
			-- {
			-- 	From = vector3(1191.84, -1474.7, 33.86),
			-- 	To = { coords = vector3(1190.81, -1484.31, 39.32), heading = 104.01 },
			-- 	Marker = { type = 1, x = 1.5, y = 1.5, z = 0.5, r = 102, g = 0, b = 102, a = 100, rotate = false },
			-- 	Prompt = 'Stiskni ~INPUT_CONTEXT~ pro vstup k heliportu'
			-- },
			-- {
			-- 	From = vector3(1190.81, -1484.31, 38.32),
			-- 	To = { coords = vector3(1191.84, -1474.7, 34.86), heading = 268.16 },
			-- 	Marker = { type = 1, x = 1.5, y = 1.5, z = 0.5, r = 102, g = 0, b = 102, a = 100, rotate = false },
			-- 	Prompt = 'Stiskni ~INPUT_CONTEXT~ pro odchod z heliportu '
			-- },

			-- TELEPORT DO INTERIERU
			-- {
			-- 	From = vector3(1194.24, -1467.54, 33.86),
			-- 	To = { coords = vector3(1197.87, -1464.42, 0.21), heading = 179.84 },
			-- 	Marker = { type = 1, x = 1.5, y = 1.5, z = 0.5, r = 102, g = 0, b = 102, a = 100, rotate = false },
			-- 	Prompt = 'Stiskni ~INPUT_CONTEXT~ pro vstup do ubikací'
			-- },
			-- {
			-- 	From = vector3(1197.87, -1464.42, 0.21),
			-- 	To = { coords = vector3(1194.77, -1467.13, 33.86), heading = 271.46 },
			-- 		Marker = { type = 1, x = 1.5, y = 1.5, z = 0.5, r = 102, g = 0, b = 102, a = 100, rotate = false },
			-- 	Prompt = 'Stiskni ~INPUT_CONTEXT~ pro odchod z ubikací'
			-- },
		}

	}
}


-- Config.AuthorizedVehicles = {
-- 	trial = {
-- 		{ model = 'FDbrush', label = 'Brush', price = 1},
-- 		{ model = 'firetruk', label = 'Fire Truck', price = 1},
-- 		{ model = 'FDladder', label = 'Zebrik', price = 1},
-- 		{ model = 'FDsquad', label = 'Heavy Squad', price = 1},
-- 		{ model = 'hrescue', label = 'Heavy Rescue', price = 1},
-- 		VAPID
-- 	},
-- 	rank2 = {
-- 		{ model = 'FDbrush', label = 'Brush', price = 1},
-- 		{ model = 'firetruk', label = 'Fire Truck', price = 1},
-- 		{ model = 'FDladder', label = 'Zebrik', price = 1},
-- 		{ model = 'FDsquad', label = 'Heavy Squad', price = 1},
-- 		{ model = 'hrescue', label = 'Heavy Rescue', price = 1},
-- 		VAPID
-- 	},
-- 	rank3 = {
-- 		{ model = 'FDbrush', label = 'Brush', price = 1},
-- 		{ model = 'firetruk', label = 'Fire Truck', price = 1},
-- 		{ model = 'FDladder', label = 'Zebrik', price = 1},
-- 		{ model = 'FDsquad', label = 'Heavy Squad', price = 1},
-- 		{ model = 'hrescue', label = 'Heavy Rescue', price = 1},
-- 		VAPID
-- 	},
-- 	rank4 = {
-- 		{ model = 'FDbrush', label = 'Brush', price = 1},
-- 		{ model = 'firetruk', label = 'Fire Truck', price = 1},
-- 		{ model = 'FDladder', label = 'Zebrik', price = 1},
-- 		{ model = 'FDsquad', label = 'Heavy Squad', price = 1},
-- 		{ model = 'hrescue', label = 'Heavy Rescue', price = 1},
-- 		VAPID
-- 	},
-- 	rank5 = {
-- 		{ model = 'FDbrush', label = 'Brush', price = 1},
-- 		{ model = 'firetruk', label = 'Fire Truck', price = 1},
-- 		{ model = 'FDladder', label = 'Zebrik', price = 1},
-- 		{ model = 'FDsquad', label = 'Heavy Squad', price = 1},
-- 		{ model = 'hrescue', label = 'Heavy Rescue', price = 1},
-- 		VAPID
-- 	},
-- 	rank6 = {
-- 		{ model = 'FDbrush', label = 'Brush', price = 1},
-- 		{ model = 'firetruk', label = 'Fire Truck', price = 1},
-- 		{ model = 'FDladder', label = 'Zebrik', price = 1},
-- 		{ model = 'FDsquad', label = 'Heavy Squad', price = 1},
-- 		{ model = 'hrescue', label = 'Heavy Rescue', price = 1},
-- 		VAPID
-- 	},
-- 	rank7 = {
-- 		{ model = 'FDbrush', label = 'Brush', price = 1},
-- 		{ model = 'firetruk', label = 'Fire Truck', price = 1},
-- 		{ model = 'FDladder', label = 'Zebrik', price = 1},
-- 		{ model = 'FDsquad', label = 'Heavy Squad', price = 1},
-- 		{ model = 'hrescue', label = 'Heavy Rescue', price = 1},
-- 		VAPID
-- 	},
-- 	rank8 = {
-- 		{ model = 'FDbrush', label = 'Brush', price = 1},
-- 		{ model = 'firetruk', label = 'Fire Truck', price = 1},
-- 		{ model = 'FDladder', label = 'Zebrik', price = 1},
-- 		{ model = 'FDsquad', label = 'Heavy Squad', price = 1},
-- 		{ model = 'hrescue', label = 'Heavy Rescue', price = 1},
-- 		VAPID
-- 	},
-- 	rank9 = {
-- 		{ model = 'FDbrush', label = 'Brush', price = 1},
-- 		{ model = 'firetruk', label = 'Fire Truck', price = 1},
-- 		{ model = 'FDladder', label = 'Zebrik', price = 1},
-- 		{ model = 'FDsquad', label = 'Heavy Squad', price = 1},
-- 		{ model = 'hrescue', label = 'Heavy Rescue', price = 1},
-- 		VAPID
-- 	},
-- 	boss = {
-- 		{ model = 'FDbrush', label = 'Brush', price = 1},
-- 		{ model = 'FDladder', label = 'Zebrik', price = 1},
-- 		{ model = 'FDsquad', label = 'Heavy Squad', price = 1},
-- 		{ model = 'bctahoe', label = 'Velitelsky vuz', price = 1},
-- 		{ model = 'firetruk', label = 'Fire Truck', price = 1},
-- 		{ model = 'hrescue', label = 'Heavy Rescue', price = 1},
-- 		VAPID
-- 	},
-- }

Config.AuthorizedHelicopters = {

	rank2 = {
		{ model = 'firehawk', label = 'FireHawk', price = 1 }
	},
	rank3 = {
		{ model = 'firehawk', label = 'FireHawk', price = 1 }
	},
	rank4 = {
		{ model = 'firehawk', label = 'FireHawk', price = 1 }
	},
	rank5 = {
		{ model = 'firehawk', label = 'FireHawk', price = 1 }
	},
	boss = {
		{ model = 'firehawk', label = 'FireHawk', price = 1 }
	},
}
