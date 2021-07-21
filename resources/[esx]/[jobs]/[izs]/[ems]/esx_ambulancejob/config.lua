Config                            = {}

Config.DrawDistance               = 100.0

Config.Marker                     = { type = 2, x = 0.7, y = 0.7, z = 0.5, r = 204, g = 0, b = 0, a = 100, rotate = false }
Config.Marker2                     = { type = 1, x = 1.5, y = 1.5, z = 1.0, r = 204, g = 0, b = 0, a = 100, rotate = false }

Config.ReviveReward               = 500  -- revive reward, set to 0 if you don't want it enabled
Config.AntiCombatLog              = false -- enable anti-combat logging?
Config.LoadIpl                    = true
Config.Locale = 'cs'

local second = 1000
local minute = 60 * second

Config.EarlyRespawnTimer          = 10 * minute  -- Time til respawn is available
Config.FastEarlyRespawnTimer          = 30 * second  -- Time til respawn is available
Config.BleedoutTimer              = 5 * minute -- Time til the player bleeds out

Config.JIPCoords = vector3(316.37, -582.5, 42.28)
Config.OUTCoords = vector3(299.6, -582.16, 42.26)

Config.EnablePlayerManagement     = true

Config.RemoveWeaponsAfterRPDeath  = false
Config.RemoveCashAfterRPDeath     = false
Config.RemoveItemsAfterRPDeath    = false

-- Let the player pay for respawning early, only if he can afford it.
Config.EarlyRespawnFine           = false
Config.EarlyRespawnFineAmount     = 20000

Config.RespawnPoint = { coords = vector3(305.2, -594.5, 42.28), heading = 65.75}

Config.PilotOutfit = {
	male = {
		['tshirt_1'] = 15, ['tshirt_2'] = 0,
		['torso_1'] = 232, ['torso_2'] = 19,
		['arms'] = 96, ['arms_2'] = 0,
		['pants_1'] = 101, ['pants_2'] = 19,
		['shoes_1'] = 77, ['shoes_2'] = 0,
		['helmet_1'] = 19,
	},
	female = {
		['tshirt_1'] = 15, ['tshirt_2'] = 0,
		['torso_1'] = 232, ['torso_2'] = 19,
		['arms'] = 96, ['arms_2'] = 0,
		['pants_1'] = 101, ['pants_2'] = 19,
		['shoes_1'] = 77, ['shoes_2'] = 0,
		['helmet_1'] = 19,
	},
}

