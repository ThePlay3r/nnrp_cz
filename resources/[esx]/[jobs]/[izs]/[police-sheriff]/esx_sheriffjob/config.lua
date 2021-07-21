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

	LSSD = {
		-- Blip = {
		-- 	Coords  = vector3(1850.18, 3688.31, 34.2),
		-- 	Sprite  = 60,
		-- 	Display = 4,
		-- 	Scale   = 1.2,
		-- 	Colour  = 47
		-- },

		Cloakrooms = {
			vector3(1849.76, 3696.05, 34.23)
		},

		Armories = {
			vector3(1841.98, 3690.85, 34.26)
		},

		Vehicles = {
			{
				Spawner = vector3(1870.97, 3700.68, 33.38),
				InsideShop = vector3(1809.34, 3719.75, 32.83),
				SpawnPoints = {
					{coords = vector3(1870.55, 3694.32, 33.58), heading = 209.37, radius = 6.0}
				}
			},
		},

		Helicopters = {
			{
				Spawner = vector3(1835.34, 3683.92, 39.45),
				InsideShop = vector3(1809.34, 3719.75, 32.83),
				SpawnPoints = {
					{coords = vector3(1827.49, 3675.65, 40.15), heading = 207.61, radius = 2.0}
				}
			}
		},

		BossActions = {
			vector3(1862.24, 3691.44, 34.2)
		}
	},

	Paleto = {
		-- Blip = {
		-- 	Coords  = vector3(-449.64, 6011.11, 30.72),
		-- 	Sprite  = 60,
		-- 	Display = 4,
		-- 	Scale   = 1.2,
		-- 	Colour  = 47
		-- },

		Cloakrooms = {
			vector3(-436.32, 5989.71, 31.72)
		},

		Armories = {
			vector3(-440.05, 5991.21, 31.72)
		},

		Vehicles = {
			{
				Spawner = vector3(-478.09, 6016.33, 31.34),
				InsideShop = vector3(-507.97, 6008.36, 33.65),
				SpawnPoints = {
					{coords = vector3(-479.78, 6022.079, 31.34), heading = 229.11, radius = 2.0},
					{coords = vector3(-477.712, 6026.399, 31.34), heading = 229.11, radius = 2.0},
					{coords = vector3(-473.4535, 6029.85, 31.34), heading = 229.11, radius = 2.0},
				}
			},
		},

		Helicopters = {
			{
				Spawner = vector3(-458.44, 5984.44, 31.31),
				InsideShop = vector3(-507.97, 6008.36, 33.65),
				SpawnPoints = {
					{coords = vector3(-475.35, 5988.72, 31.34), heading = 308.8, radius = 2.0}
				}
			}
		},

		BossActions = {
			vector3(-437.6, 5998.72, 31.72)
		}
	}
}

local ALLWEAPONS = {
	{weapon = 'WEAPON_COMBATPISTOL', components = {0, 0, 500, 500, nil}, price = 100000},
	{weapon = 'WEAPON_ADVANCEDRIFLE', components = {0, 500, 500, 500, 500, nil}, price = 5000000},
	{weapon = 'WEAPON_PUMPSHOTGUN', components = {500, 500, nil}, price = 700000},
	{weapon = 'WEAPON_CARBINERIFLE', components = {0, 500, 500, 500, 500, nil}, price = 5000000},
	{weapon = 'WEAPON_COMBATPDW', components = {0, 500, 500, 500, 500, nil}, price = 5000000},
	{weapon = 'WEAPON_NIGHTSTICK', price = 1},
	{weapon = 'WEAPON_STUNGUN', price = 1},
	{weapon = 'WEAPON_FLASHLIGHT', price = 1}
}

