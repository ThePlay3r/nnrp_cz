Config                            = {}

Config.DrawDistance               = 100.0
Config.MarkerType                 = 1
Config.MarkerSize                 = {x = 1.5, y = 1.5, z = 0.5}
Config.MarkerColor                = {r = 50, g = 50, b = 204}

Config.EnablePlayerManagement     = true
Config.EnableArmoryManagement     = true
Config.EnableESXIdentity          = true -- enable if you're using esx_identity
Config.EnableLicenses             = true -- enable if you're using esx_license
Config.EnableJobLogs              = true -- only turn this on if you are using esx_joblogs

Config.EnableHandcuffTimer        = true -- enable handcuff timer? will unrestrain player after the time ends
Config.HandcuffTimer              = 10 * 60000 -- 10 mins

Config.EnableJobBlip              = true -- enable blips for cops on duty, requires esx_society
Config.EnableCustomPeds           = false -- enable custom peds in cloak room? See Config.CustomPeds below to customize peds

Config.EnableESXService           = false -- enable esx service?
Config.MaxInService               = -1

Config.Locale                     = 'cs'

Config.PoliceStations = {

	LSPD = {

		Blip = {
			Coords  = vector3(425.1, -979.5, 30.7),
			Sprite  = 60,
			Display = 4,
			Scale   = 1.2,
			Colour  = 29
		},

		Cloakrooms = {
			vector3(452.6, -992.8, 30.6),
		},

		Armories = {
			vector3(451.7, -980.1, 30.6),
		},

		Vehicles = {
			{
				Spawner = vector3(454.6, -1017.4, 28.4),
				InsideShop = vector3(462.41, -1011.05, 41.01),
				SpawnPoints = {
					{coords = vector3(438.4, -1018.3, 27.7), heading = 90.0, radius = 6.0},
					{coords = vector3(441.0, -1024.2, 28.3), heading = 90.0, radius = 6.0},
					{coords = vector3(453.5, -1022.2, 28.0), heading = 90.0, radius = 6.0},
					{coords = vector3(450.9, -1016.5, 28.1), heading = 90.0, radius = 6.0}
				}
			},
			
			{
				Spawner = vector3(473.3, -1018.8, 28.0),
				InsideShop = vector3(462.41, -1011.05, 41.01),
				SpawnPoints = {
					{coords = vector3(475.9, -1021.6, 28.0), heading = 276.1, radius = 6.0},
					{coords = vector3(484.1, -1023.1, 27.5), heading = 302.5, radius = 6.0}
				}
			}
		},

		Helicopters = {
			{
				Spawner = vector3(461.1, -981.5, 43.6),
				InsideShop = vector3(477.0, -1106.4, 43.0),
				SpawnPoints = {
					{coords = vector3(449.5, -981.2, 43.6), heading = 92.6, radius = 10.0}
				}
			}
		},

		BossActions = {
			vector3(450.1, -973.25, 30.6),
			vector3(464.92, -1008.73, 35.93),
		}

	}

}