Config.Hospitals = {

	PillBoxHospital = {

		Blip = {
			coords = vector3(312.71, -591.44, 43.28),
			sprite = 61,
			scale  = 1.2,
			color  = 2,
			mapLabel = 'Ambulance'
		},

		CoronerBlip = {
			coords = vector3(245.93, -1371.08, 32.51),
			sprite = 84,
			scale  = 1.2,
			color  = 4,
			mapLabel = 'Dum Coronera'
		},

		Cekarna = {
			vector3(306.72, -594.7, 42.28),
		},

		Vault = {
			vector3(341.21, -589.09, 42.28),
		},

		AmbulanceActions = {
			vector3(334.54, -592.35, 43.28),
			vector3(298.65, -599.03, 43.28),
			vector3(337.8, -587.75, 74.16),
		},

		Pharmacies = {
			vector3(309.3, -562.52, 43.28)
		},

		Vehicles = {
			{
				Spawner = vector3(323.52, -555.85, 28.74),
				InsideShop = vector3(321.37, -565.59, 90.61),
				Marker = { type = 36, x = 1.0, y = 1.0, z = 1.0, r = 204, g = 0, b = 0, a = 100, rotate = true },
				SpawnPoints = {
					{ coords = vector3(330.28, -556.02, 28.74), heading = 339.04, radius = 4.0 },
					{ coords = vector3(340.79, -560.83, 28.74), heading = 339.04, radius = 4.0 },
				}
			}
		},

		Helicopters = {
			{
				Spawner = vector3(339.94, -592.2, 74.16),
				InsideShop = vector3(314.95, -576.48, 94.48),
				Marker = { type = 34, x = 1.5, y = 1.5, z = 1.5, r = 204, g = 0, b = 0, a = 100, rotate = true },
				SpawnPoints = {
					{ coords = vector3(350.72, -587.54, 74.17), heading = 242.08, radius = 10.0 },
				}
			}
		},

		FastTravels = {
			
			
		},

		FastTravelsPrompt = {
			{
				From = vector3(332.227, -595.82, 42.28),
				To = { coords = vector3(360.57, -585.19, 27.82), heading = 242.77 },
				Marker = { type = 1, x = 1.5, y = 1.5, z = 0.5, r = 204, g = 0, b = 0, a = 100, rotate = false },
				Prompt = _U('fast_travel')
			},
			
			{
				From = vector3(327.33, -603.3, 42.28),
				To = { coords = vector3(340.93, -584.03, 74.17), heading = 245.5 },
				Marker = { type = 1, x = 2.0, y = 2.0, z = 0.5, r = 204, g = 0, b = 0, a = 100, rotate = false },
				Prompt = _U('fast_travel')
			},
			{
				From = vector3(338.53, -583.8, 73.17),
				To = { coords = vector3(328.18, -601.92, 43.28), heading = 329.95 },
				Marker = { type = 1, x = 2.0, y = 2.0, z = 0.5, r = 204, g = 0, b = 0, a = 100, rotate = false },
				Prompt = _U('fast_travel')
			},

			{
				From = vector3(360.63, -585.35, 27.82),
				To = { coords = vector3(332.227, -595.82, 43.28), heading = 160.55 },
				Marker = { type = 1, x = 1.5, y = 1.5, z = 0.5, r = 204, g = 0, b = 0, a = 100, rotate = false },
				Prompt = _U('fast_travel')
			},
			
			{
				From = vector3(330.02, -601.03, 42.28),
				To = { coords = vector3(319.06, -559.24, 28.74), heading = 245.5 },
				Marker = { type = 1, x = 2.0, y = 2.0, z = 0.5, r = 204, g = 0, b = 0, a = 100, rotate = false },
				Prompt = _U('fast_travel')
			},
			
			{
				From = vector3(319.06, -559.24, 27.74),
				To = { coords = vector3(330.02, -601.03, 43.28), heading = 329.95 },
				Marker = { type = 1, x = 2.0, y = 2.0, z = 0.5, r = 204, g = 0, b = 0, a = 100, rotate = false },
				Prompt = _U('fast_travel')
			},

			{
				From = vector3(240.41, -1379.98, 32.74),
				To = { coords = vector3(275.44, -1361.13, 24.54), heading = 329.95 },
				Marker = { type = 1, x = 2.0, y = 2.0, z = 0.5, r = 204, g = 0, b = 0, a = 100, rotate = false },
				Prompt = _U('fast_travel')
			},
			{
				From = vector3(275.44, -1361.13, 23.54),
				To = { coords = vector3(240.41, -1379.98, 33.74), heading = 329.95 },
				Marker = { type = 1, x = 2.0, y = 2.0, z = 0.5, r = 204, g = 0, b = 0, a = 100, rotate = false },
				Prompt = _U('fast_travel')
			}
		}

	}
}