Config.AuthorizedWeapons = {
	kadet = {
		{weapon = 'WEAPON_NIGHTSTICK', price = 1},
		{weapon = 'WEAPON_STUNGUN', price = 1},
		{weapon = 'WEAPON_FLASHLIGHT', price = 1},
		{weapon = 'WEAPON_COMBATPISTOL', components = {0, 0, 500, 500, nil}, price = 100000},
	},
	deputy = ALLWEAPONS,
	sergeant = ALLWEAPONS,
	lieutenant = ALLWEAPONS,
	captain = ALLWEAPONS,
	lowerboss1 = {
		{weapon = 'WEAPON_COMBATPISTOL', components = {0, 0, 500, 500, nil}, price = 2500},
		{weapon = 'WEAPON_ADVANCEDRIFLE', components = {0, 500, 500, 500, 500, nil}, price = 10000},
		{weapon = 'WEAPON_PUMPSHOTGUN', components = {500, 500, nil}, price = 7500},
		{weapon = 'WEAPON_CARBINERIFLE', components = {0, 500, 500, 500, 500, nil}, price = 15000},
		{weapon = 'WEAPON_COMBATPDW', components = {0, 500, 500, 500, 500, nil}, price = 17000},
		{weapon = 'WEAPON_NIGHTSTICK', price = 200},
		{weapon = 'WEAPON_STUNGUN', price = 1500},
		{weapon = 'WEAPON_FLASHLIGHT', price = 800}
	},
	boss = {
		{weapon = 'WEAPON_COMBATPISTOL', components = {0, 0, 500, 500, nil}, price = 2500},
		{weapon = 'WEAPON_ADVANCEDRIFLE', components = {0, 500, 500, 500, 500, nil}, price = 10000},
		{weapon = 'WEAPON_PUMPSHOTGUN', components = {500, 500, nil}, price = 7500},
		{weapon = 'WEAPON_CARBINERIFLE', components = {0, 500, 500, 500, 500, nil}, price = 15000},
		{weapon = 'WEAPON_COMBATPDW', components = {0, 500, 500, 500, 500, nil}, price = 17000},
		{weapon = 'WEAPON_NIGHTSTICK', price = 200},
		{weapon = 'WEAPON_STUNGUN', price = 1500},
		{weapon = 'WEAPON_FLASHLIGHT', price = 800}
	},
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

local VIKTORKA = {model = 'cvpileo', price = 1, props = {modLivery = 0, extras = fullExtras}}
local TAHOE = {model = '14hoeleo', price = 1, props = {modLivery = 1, extras = fullExtras}}
local CHARGER = {model = '18chgrleo', price = 1, props = {modLivery = 0, extras = fullExtras}}
local EXPLEO = {model = 'expleo', price = 1, props = {modLivery = 0, extras = fullExtras}}
local FUSION = {model = 'fusionleo', price = 1, props = {modLivery = 0, extras = fullExtras}}
local MUSTANG = {model = '2015polstang', price = 1, props = {modLivery = 1, extras = fullExtras}}
local TRENING_VIKTORKA = {model = 'sheriff', price = 1}
local ODTAHOVKA = {model = 'flatbed3', price = 1, props = {modLivery = 0}}
local RAM = {model = '19ram', price = 1}
local motorka = {model = 'ems_gs1200', price = 1, props = {modLivery = 2}}
local unmarked = {model = 'polchal', price = 1}
local HELLCAT = {model = 'HellcatRed', price = 1}
local f150 = {model = 'f150sheriff', price = 1}
local insurgent = {model = 'insurgent2', price = 1, props = {color1 = 12, color2 = 12}}

local HELICOPTER = {
	{model = 'sherheli', price = 1}
}

Config.AuthorizedVehicles = {
	car = {
		kadet = {
			TRENING_VIKTORKA, motorka,
		},
		deputy = {
			VIKTORKA, TAHOE, motorka, ODTAHOVKA, insurgent,
		},
		sergeant = {
			VIKTORKA, TAHOE, motorka, ODTAHOVKA, EXPLEO, FUSION, CHARGER, RAM, insurgent,
		},
		lieutenant = {
			VIKTORKA, TAHOE, motorka, ODTAHOVKA, EXPLEO, FUSION, CHARGER, MUSTANG, RAM, f150, insurgent,
		},
		captain = {
			VIKTORKA, TAHOE, motorka, ODTAHOVKA, EXPLEO, FUSION, CHARGER, MUSTANG, RAM, f150, insurgent,
		},
		lowerboss1 = {
			VIKTORKA, TAHOE, motorka, ODTAHOVKA, EXPLEO, FUSION, CHARGER, MUSTANG, RAM, f150, unmarked, insurgent,
		},
		boss = {
			VIKTORKA, TAHOE, motorka, ODTAHOVKA, EXPLEO, FUSION, CHARGER, MUSTANG, RAM, f150, unmarked, HELLCAT, insurgent,
		},
	},

	helicopter = {
		kadet = {},
		deputy = {},
		sergeant = HELICOPTER,
		lieutenant = HELICOPTER,
		captain = HELICOPTER,
		lowerboss1 = HELICOPTER,
		boss = HELICOPTER,
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
	officer_wear = {
		male = {
			tshirt_1 = 60,  tshirt_2 = 0,
			torso_1 = 154,   torso_2 = 0,
			decals_1 = 0,   decals_2 = 0,
			arms = 22,
			pants_1 = 34,   pants_2 = 0,
			shoes_1 = 29,   shoes_2 = 0,
			helmet_1 = 13,  helmet_2 = 0,
			chain_1 = 6,    chain_2 = 0,
			mask_1 = 0,     mask_2 = 0,
			bproof_1 = 0,  bproof_2 = 0,
			ears_1 = -1,     ears_2 = 0,
			glasses_1 = 5,  glasses_2 = 2
		},
		female = {
			tshirt_1 = 60,  tshirt_2 = 0,
			torso_1 = 154,   torso_2 = 0,
			decals_1 = 0,   decals_2 = 0,
			arms = 22,
			pants_1 = 34,   pants_2 = 0,
			shoes_1 = 29,   shoes_2 = 0,
			helmet_1 = 13,  helmet_2 = 0,
			chain_1 = 6,    chain_2 = 0,
			mask_1 = 0,     mask_2 = 0,
			bproof_1 = 0,  bproof_2 = 0,
			ears_1 = -1,     ears_2 = 0,
			glasses_1 = 5,  glasses_2 = 2
		}
	},
	deputy_wear = {
		male = {
			tshirt_1 = 60,  tshirt_2 = 0,
			torso_1 = 79,   torso_2 = 0,
			decals_1 = 0,   decals_2 = 0,
			arms = 23,
			pants_1 = 56,  pants_2 = 1,
			shoes_1 = 29,   shoes_2 = 0,
			helmet_1 = 13,  helmet_2 = 0,
			chain_1 = 1,    chain_2 = 0,
			mask_1 = 0,     mask_2 = 0,
			bproof_1 = 0,  bproof_2 = 0,
			ears_1 = -1,     ears_2 = 0,
			glasses_1 = 5,  glasses_2 = 2
		},
		female = {
			tshirt_1 = 60,  tshirt_2 = 0,
			torso_1 = 79,   torso_2 = 0,
			decals_1 = 0,   decals_2 = 0,
			arms = 23,
			pants_1 = 56,  pants_2 = 1,
			shoes_1 = 29,   shoes_2 = 0,
			helmet_1 = 13,  helmet_2 = 0,
			chain_1 = 1,    chain_2 = 0,
			mask_1 = 0,     mask_2 = 0,
			bproof_1 = 0,  bproof_2 = 0,
			ears_1 = -1,     ears_2 = 0,
			glasses_1 = 5,  glasses_2 = 2
		}
	},
	vedeni_wear = {
		male = {
			tshirt_1 = 68,  tshirt_2 = 0,
			torso_1 = 160,   torso_2 = 2,
			decals_1 = 0,   decals_2 = 0,
			arms = 22,
			pants_1 = 34,   pants_2 = 0,
			shoes_1 = 29,   shoes_2 = 0,
			helmet_1 = 13,  helmet_2 = 0,
			chain_1 = 0,    chain_2 = 0,
			mask_1 = 0,     mask_2 = 0,
			bproof_1 = 0,  bproof_2 = 0,
			ears_1 = -1,     ears_2 = 0,
			glasses_1 = 5,  glasses_2 = 2
		},
		female = {
			tshirt_1 = 68,  tshirt_2 = 0,
			torso_1 = 160,   torso_2 = 2,
			decals_1 = 0,   decals_2 = 0,
			arms = 22,
			pants_1 = 34,   pants_2 = 0,
			shoes_1 = 29,   shoes_2 = 0,
			helmet_1 = 13,  helmet_2 = 0,
			chain_1 = 0,    chain_2 = 0,
			mask_1 = 0,     mask_2 = 0,
			bproof_1 = 0,  bproof_2 = 0,
			ears_1 = -1,     ears_2 = 0,
			glasses_1 = 5,  glasses_2 = 2
		}
	},

	bullet_wear = {
		male = {
			bproof_1 = 7,  bproof_2 = 1
		},
		female = {
			bproof_1 = 7,  bproof_2 = 1
		}
	},

	supervisor_wear = {
		male = {
			tshirt_1 = 0,  tshirt_2 = 2,
			torso_1 = 39,   torso_2 = 4,
			decals_1 = 0,   decals_2 = 0,
			arms = 29,
			pants_1 = 56,   pants_2 = 0,
			shoes_1 = 29,   shoes_2 = 0,
			helmet_1 = -1,  helmet_2 = 0,
			chain_1 = 6,    chain_2 = 0,
			mask_1 = 12,     mask_2 = 0,
			bproof_1 = 0,  bproof_2 = 0,
			ears_1 = -1,     ears_2 = 0,
			glasses_1 = 5,  glasses_2 = 2
		},
		female = {
			tshirt_1 = 56,  tshirt_2 = 0,
			torso_1 = 35,   torso_2 = 0,
			decals_1 = 0,   decals_2 = 0,
			arms = 22,
			pants_1 = 56,   pants_2 = 0,
			shoes_1 = 29,   shoes_2 = 0,
			helmet_1 = -1,  helmet_2 = 0,
			chain_1 = 6,    chain_2 = 0,
			mask_1 = 12,     mask_2 = 0,
			bproof_1 = 0,  bproof_2 = 0,
			ears_1 = -1,     ears_2 = 0,
			glasses_1 = 5,  glasses_2 = 2
		}
	},

	vycvikar_wear = {
		male = {
			tshirt_1 = 60,  tshirt_2 = 0,
			torso_1 = 98,   torso_2 = 0,
			decals_1 = 0,   decals_2 = 0,
			arms = 21,
			pants_1 = 34,   pants_2 = 0,
			shoes_1 = 29,   shoes_2 = 0,
			helmet_1 = 10,  helmet_2 = 0,
			chain_1 = 6,    chain_2 = 0,
			mask_1 = 12,     mask_2 = 0,
			bproof_1 = 0,  bproof_2 = 0,
			ears_1 = -1,     ears_2 = 0,
			glasses_1 = 5,  glasses_2 = 2
		},
		female = {
			tshirt_1 = 60,  tshirt_2 = 0,
			torso_1 = 98,   torso_2 = 0,
			decals_1 = 0,   decals_2 = 0,
			arms = 21,
			pants_1 = 34,   pants_2 = 0,
			shoes_1 = 29,   shoes_2 = 0,
			helmet_1 = 10,  helmet_2 = 0,
			chain_1 = 6,    chain_2 = 0,
			mask_1 = 12,     mask_2 = 0,
			bproof_1 = 0,  bproof_2 = 0,
			ears_1 = -1,     ears_2 = 0,
			glasses_1 = 5,  glasses_2 = 2
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
}