Config.AuthorizedWeapons = {
	recruit = {},

	officer = {
		{weapon = 'WEAPON_COMBATPISTOL', components = {0, 0, 500, 500, nil}, price = 300000},
		{weapon = 'WEAPON_ADVANCEDRIFLE', components = {0, 500, 500, 500, 500, nil}, price = 5000000},
		{weapon = 'WEAPON_PUMPSHOTGUN', components = {500, 500, nil}, price = 700000},
	},

	sergeant = {
		{weapon = 'WEAPON_COMBATPISTOL', components = {0, 0, 500, 500, nil}, price = 300000},
		{weapon = 'WEAPON_ADVANCEDRIFLE', components = {0, 500, 500, 500, 500, nil}, price = 500000},
		{weapon = 'WEAPON_PUMPSHOTGUN', components = {500, 500, nil}, price = 700000},
		{weapon = 'WEAPON_CARBINERIFLE', components = {0, 500, 500, 500, 500, nil}, price = 5000000},
		{weapon = 'WEAPON_COMBATPDW', components = {0, 500, 500, 500, 500, nil}, price = 5000000},
	},
	
	zaskok = {
		{weapon = 'WEAPON_COMBATPISTOL', components = {0, 0, 500, 500, nil}, price = 300000},
		{weapon = 'WEAPON_ADVANCEDRIFLE', components = {0, 500, 500, 500, 500, nil}, price = 500000},
		{weapon = 'WEAPON_PUMPSHOTGUN', components = {500, 500, nil}, price = 700000},
		{weapon = 'WEAPON_CARBINERIFLE', components = {0, 500, 500, 500, 500, nil}, price = 5000000},
		{weapon = 'WEAPON_COMBATPDW', components = {0, 500, 500, 500, 500, nil}, price = 5000000},
	},
	
	
	intendent = {
		{weapon = 'WEAPON_COMBATPISTOL', components = {0, 0, 500, 500, nil}, price = 300000},
		{weapon = 'WEAPON_ADVANCEDRIFLE', components = {0, 500, 500, 500, 500, nil}, price = 500000},
		{weapon = 'WEAPON_COMBATPDW', components = {0, 500, 500, 500, 500, nil}, price = 5000000},
		{weapon = 'WEAPON_PUMPSHOTGUN', components = {500, 500, nil}, price = 700000},
		{weapon = 'WEAPON_CARBINERIFLE', components = {0, 500, 500, 500, 500, nil}, price = 5000000},
	},

	lieutenant = {
		{weapon = 'WEAPON_COMBATPISTOL', components = {0, 0, 500, 500, nil}, price = 300000},
		{weapon = 'WEAPON_ADVANCEDRIFLE', components = {0, 500, 500, 500, 500, nil}, price = 500000},
		{weapon = 'WEAPON_COMBATPDW', components = {0, 500, 500, 500, 500, nil}, price = 5000000},
		{weapon = 'WEAPON_PUMPSHOTGUN', components = {500, 500, nil}, price = 700000},
		{weapon = 'WEAPON_CARBINERIFLE', components = {0, 500, 500, 500, 500, nil}, price = 5000000},
	},
	
	chef = {
		{weapon = 'WEAPON_COMBATPISTOL', components = {0, 0, 500, 500, nil}, price = 300000},
		{weapon = 'WEAPON_ADVANCEDRIFLE', components = {0, 500, 500, 500, 500, nil}, price = 500000},
		{weapon = 'WEAPON_COMBATPDW', components = {0, 500, 500, 500, 500, nil}, price = 5000000},
		{weapon = 'WEAPON_PUMPSHOTGUN', components = {500, 500, nil}, price = 700000},
		{weapon = 'WEAPON_CARBINERIFLE', components = {0, 500, 500, 500, 500, nil}, price = 5000000},
	},

	captain = {
		{weapon = 'WEAPON_COMBATPISTOL', components = {0, 0, 500, 500, nil}, price = 300000},
		{weapon = 'WEAPON_ADVANCEDRIFLE', components = {0, 500, 500, 500, 500, nil}, price = 500000},
		{weapon = 'WEAPON_COMBATPDW', components = {0, 500, 500, 500, 500, nil}, price = 5000000},
		{weapon = 'WEAPON_PUMPSHOTGUN', components = {500, 500, nil}, price = 700000},
		{weapon = 'WEAPON_CARBINERIFLE', components = {0, 500, 500, 500, 500, nil}, price = 5000000},
	},
	
	lowerboss1 = {
		{weapon = 'WEAPON_COMBATPISTOL', components = {0, 0, 500, 500, nil}, price = 300000},
		{weapon = 'WEAPON_ADVANCEDRIFLE', components = {0, 500, 500, 500, 500, nil}, price = 500000},
		{weapon = 'WEAPON_COMBATPDW', components = {0, 500, 500, 500, 500, nil}, price = 5000000},
		{weapon = 'WEAPON_PUMPSHOTGUN', components = {500, 500, nil}, price = 700000},
		{weapon = 'WEAPON_CARBINERIFLE', components = {0, 500, 500, 500, 500, nil}, price = 5000000},
		{weapon = 'WEAPON_NIGHTSTICK', price = 200},
		{weapon = 'WEAPON_STUNGUN', price = 1500},
		{weapon = 'WEAPON_FLASHLIGHT', price = 800}
	},

	boss = {
		{weapon = 'WEAPON_COMBATPISTOL', components = {0, 0, 500, 500, nil}, price = 300000},
		{weapon = 'WEAPON_ADVANCEDRIFLE', components = {0, 500, 500, 500, 500, nil}, price = 500000},
		{weapon = 'WEAPON_COMBATPDW', components = {0, 500, 500, 500, 500, nil}, price = 5000000},
		{weapon = 'WEAPON_PUMPSHOTGUN', components = {500, 500, nil}, price = 700000},
		{weapon = 'WEAPON_CARBINERIFLE', components = {0, 500, 500, 500, 500, nil}, price = 5000000},
		{weapon = 'WEAPON_NIGHTSTICK', price = 200},
		{weapon = 'WEAPON_STUNGUN', price = 1500},
		{weapon = 'WEAPON_FLASHLIGHT', price = 800}
	}
}