Config.Clothes = {
	shared = {
		male = {
			bproof_1 = 0,  bproof_2 = 0,
			mask_1 = -1,     mask_2 = 0,
			ears_1 = -1,     ears_2 = 0,
			glasses_1 = 0,  glasses_2 = 0,
			bracelets_1 = -1, bracelets_2 = 0,
			watches_1 = -1, watches_2 = 0,
		},
		female = {
			bproof_1 = 0,  bproof_2 = 0,
			mask_1 = -1,     mask_2 = 0,
			ears_1 = -1,     ears_2 = 0,
			glasses_1 = 12,  glasses_2 = 0,
			bracelets_1 = -1, bracelets_2 = 0,
			watches_1 = -1, watches_2 = 0,
		},
	},
	male = {
		ambulance = {
			tshirt_1 = 22,  tshirt_2 = 2,
			torso_1 = 254,   torso_2 = 0,
			decals_1 = 58,   decals_2 = 0,
			arms = 87, arms_2 = 0,
			pants_1 = 33,   pants_2 = 4,
			shoes_1 = 30,   shoes_2 = 3,
			helmet_1 = 122,  helmet_2 = 0,
			chain_1 = 127,    chain_2 = 0,
		},
		doctor = {
			tshirt_1 = 22,  tshirt_2 = 2,
			torso_1 = 254,   torso_2 = 0,
			decals_1 = 58,   decals_2 = 0,
			arms = 87, arms_2 = 0,
			pants_1 = 33,   pants_2 = 0,
			shoes_1 = 30,   shoes_2 = 1,
			helmet_1 = 122,  helmet_2 = 0,
			chain_1 = 127,    chain_2 = 0,
		},
		zkusenyzachranar = {
			tshirt_1 = 57,  tshirt_2 = 0,
			torso_1 = 13,   torso_2 = 4,
			decals_1 = 57,   decals_2 = 0,
			arms = 94, arms_2 = 1,
			pants_1 = 33,   pants_2 = 2,
			shoes_1 = 30,   shoes_2 = 2,
			helmet_1 = -1,  helmet_2 = 0,
			chain_1 = 126,    chain_2 = 0,
		},
		zachranarpilot = {
			tshirt_1 = 57,  tshirt_2 = 0,
			torso_1 = 13,   torso_2 = 3,
			decals_1 = 57,   decals_2 = 0,
			arms = 94, arms_2 = 0,
			pants_1 = 33,   pants_2 = 1,
			shoes_1 = 30,   shoes_2 = 4,
			helmet_1 = -1,  helmet_2 = 0,
			chain_1 = 126,    chain_2 = 0,
		},
		seniorparamedic = {
			tshirt_1 = 15,  tshirt_2 = 0,
			torso_1 = 254,   torso_2 = 0,
			decals_1 = 58,   decals_2 = 0,
			arms = 87, arms_2 = 0,
			pants_1 = 33,   pants_2 = 5,
			shoes_1 = 30,   shoes_2 = 2,
			helmet_1 = -1,  helmet_2 = 0,
			chain_1 = 126,    chain_2 = 0,
		},
		chief_doctor = {
			tshirt_1 = 15,  tshirt_2 = 0,
			torso_1 = 254,   torso_2 = 1,
			decals_1 = 58,   decals_2 = 0,
			arms = 87, arms_2 = 0,
			pants_1 = 33,   pants_2 = 0,
			shoes_1 = 30,   shoes_2 = 1,
			helmet_1 = -1,  helmet_2 = 0,
			chain_1 = 126,    chain_2 = 0,
		},

		director = {
			tshirt_1 = 15,  tshirt_2 = 0,
			torso_1 = 3,   torso_2 = 15,
			decals_1 = 57,   decals_2 = 0,
			arms = 90, arms_2 = 0,
			pants_1 = 33,   pants_2 = 3,
			shoes_1 = 30,   shoes_2 = 1,
			helmet_1 = -1,  helmet_2 = 0,
			chain_1 = 126,    chain_2 = 0,
		},

		corporal = {
			tshirt_1 = 15,  tshirt_2 = 0,
			torso_1 = 13,   torso_2 = 3,
			decals_1 = 57,   decals_2 = 0,
			arms = 94, arms_2 = 1,
			pants_1 = 33,   pants_2 = 5,
			shoes_1 = 30,   shoes_2 = 2,
			helmet_1 = -1,  helmet_2 = 0,
			chain_1 = 126,    chain_2 = 0,
		},

		major = {
			tshirt_1 = 15,  tshirt_2 = 0,
			torso_1 = 13,   torso_2 = 2,
			decals_1 = 58,   decals_2 = 0,
			arms = 87, arms_2 = 0,
			pants_1 = 33,   pants_2 = 0,
			shoes_1 = 30,   shoes_2 = 1,
			helmet_1 = -1,  helmet_2 = 0,
			chain_1 = 126,    chain_2 = 0,
		},

		emtaparamedics = {
			tshirt_1 = 15,  tshirt_2 = 0,
			torso_1 = 13,   torso_2 = 0,
			decals_1 = 57,   decals_2 = 0,
			arms = 94, arms_2 = 1,
			pants_1 = 33,   pants_2 = 5,
			shoes_1 = 30,   shoes_2 = 2,
			helmet_1 = -1,  helmet_2 = 0,
			chain_1 = 126,    chain_2 = 0,
		},
		lowerboss2 = {
			tshirt_1 = 15,  tshirt_2 = 0,
			torso_1 = 13,   torso_2 = 0,
			decals_1 = 57,   decals_2 = 0,
			arms = 94, arms_2 = 1,
			pants_1 = 33,   pants_2 = 1,
			shoes_1 = 30,   shoes_2 = 2,
			helmet_1 = -1,  helmet_2 = 0,
			chain_1 = 126,    chain_2 = 0,
		},
		lowerboss1 = {
			tshirt_1 = 15,  tshirt_2 = 0,
			torso_1 = 13,   torso_2 = 0,
			decals_1 = 57,   decals_2 = 0,
			arms = 94, arms_2 = 1,
			pants_1 = 33,   pants_2 = 2,
			shoes_1 = 30,   shoes_2 = 2,
			helmet_1 = -1,  helmet_2 = 0,
			chain_1 = 126,    chain_2 = 0,
		},
		boss = {
			tshirt_1 = 15,  tshirt_2 = 0,
			torso_1 = 13,   torso_2 = 0,
			decals_1 = 57,   decals_2 = 0,
			arms = 94, arms_2 = 1,
			pants_1 = 33,   pants_2 = 0,
			shoes_1 = 30,   shoes_2 = 2,
			helmet_1 = -1,  helmet_2 = 0,
			chain_1 = 126,    chain_2 = 0,
		},
	},
	female = {
		ambulance = {
			tshirt_1 = 21,  tshirt_2 = 2,
			torso_1 = 267,   torso_2 = 0,
			decals_1 = 66,   decals_2 = 0,
			arms = 109, arms_2 = 0,
			pants_1 = 45,   pants_2 = 4,
			shoes_1 = 3,   shoes_2 = 2,
			helmet_1 = -1,  helmet_2 = 0,
			chain_1 = 98,    chain_2 = 0,
		},
		doctor = {
			tshirt_1 = 22,  tshirt_2 = 2,
			torso_1 = 254,   torso_2 = 0,
			decals_1 = 66,   decals_2 = 0,
			arms = 109, arms_2 = 0,
			pants_1 = 45,   pants_2 = 0,
			shoes_1 = 3,   shoes_2 = 0,
			helmet_1 = -1,  helmet_2 = 0,
			chain_1 = 98,    chain_2 = 0,
		},
		zkusenyzachranar = {
			tshirt_1 = 22,  tshirt_2 = 2,
			torso_1 = 254,   torso_2 = 0,
			decals_1 = 66,   decals_2 = 0,
			arms = 109, arms_2 = 0,
			pants_1 = 45,   pants_2 = 0,
			shoes_1 = 3,   shoes_2 = 0,
			helmet_1 = -1,  helmet_2 = 0,
			chain_1 = 98,    chain_2 = 0,
		},
		zachranarpilot = {
			tshirt_1 = 22,  tshirt_2 = 2,
			torso_1 = 254,   torso_2 = 0,
			decals_1 = 66,   decals_2 = 0,
			arms = 109, arms_2 = 0,
			pants_1 = 45,   pants_2 = 0,
			shoes_1 = 3,   shoes_2 = 0,
			helmet_1 = -1,  helmet_2 = 0,
			chain_1 = 98,    chain_2 = 0,
		},
		seniorparamedic = {
			tshirt_1 = 1,  tshirt_2 = 0,
			torso_1 = 267,   torso_2 = 0,
			decals_1 = 66,   decals_2 = 0,
			arms = 109, arms_2 = 0,
			pants_1 = 45,   pants_2 = 5,
			shoes_1 = 3,   shoes_2 = 1,
			helmet_1 = -1,  helmet_2 = 0,
			chain_1 = 97,    chain_2 = 0,
		},
		chief_doctor = {
			tshirt_1 = 1,  tshirt_2 = 0,
			torso_1 = 267,   torso_2 = 1,
			decals_1 = 66,   decals_2 = 0,
			arms = 109, arms_2 = 0,
			pants_1 = 45,   pants_2 = 0,
			shoes_1 = 3,   shoes_2 = 0,
			helmet_1 = -1,  helmet_2 = 0,
			chain_1 = 97,    chain_2 = 0,
		},
		director = {
			tshirt_1 = 62,  tshirt_2 = 2,
			torso_1 = 9,   torso_2 = 3,
			decals_1 = 66,   decals_2 = 0,
			arms = 109, arms_2 = 1,
			pants_1 = 45,   pants_2 = 1,
			shoes_1 = 3,   shoes_2 = 10,
			helmet_1 = -1,  helmet_2 = 0,
			chain_1 = 97,    chain_2 = 0,
		},
		corporal = {
			tshirt_1 = 62,  tshirt_2 = 0,
			torso_1 = 9,   torso_2 = 2,
			decals_1 = 66,   decals_2 = 0,
			arms = 109, arms_2 = 0,
			pants_1 = 45,   pants_2 = 5,
			shoes_1 = 3,   shoes_2 = 1,
			helmet_1 = -1,  helmet_2 = 0,
			chain_1 = 97,    chain_2 = 0,
		},
		major = {
			tshirt_1 = 62,  tshirt_2 = 1,
			torso_1 = 9,   torso_2 = 0,
			decals_1 = 66,   decals_2 = 0,
			arms = 109, arms_2 = 0,
			pants_1 = 45,   pants_2 = 0,
			shoes_1 = 3,   shoes_2 = 0,
			helmet_1 = -1,  helmet_2 = 0,
			chain_1 = 97,    chain_2 = 0,
		},
		emtaparamedics = {
			tshirt_1 = 62,  tshirt_2 = 0,
			torso_1 = 9,   torso_2 = 1,
			decals_1 = 66,   decals_2 = 0,
			arms = 109, arms_2 = 1,
			pants_1 = 45,   pants_2 = 5,
			shoes_1 = 3,   shoes_2 = 1,
			helmet_1 = -1,  helmet_2 = 0,
			chain_1 = 97,    chain_2 = 0,
		},
		lowerboss2 = {
			tshirt_1 = 62,  tshirt_2 = 0,
			torso_1 = 9,   torso_2 = 1,
			decals_1 = 66,   decals_2 = 0,
			arms = 109, arms_2 = 1,
			pants_1 = 45,   pants_2 = 6,
			shoes_1 = 3,   shoes_2 = 1,
			helmet_1 = -1,  helmet_2 = 0,
			chain_1 = 97,    chain_2 = 0,
		},
		lowerboss1 = {
			tshirt_1 = 62,  tshirt_2 = 0,
			torso_1 = 9,   torso_2 = 1,
			decals_1 = 66,   decals_2 = 0,
			arms = 109, arms_2 = 1,
			pants_1 = 45,   pants_2 = 2,
			shoes_1 = 3,   shoes_2 = 1,
			helmet_1 = -1,  helmet_2 = 0,
			chain_1 = 97,    chain_2 = 0,
		},
		boss = {
			tshirt_1 = 62,  tshirt_2 = 0,
			torso_1 = 9,   torso_2 = 1,
			decals_1 = 66,   decals_2 = 0,
			arms = 109, arms_2 = 1,
			pants_1 = 45,   pants_2 = 0,
			shoes_1 = 3,   shoes_2 = 1,
			helmet_1 = -1,  helmet_2 = 0,
			chain_1 = 97,    chain_2 = 0,
		},
	},
}