local fullExtras = {
	["1"] = true,
	["2"] = true,
	["3"] = true,
	["4"] = true,
	["5"] = true,
	["6"] = true,
	["7"] = true,
	["8"] = true,
	["9"] = true,
	["10"] = true,
	["11"] = true,
}

local VIKTORKA = {model = 'cvpileo', price = 1, props = {modLivery = 1, extras = fullExtras}}
local EXPLORER = {model = 'expleo', price = 1, props = {modLivery = 1, extras = fullExtras}}
local insurgent = {model = 'insurgent2', price = 1, props = {color1 = 12, color2 = 12}}
local CHARGERLEO = {model = '18chgrleo', price = 1, props = {modLivery = 1, extras = fullExtras}}
local MUSTANG = {model = '2015polstang', price = 1, props = {modLivery = 2, extras = fullExtras}}
local HELLCAT = {model = 'HellcatRed', price = 1}
local CAMARO = {model = '2020camaro', price = 1}
local MCLAREN = {model = 'polp1', price = 1}
local unmarked = {model = 'polchal', price = 1}
local ODTAHOVKA = {model = 'flatbed3', price = 1, props = {modLivery = 4}}
local f150 = {model = 'f150sheriff', price = 1}
local RAM = {model = '19ram', price = 1}

local motorka = {model = 'ems_gs1200', price = 1, props = {modLivery = 1}}

Config.AuthorizedVehicles = {
	car = {
		recruit = {
			VIKTORKA,
		},

		officer = {
			CHARGERLEO,
			VIKTORKA,
			EXPLORER,
			ODTAHOVKA,
			motorka,
		},

		sergeant = {
			CHARGERLEO,
			VIKTORKA,
			EXPLORER,
			ODTAHOVKA,
			insurgent,
			MUSTANG,
			motorka,
			RAM,
		},
		
		intendent = {
			VIKTORKA,
			CHARGERLEO,
			EXPLORER,
			ODTAHOVKA,
			insurgent,
			MUSTANG,
			motorka,
			RAM,
		},

		lieutenant = {
			VIKTORKA,
			CHARGERLEO,
			EXPLORER,
			ODTAHOVKA,
			insurgent,
			CAMARO,
			MUSTANG,
			motorka,
			RAM,
			f150,
		},
		
		chef = {
			VIKTORKA,
			HELLCAT,
			CHARGERLEO,
			unmarked,
			EXPLORER,
			ODTAHOVKA,
			insurgent,
			MUSTANG,
			motorka,
			RAM,
			f150,
		},

		captain = {
			VIKTORKA,
			HELLCAT,
			CHARGERLEO,
			unmarked,
			EXPLORER,
			ODTAHOVKA,
			insurgent,
			MUSTANG,
			motorka,
			RAM,
			f150,
		},
		
		lowerboss1 = {
			VIKTORKA,
			HELLCAT,
			CHARGERLEO,
			unmarked,
			MCLAREN,
			EXPLORER,
			CAMARO,
			ODTAHOVKA,
			insurgent,
			MUSTANG,
			motorka,
			RAM,
			f150,
		},

		boss = {
			HELLCAT,
			CHARGERLEO,
			VIKTORKA,
			unmarked,
			MCLAREN,
			EXPLORER,
			CAMARO,
			ODTAHOVKA,
			insurgent,
			MUSTANG,
			motorka,
			RAM,
			f150,
		}
	},

	helicopter = {
		recruit = {},

		officer = {
			{model = 'polmav', props = {modLivery = 0}, price = 50}
		},

		sergeant = {
			{model = 'polmav', props = {modLivery = 0}, price = 50}
		},

		intendent = {
			{model = 'polmav', props = {modLivery = 0}, price = 50}
		},

		lieutenant = {
			{model = 'polmav', props = {modLivery = 0}, price = 50}
		},

		chef = {
			{model = 'polmav', props = {modLivery = 0}, price = 50}
		},

		captain = {
			{model = 'polmav', props = {modLivery = 0}, price = 50}
		},

		lowerboss1 = {
			{model = 'polmav', props = {modLivery = 0}, price = 50}
		},

		boss = {
			{model = 'polmav', props = {modLivery = 0}, price = 50}
		}
	}
}

Config.CustomPeds = {
	shared = {},
	recruit = {},
	officer = {},
	sergeant = {},
	lieutenant = {},
	boss = {}
}

-- CHECK SKINCHANGER CLIENT MAIN.LUA for matching elements
Config.Uniforms = {
	recruit = {
		male = {
			tshirt_1 = 40,  tshirt_2 = 0,
			torso_1 = 97,   torso_2 = 0,
			decals_1 = 0,   decals_2 = 0,
			arms = 32, arms_2 = 0,
			pants_1 = 58,   pants_2 = 1,
			shoes_1 = 29,   shoes_2 = 0,
			helmet_1 = -1,  helmet_2 = 0,
			chain_1 = 0,    chain_2 = 0,
			mask_1 = 0,     mask_2 = 0,
			bproof_1 = 0,  bproof_2 = 0,
			ears_1 = -1,     ears_2 = 0,
			glasses_1 = 0,  glasses_2 = 0
		},
		female = {
			tshirt_1 = 40,  tshirt_2 = 0,
			torso_1 = 97,   torso_2 = 0,
			decals_1 = 0,   decals_2 = 0,
			arms = 32, arms_2 = 0,
			pants_1 = 58,   pants_2 = 1,
			shoes_1 = 29,   shoes_2 = 0,	
			helmet_1 = -1,  helmet_2 = 0,
			chain_1 = 0,    chain_2 = 0,
			mask_1 = 0,     mask_2 = 0,
			bproof_1 = 0,  bproof_2 = 0,
			ears_1 = -1,     ears_2 = 0,
			glasses_1 = 12,  glasses_2 = 0
		}
	},

	officer = {
		male = {
			tshirt_1 = 40,  tshirt_2 = 0,
			torso_1 = 97,   torso_2 = 0,
			decals_1 = 0,   decals_2 = 0,
			arms = 32, arms_2 = 0,
			pants_1 = 58,   pants_2 = 1,
			shoes_1 = 29,   shoes_2 = 0,
			helmet_1 = -1,  helmet_2 = 0,
			chain_1 = 0,    chain_2 = 0,
			mask_1 = 0,     mask_2 = 0,
			bproof_1 = 0,  bproof_2 = 0,
			ears_1 = -1,     ears_2 = 0,
			glasses_1 = 0,  glasses_2 = 0
		},
		female = {
			tshirt_1 = 40,  tshirt_2 = 0,
			torso_1 = 97,   torso_2 = 0,
			decals_1 = 0,   decals_2 = 0,
			arms = 32, arms_2 = 0,
			pants_1 = 58,   pants_2 = 1,
			shoes_1 = 29,   shoes_2 = 0,
			helmet_1 = -1,  helmet_2 = 0,
			chain_1 = 0,    chain_2 = 0,
			mask_1 = 0,     mask_2 = 0,
			bproof_1 = 0,  bproof_2 = 0,
			ears_1 = -1,     ears_2 = 0,
			glasses_1 = 12,  glasses_2 = 0
		}
	},

	sergeant = {
		male = {
			tshirt_1 = 40,  tshirt_2 = 0,
			torso_1 = 97,   torso_2 = 0,
			decals_1 = 8,   decals_2 = 0,
			arms = 32, arms_2 = 0,
			pants_1 = 58,   pants_2 = 1,
			shoes_1 = 29,   shoes_2 = 0,
			helmet_1 = -1,  helmet_2 = 0,
			chain_1 = 0,    chain_2 = 0,
			mask_1 = 0,     mask_2 = 0,
			bproof_1 = 0,  bproof_2 = 0,
			ears_1 = -1,     ears_2 = 0,
			glasses_1 = 0,  glasses_2 = 0
		},
		female = {
			tshirt_1 = 40,  tshirt_2 = 0,
			torso_1 = 97,   torso_2 = 0,
			decals_1 = 8,   decals_2 = 0,
			arms = 32, arms_2 = 0,
			pants_1 = 58,   pants_2 = 1,
			shoes_1 = 29,   shoes_2 = 0,	
			helmet_1 = -1,  helmet_2 = 0,
			chain_1 = 0,    chain_2 = 0,
			mask_1 = 0,     mask_2 = 0,
			bproof_1 = 0,  bproof_2 = 0,
			ears_1 = -1,     ears_2 = 0,
			glasses_1 = 12,  glasses_2 = 0
		}
	},
	
	intendent = {
		male = {
			tshirt_1 = 40,  tshirt_2 = 0,
			torso_1 = 97,   torso_2 = 0,
			decals_1 = 8,   decals_2 = 0,
			arms = 32, arms_2 = 0,
			pants_1 = 58,   pants_2 = 1,
			shoes_1 = 29,   shoes_2 = 0,	
			helmet_1 = -1,  helmet_2 = 0,
			chain_1 = 0,    chain_2 = 0,
			mask_1 = 0,     mask_2 = 0,
			bproof_1 = 0,  bproof_2 = 0,
			ears_1 = -1,     ears_2 = 0,
			glasses_1 = 0,  glasses_2 = 0
		},
		female = {
			tshirt_1 = 40,  tshirt_2 = 0,
			torso_1 = 97,   torso_2 = 0,
			decals_1 = 8,   decals_2 = 0,
			arms = 32, arms_2 = 0,
			pants_1 = 58,   pants_2 = 1,
			shoes_1 = 29,   shoes_2 = 0,	
			helmet_1 = -1,  helmet_2 = 0,
			chain_1 = 0,    chain_2 = 0,
			mask_1 = 0,     mask_2 = 0,
			bproof_1 = 0,  bproof_2 = 0,
			ears_1 = -1,     ears_2 = 0,
			glasses_1 = 12,  glasses_2 = 0
		}
	},

	lieutenant = {
		male = {
			tshirt_1 = 40,  tshirt_2 = 0,
			torso_1 = 97,   torso_2 = 0,
			decals_1 = 8,   decals_2 = 0,
			arms = 32, arms_2 = 0,
			pants_1 = 58,   pants_2 = 1,
			shoes_1 = 29,   shoes_2 = 0,	
			helmet_1 = -1,  helmet_2 = 0,
			chain_1 = 1,    chain_2 = 0,
			bproof_1 = 22,  bproof_2 = 0,
			mask_1 = 0,     mask_2 = 0,
			ears_1 = -1,     ears_2 = 0,
			glasses_1 = 0,  glasses_2 = 0
		},
		female = {
			tshirt_1 = 40,  tshirt_2 = 0,
			torso_1 = 97,   torso_2 = 0,
			decals_1 = 8,   decals_2 = 0,
			arms = 32, arms_2 = 0,
			pants_1 = 58,   pants_2 = 1,
			shoes_1 = 29,   shoes_2 = 0,	
			helmet_1 = -1,  helmet_2 = 0,
			chain_1 = 0,    chain_2 = 0,
			mask_1 = 0,     mask_2 = 0,
			bproof_1 = 0,  bproof_2 = 0,
			ears_1 = -1,     ears_2 = 0,
			glasses_1 = 12,  glasses_2 = 0
		}
	},
	
	chef = {
		male = {
			tshirt_1 = 40,  tshirt_2 = 0,
			torso_1 = 97,   torso_2 = 0,
			decals_1 = 8,   decals_2 = 0,
			arms = 32, arms_2 = 0,
			pants_1 = 58,   pants_2 = 1,
			shoes_1 = 29,   shoes_2 = 0,	
			helmet_1 = -1,  helmet_2 = 0,
			chain_1 = 1,    chain_2 = 0,
			bproof_1 = 22,  bproof_2 = 0,
			mask_1 = 0,     mask_2 = 0,
			ears_1 = -1,     ears_2 = 0,
			glasses_1 = 0,  glasses_2 = 0
		},
		female = {
			tshirt_1 = 40,  tshirt_2 = 0,
			torso_1 = 97,   torso_2 = 0,
			decals_1 = 8,   decals_2 = 0,
			arms = 32, arms_2 = 0,
			pants_1 = 58,   pants_2 = 1,
			shoes_1 = 29,   shoes_2 = 0,	
			helmet_1 = -1,  helmet_2 = 0,
			chain_1 = 0,    chain_2 = 0,
			mask_1 = 0,     mask_2 = 0,
			bproof_1 = 0,  bproof_2 = 0,
			ears_1 = -1,     ears_2 = 0,
			glasses_1 = 12,  glasses_2 = 0
		}
	},

	captain = {
		male = {
			tshirt_1 = 40,  tshirt_2 = 0,
			torso_1 = 97,   torso_2 = 0,
			decals_1 = 8,   decals_2 = 0,
			arms = 32, arms_2 = 0,
			pants_1 = 58,   pants_2 = 1,
			shoes_1 = 29,   shoes_2 = 0,	
			helmet_1 = -1,  helmet_2 = 0,
			chain_1 = 1,    chain_2 = 0,
			bproof_1 = 22,  bproof_2 = 0,
			mask_1 = 0,     mask_2 = 0,
			ears_1 = -1,     ears_2 = 0,
			glasses_1 = 0,  glasses_2 = 0
		},
		female = {
			tshirt_1 = 40,  tshirt_2 = 0,
			torso_1 = 97,   torso_2 = 0,
			decals_1 = 8,   decals_2 = 0,
			arms = 32, arms_2 = 0,
			pants_1 = 58,   pants_2 = 1,
			shoes_1 = 29,   shoes_2 = 0,	
			helmet_1 = -1,  helmet_2 = 0,
			chain_1 = 0,    chain_2 = 0,
			mask_1 = 0,     mask_2 = 0,
			bproof_1 = 0,  bproof_2 = 0,
			ears_1 = -1,     ears_2 = 0,
			glasses_1 = 12,  glasses_2 = 0
		}
	},
	
	lowerboss1 = {
		male = {
			tshirt_1 = 40,  tshirt_2 = 0,
			torso_1 = 97,   torso_2 = 0,
			decals_1 = 11,   decals_2 = 0,
			arms = 32, arms_2 = 0,
			pants_1 = 58,   pants_2 = 1,
			shoes_1 = 29,   shoes_2 = 0,	
			helmet_1 = -1,  helmet_2 = 0,
			chain_1 = 1,    chain_2 = 0,
			bproof_1 = 22,  bproof_2 = 0,
			mask_1 = 0,     mask_2 = 0,
			ears_1 = -1,     ears_2 = 0,
			glasses_1 = 0,  glasses_2 = 0
		},
		female = {
			tshirt_1 = 40,  tshirt_2 = 0,
			torso_1 = 97,   torso_2 = 0,
			decals_1 = 11,   decals_2 = 0,
			arms = 32, arms_2 = 0,
			pants_1 = 58,   pants_2 = 1,
			shoes_1 = 29,   shoes_2 = 0,	
			helmet_1 = -1,  helmet_2 = 0,
			chain_1 = 0,    chain_2 = 0,
			mask_1 = 0,     mask_2 = 0,
			bproof_1 = 0,  bproof_2 = 0,
			ears_1 = -1,     ears_2 = 0,
			glasses_1 = 12,  glasses_2 = 0
		}
	},

	boss = {
		male = {
			tshirt_1 = 40,  tshirt_2 = 0,
			torso_1 = 97,   torso_2 = 0,
			decals_1 = 11,   decals_2 = 0,
			arms = 32, arms_2 = 0,
			pants_1 = 58,   pants_2 = 1,
			shoes_1 = 29,   shoes_2 = 0,	
			mask_1 = 0,     mask_2 = 0,
			bproof_1 = 22,  bproof_2 = 0,
			helmet_1 = -1,  helmet_2 = 0,
			chain_1 = 0,    chain_2 = 0,
			glasses_1 = 0,  glasses_2 = 0,
			ears_1 = -1,     ears_2 = 0
		},
		female = {
			tshirt_1 = 40,  tshirt_2 = 0,
			torso_1 = 97,   torso_2 = 0,
			decals_1 = 11,   decals_2 = 0,
			arms = 32, arms_2 = 0,
			pants_1 = 58,   pants_2 = 1,
			shoes_1 = 29,   shoes_2 = 0,	
			helmet_1 = -1,  helmet_2 = 0,
			chain_1 = 0,    chain_2 = 0,
			mask_1 = 0,     mask_2 = 0,
			bproof_1 = 0,  bproof_2 = 0,
			ears_1 = -1,     ears_2 = 0,
			glasses_1 = 12,  glasses_2 = 0
		}
	},

	bullet_wear = {
		male = {
			bproof_1 = 12,  bproof_2 = 3
		},
		female = {
			bproof_1 = 8,  bproof_2 = 1
		}
	},
	
	bullets_wear = {
		male = {
			bproof_1 = 7,  bproof_2 = 1
		},
		female = {
			bproof_1 = 7,  bproof_2 = 1
		}
	},

	detective_wear = {
		male = {
			tshirt_1 = 19,  tshirt_2 = 0,
			torso_1 = 13,   torso_2 = 2,
			decals_1 = 0,   decals_2 = 0,
			arms = 28,
			pants_1 = 31,   pants_2 = 0,
			shoes_1 = 10,   shoes_2 = 0,
			helmet_1 = -1,  helmet_2 = 0,
			chain_1 = 0,    chain_2 = 0,
			mask_1 = 0,     mask_2 = 0,
			bproof_1 = 22,  bproof_2 = 8,
			ears_1 = -1,     ears_2 = 0,
			glasses_1 = 0,  glasses_2 = 0
		},
		female = {
			tshirt_1 = 34,  tshirt_2 = 0,
			torso_1 = 24,   torso_2 = 0,
			decals_1 = 0,   decals_2 = 0,
			arms = 22,
			pants_1 = 42,   pants_2 = 0,
			shoes_1 = 0,   shoes_2 = 0,
			helmet_1 = -1,  helmet_2 = 0,
			chain_1 = 0,    chain_2 = 0,
			mask_1 = 0,     mask_2 = 0,
			bproof_1 = 0,  bproof_2 = 0,
			ears_1 = -1,     ears_2 = 0,
			glasses_1 = 0,  glasses_2 = 0
		}
	},
	
	swat_wear = {
		male = {
			tshirt_1 = 15,  tshirt_2 = 0,
			torso_1 = 224,   torso_2 = 20,
			decals_1 = 0,   decals_2 = 0,
			arms = 33, arms_2 = 0,
			pants_1 = 68,   pants_2 = 0,
			shoes_1 = 29,   shoes_2 = 0,
			helmet_1 = 39,  helmet_2 = 2,
			chain_1 = 0,    chain_2 = 0,
			bproof_1 = 7,  bproof_2 = 0,
			mask_1 = 57,     mask_2 = 1,
			ears_1 = 2,     ears_2 = 0,
			glasses_1 = 25,  glasses_2 = 4,
			bracelets_1 = -1, bracelets_2 = 0,
			watches_1 = 25, watches_2 = 4,
		},
		female = {
			tshirt_1 = 15,  tshirt_2 = 0,
			torso_1 = 224,   torso_2 = 20,
			decals_1 = 0,   decals_2 = 0,
			arms = 33, arms_2 = 0,
			pants_1 = 68,   pants_2 = 0,
			shoes_1 = 29,   shoes_2 = 0,
			helmet_1 = 39,  helmet_2 = 2,
			chain_1 = 0,    chain_2 = 0,
			bproof_1 = 7,  bproof_2 = 0,
			mask_1 = 57,     mask_2 = 1,
			ears_1 = 2,     ears_2 = 0,
			glasses_1 = 25,  glasses_2 = 4,
			bracelets_1 = -1, bracelets_2 = 0,
			watches_1 = 25, watches_2 = 4,
		}
	},

	pilot_wear = {
		male = {
			tshirt_1 = 15,  tshirt_2 = 0,
			torso_1 = 159,   torso_2 = 3,
			arms = 19,
			pants_1 = 79,   pants_2 = 2,
			shoes_1 = 55,   shoes_2 = 0,
			helmet_1 = 19,  helmet_2 = 0,
		},
		female = {
			tshirt_1 = 15,  tshirt_2 = 0,
			torso_1 = 159,   torso_2 = 3,
			arms = 19,
			pants_1 = 79,   pants_2 = 2,
			shoes_1 = 55,   shoes_2 = 0,
			helmet_1 = 19,  helmet_2 = 0,
		},
	},

	swat_pilot_wear = {
		male = {
			tshirt_1 = 15,  tshirt_2 = 0,
			torso_1 = 58,   torso_2 = 0,
			arms = 19,
			pants_1 = 50,   pants_2 = 0,
			shoes_1 = 28,   shoes_2 = 0,
			helmet_1 = 47,  helmet_2 = 0,
			mask_1 = 57,     mask_2 = 1,
		},
		female = {
			tshirt_1 = 15,  tshirt_2 = 0,
			torso_1 = 58,   torso_2 = 0,
			arms = 19,
			pants_1 = 50,   pants_2 = 0,
			shoes_1 = 28,   shoes_2 = 0,
			helmet_1 = 38,  helmet_2 = 0,
		},
	},

	gilet_wear = {
		male = {
			bproof_1 = 12,  bproof_2 = 3
		},
		female = {
			bproof_1 = 4,  bproof_2 = 4
		}
	},

	motobike_wear = {
		male = {
			tshirt_1 = 75,  tshirt_2 = 0,
			torso_1 = 68,   torso_2 = 0,
			decals_1 = 0,   decals_2 = 0,
			arms = 19, arms_2 = 0,
			pants_1 = 59,   pants_2 = 2,
			shoes_1 = 29,   shoes_2 = 0,
			helmet_1 = 17,  helmet_2 = 1,
			chain_1 = 1,    chain_2 = 0,
			bproof_1 = 0,  bproof_2 = 0,
			mask_1 = -1,     mask_2 = 0,
			ears_1 = -1,     ears_2 = 0,
			glasses_1 = 0,  glasses_2 = 0,
			bracelets_1 = 0, bracelets_2 = 0,
			watches_1 = 0, watches_2 = 0,
	
		},
		female = {
			tshirt_1 = 75,  tshirt_2 = 0,
			torso_1 = 68,   torso_2 = 0,
			decals_1 = 0,   decals_2 = 0,
			arms = 19, arms_2 = 0,
			pants_1 = 59,   pants_2 = 2,
			shoes_1 = 29,   shoes_2 = 0,
			helmet_1 = 17,  helmet_2 = 1,
			chain_1 = 1,    chain_2 = 0,
			bproof_1 = 0,  bproof_2 = 0,
			mask_1 = -1,     mask_2 = 0,
			ears_1 = -1,     ears_2 = 0,
			glasses_1 = 0,  glasses_2 = 0,
			bracelets_1 = 0, bracelets_2 = 0,
			watches_1 = 0, watches_2 = 0,
	
		},
	},
}