Config.AuthorizedVehicles = {

	ambulance = {
		{ model = 'ambulance', label = 'Ambulance', price = 1},
		{ model = 'dodgeEMS', label = 'EMS Dodge', price = 1},
		{ model = 'qrv', label = 'Ford Explorer', price = 1},
	},

	doctor = {
		{ model = 'ambulance', label = 'Ambulance', price = 100},
		{ model = 'dodgeEMS', label = 'EMS Dodge', price = 1},
		{ model = 'qrv', label = 'Ford Explorer', price = 1},
	},

	chief_doctor = {
		{ model = 'ambulance', label = 'Ambulance', price = 100},
		{ model = 'dodgeEMS', label = 'EMS Dodge', price = 1},
		{ model = 'qrv', label = 'Ford Explorer', price = 1},
	},

	zkusenyzachranar = {
		{ model = 'ambulance', label = 'Ambulance', price = 100},
		{ model = 'dodgeEMS', label = 'EMS Dodge', price = 1},
		{ model = 'qrv', label = 'Ford Explorer', price = 1},
	},

	zachranarpilot = {
		{ model = 'ambulance', label = 'Ambulance', price = 100},
		{ model = 'dodgeEMS', label = 'EMS Dodge', price = 1},
		{ model = 'qrv', label = 'Ford Explorer', price = 1},
	},

	boss = {
		{ model = 'ambulance', label = 'Ambulance', price = 100},
		{ model = 'polgs350', label = 'Auto reditele', price = 100},
		{ model = 'dodgeEMS', label = 'EMS Dodge', price = 1},
		{ model = 'qrv', label = 'Ford Explorer', price = 1},
		{ model = 'coroner', label = 'Coroner', price = 1},
	},

	lowerboss1 = {
		{ model = 'ambulance', label = 'Ambulance', price = 100},
		{ model = 'polgs350', label = 'Auto reditele', price = 100},
		{ model = 'dodgeEMS', label = 'EMS Dodge', price = 1},
		{ model = 'qrv', label = 'Ford Explorer', price = 1},
	},

	emtaparamedics = {
		{ model = 'ambulance', label = 'Ambulance', price = 100},
		{ model = 'dodgeEMS', label = 'EMS Dodge', price = 1},
		{ model = 'qrv', label = 'Ford Explorer', price = 1},
	},

	corporal = {
		{ model = 'ambulance', label = 'Ambulance', price = 100},
		{ model = 'dodgeEMS', label = 'EMS Dodge', price = 1},
		{ model = 'qrv', label = 'Ford Explorer', price = 1},
	},

	seniorparamedic = {
		{ model = 'ambulance', label = 'Ambulance', price = 100},
		{ model = 'dodgeEMS', label = 'EMS Dodge', price = 1},
		{ model = 'qrv', label = 'Ford Explorer', price = 1},
	},

	lowerboss2 = {
		{ model = 'ambulance', label = 'Ambulance', price = 100},
		{ model = 'dodgeEMS', label = 'EMS Dodge', price = 1},
		{ model = 'qrv', label = 'Ford Explorer', price = 1},
	},

	captain = {
		{ model = 'ambulance', label = 'Ambulance', price = 100},
		{ model = 'dodgeEMS', label = 'EMS Dodge', price = 1},
		{ model = 'qrv', label = 'Ford Explorer', price = 1},
	},

	major = {
		{ model = 'ambulance', label = 'Ambulance', price = 100},
		{ model = 'dodgeEMS', label = 'EMS Dodge', price = 1},
		{ model = 'qrv', label = 'Ford Explorer', price = 1},
	},

	assistantdirector = {
		{ model = 'ambulance', label = 'Ambulance', price = 100},
		{ model = 'dodgeEMS', label = 'EMS Dodge', price = 1},
		{ model = 'qrv', label = 'Ford Explorer', price = 1},
	},

	director = {
		{ model = 'ambulance', label = 'Ambulance', price = 100},
		{ model = 'dodgeEMS', label = 'EMS Dodge', price = 1},	
		{ model = 'qrv', label = 'Ford Explorer', price = 1},
	}

}

local HELICOPTER = {model = 'EC135', label = 'EC 135', price = 150}
Config.AuthorizedHelicopters = {

	ambulance = {},

	doctor = {
		HELICOPTER
	},

	zkusenyzachranar= {
		HELICOPTER
	},

	zachranarpilot = {
		HELICOPTER,
	},

	chief_doctor = {
		HELICOPTER
	},

	boss = {
		HELICOPTER
	},

	lowerboss1 = {
		HELICOPTER
	},

	emtaparamedics = {
		HELICOPTER
	},

	corporal = {
		HELICOPTER
	},

	seniorparamedic = {
		HELICOPTER
	},

	lowerboss2 = {
		HELICOPTER
	},

	captain = {
		HELICOPTER
	},

	major = {
		HELICOPTER
	},

	assistantdirector = {
		HELICOPTER
	},

	director = {
		HELICOPTER
	}
}
