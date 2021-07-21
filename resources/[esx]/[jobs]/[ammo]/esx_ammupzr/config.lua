Config                            = {}

Config.DrawDistance               = 5.0
Config.MarkerType                 = 1
Config.MarkerSize                 = { x = 1.5, y = 1.5, z = 1.0 }
Config.MarkerColor                = { r = 50, g = 50, b = 204 }

Config.EnablePlayerManagement     = true
Config.EnableArmoryManagement     = true
Config.EnableESXIdentity          = true -- enable if you're using esx_identity
Config.EnableNonFreemodePeds      = false -- turn this on if you want custom peds
Config.EnableSocietyOwnedVehicles = false
Config.EnableLicenses             = true -- enable if you're using esx_license

Config.EnableHandcuffTimer        = false -- enable handcuff timer? will unrestrain player after the time ends
Config.HandcuffTimer              = 10 * 60000 -- 10 mins

Config.EnableJobBlip              = false -- enable blips for colleagues, requires esx_society

Config.MaxInService               = -1
Config.Locale = 'cs'
Config.Bullets  		  = 250

Config.AuthorizedVehicles = {
	{
		model = 'Baller6',
		label = 'SUV',
		price = 1,
	},
}
Config.SpawnPoints = {
	{ coords = vector3(-9.25, -1115.71, 28.14), heading = 155.0, radius = 4.0},
}

Config.VehicleShopCoords = {
	coords = vector3(19.89, -1109.15, 42.37),
	heading = 158.21,
}

Config.Blips = {
	Blip = {
		Pos     = { x = 19.26, y = -1109.52, z = 29.8 },
		Sprite  = 110,
		Display = 4,
		Scale   = 1.2,
		Colour  = 75,
		Label = "Ammu-Nation",
		publicBlip = true,
	},

	Blip2 = {
		Pos     = { x = 1221.02, y = -3005.41, z = 5.87 },
		Sprite  = 110,
		Display = 4,
		Scale   = 1.2,
		Colour  = 75,
		Label = "Ammu-Nation - Sber soucastek",
		publicBlip = false,
	},

	Blip3 = {
		Pos     = { x = 1689.75, y = 3758.07, z = 34.71 },
		Sprite  = 110,
		Display = 4,
		Scale   = 1.2,
		Colour  = 75,
		Label = "Ammu-Nation - Prodej",
		publicBlip = false,
	},
}

Config.PoliceStations = {

	LSPD = {


		-- https://wiki.rage.mp/index.php?title=Weapons
		AuthorizedWeapons = {
			{ name = 'WEAPON_KNUCKLE',              price = 5000 ,piece = 1},
			{ name = 'WEAPON_BAT',                       price = 2000 ,piece = 1 },
			{ name = 'WEAPON_FLASHLIGHT',                price = 2000 ,piece = 1},
			{ name = 'weapon_crowbar',               price = 7000 , piece = 1 },
			{ name = 'weapon_hammer',               price = 7000 , piece = 1 },
			{ name = 'weapon_battleaxe',               price = 15000 , piece = 2 },
			{ name = 'WEAPON_STUNGUN',                   price = 19000 ,piece = 3},
			{ name = 'WEAPON_SWITCHBLADE',               price = 3000 , piece = 2 },
			{ name = 'WEAPON_SNSPISTOL',               price = 18000 , piece = 2 },
			{ name = 'WEAPON_REVOLVER',               price = 68000 , piece = 4 },
			{ name = 'WEAPON_HEAVYPISTOL',               price = 44000 , piece = 4 },
			{ name = 'weapon_doubleaction',               price = 190000 , piece = 20 },
			{ name = 'WEAPON_VINTAGEPISTOL',               price = 51000 , piece = 4 },
			{ name = 'WEAPON_MARKSMANPISTOL',               price = 51000 , piece = 4 },
			{ name = 'WEAPON_MUSKET',               price = 170000 , piece = 8 },
			{ name = 'WEAPON_PISTOL',                    price = 25000 ,piece = 3 },
			{ name = 'WEAPON_COMBATPISTOL',              price = 25000 ,piece = 4},
			{ name = 'WEAPON_PUMPSHOTGUN',			     price = 120000 ,piece = 7 },
			{ name = 'WEAPON_SAWNOFFSHOTGUN',	price = 100000 ,piece = 7 },
			{ name = 'WEAPON_KNIFE',    		price = 3000 ,piece = 1},
			{ name = 'WEAPON_PISTOL50',    		     price = 65000 ,piece = 7}
		},

		Cloakrooms = {
			{ x = 4.65, y = -1105.62, z = 29.8 },
		},

		Armories = {
			{ x = 21.55, y = -1105.14, z = 29.8 },
		},
		
		WeaponPartsHarvets = {
			{ x = 1221.32, y = -3005.71, z = 5.87 },
		},

		Vehicles = {
			{
				Spawner    = { x = -2.64, y = -1110.47, z = 28.79 },
				SpawnPoints = {
					{ x = -9.25, y = -1115.71, z = 28.14, heading = 155.0, radius = 4.0},
				}
			}
		},

		-- nepouziva se
		VehicleDeleters = {
			{ x = 0.0, y = 0.0, z = 0.0 }
		},

		-- nepouziva se
		Helicopters = {},

		BossActions = {
			{ x = 12.43, y = -1110.77, z = 29.8}
		},

		Selling = {
			coords = vector3(1689.75, 3758.07, 33.71),
		}

	},

}

-- https://wiki.rage.mp/index.php?title=Vehicles
-- Config.AuthorizedVehicles = {
-- 	Shared = {
-- 	},

-- 	soldato = {
-- 		{
-- 			model = 'Baller6',
-- 			label = 'SUV'
-- 		}
-- 	},
-- 	capo = {
-- 		{
-- 			model = 'Baller6',
-- 			label = 'SUV'
-- 		}
-- 	},
	
-- 	consigliere = {
-- 		{
-- 			model = 'Baller6',
-- 			label = 'SUV'
-- 		}
-- 	},
	
-- 	righthand = {
-- 		{
-- 			model = 'Baller6',
-- 			label = 'SUV'
-- 		}
-- 	},

-- 	boss = {
-- 		{
-- 			model = 'Baller6',
-- 			label = 'SUV'
-- 		}
-- 	},
-- }

Config.AuthorizedHelicopters = {
	recruit = {},

	officer = {},

	sergeant = {},

	intendent = {},

	boss = {}
}
-- CHECK SKINCHANGER CLIENT MAIN.LUA for matching elements

Config.Uniforms = {
	ammu_wear = {
		male = {
			['tshirt_1'] = 99,  ['tshirt_2'] = 7,
			['torso_1'] = 62,   ['torso_2'] = 0,
			['decals_1'] = 0,   ['decals_2'] = 0,
			['arms'] = 4,
			['pants_1'] = 17,   ['pants_2'] = 1,
			['shoes_1'] = 40,   ['shoes_2'] = 3,
			['helmet_1'] = -1,  ['helmet_2'] = 0,
			['glasses_1'] = 0,  ['glasses_2'] = 0,
			['chain_1'] = 38,    ['chain_2'] = 0,
		},
		female = {
			['tshirt_1'] = 0,  ['tshirt_2'] = 13,
			['torso_1'] = 6,   ['torso_2'] = 0,
			['decals_1'] = 0,   ['decals_2'] = 0,
			['arms'] = 38,
			['pants_1'] = 6,   ['pants_2'] = 0,
			['shoes_1'] = 58,   ['shoes_2'] = 9,
			['helmet_1'] = 27,  ['helmet_2'] = 0,
			['glasses_1'] = 11,  ['glasses_2'] = 0,
			['chain_1'] = 0,    ['chain_2'] = 0,
			['ears_1'] = 0,     ['ears_2'] = 0,
			['bproof_1'] = 0,     ['bproof_2'] = 0
		}
	},
	recruit_wear = {
		male = {
			['tshirt_1'] = 76,  ['tshirt_2'] = 2,
			['torso_1'] = 122,   ['torso_2'] = 0,
			['decals_1'] = 0,   ['decals_2'] = 0,
			['arms'] = 4,
			['pants_1'] = 97,   ['pants_2'] = 2,
			['shoes_1'] = 25,   ['shoes_2'] = 0,
			['helmet_1'] = -1,  ['helmet_2'] = 0,
			['glasses_1'] = 0,  ['glasses_2'] = 0,
			['chain_1'] = 0,    ['chain_2'] = 0,
			['ears_1'] = 0,     ['ears_2'] = 0,
			['bproof_1'] = 0,     ['bproof_2'] = 0
		},
		female = {
			['tshirt_1'] = 76,  ['tshirt_2'] = 2,
			['torso_1'] = 122,   ['torso_2'] = 0,
			['decals_1'] = 0,   ['decals_2'] = 0,
			['arms'] = 4,
			['pants_1'] = 97,   ['pants_2'] = 2,
			['shoes_1'] = 25,   ['shoes_2'] = 0,
			['helmet_1'] = -1,  ['helmet_2'] = 0,
			['glasses_1'] = 0,  ['glasses_2'] = 0,
			['chain_1'] = 0,    ['chain_2'] = 0,
			['ears_1'] = 0,     ['ears_2'] = 0,
			['bproof_1'] = 0,     ['bproof_2'] = 0
		}
	},
	boss_wear = { -- currently the same as chef_wear
		male = {
			['tshirt_1'] = 69,  ['tshirt_2'] = 0,
			['torso_1'] = 23,   ['torso_2'] = 3,
			['decals_1'] = 0,   ['decals_2'] = 0,
			['arms'] = 39,
			['pants_1'] = 10,   ['pants_2'] = 0,
			['shoes_1'] = 20,   ['shoes_2'] = 3,
			['helmet_1'] = -1,  ['helmet_2'] = 0,
			['glasses_1'] = 0,  ['glasses_2'] = 0,
			['chain_1'] = 0,    ['chain_2'] = 0,
			['ears_1'] = 0,     ['ears_2'] = 0,
			['bproof_1'] = 0,     ['bproof_2'] = 0
		},
		female = {
			['tshirt_1'] = 69,  ['tshirt_2'] = 0,
			['torso_1'] = 23,   ['torso_2'] = 3,
			['decals_1'] = 0,   ['decals_2'] = 0,
			['arms'] = 39,
			['pants_1'] = 59,   ['pants_2'] = 0,
			['shoes_1'] = 24,   ['shoes_2'] = 0,
			['helmet_1'] = -1,  ['helmet_2'] = 0,
			['glasses_1'] = 0,  ['glasses_2'] = 0,
			['chain_1'] = 0,    ['chain_2'] = 0,
			['ears_1'] = 0,     ['ears_2'] = 0,
			['bproof_1'] = 0,     ['bproof_2'] = 0
		}
	},
	bullet_wear = {
		male = {
			['bproof_1'] = 11,  ['bproof_2'] = 1
		},
		female = {
			['bproof_1'] = 13,  ['bproof_2'] = 1
		}
	},
	gilet_wear = {
		male = {
			tshirt_1 = 15,  tshirt_2 = 0,
			torso_1 = 54,   torso_2 = 0,
			decals_1 = 0,   decals_2 = 0,
			arms = 19, arms_2 = 0,
			pants_1 = 68,   pants_2 = 0,
			shoes_1 = 28,   shoes_2 = 0,
			helmet_1 = -110,  helmet_2 = 8,
			chain_1 = 0,    chain_2 = 0,
			bproof_1 = 0,  bproof_2 = 0,
			mask_1 = -1,     mask_2 = 0,
			ears_1 = -1,     ears_2 = 0,
			glasses_1 = 23,  glasses_2 = 0,
			bracelets_1 = -1, bracelets_2 = 0,
			watches_1 = -1, watches_2 = 0,
		},
		female = {
			['tshirt_1'] = 125,  ['tshirt_2'] = 0,
			['torso_1'] = 50,   ['torso_2'] = 0,
			['decals_1'] = 0,   ['decals_2'] = 0,
			['arms'] = 4,
			['pants_1'] = 59,   ['pants_2'] = 0,
			['shoes_1'] = 25,   ['shoes_2'] = 0,
			['helmet_1'] = -1,  ['helmet_2'] = 0,
			['glasses_1'] = 0,  ['glasses_2'] = 0,
			['chain_1'] = 0,    ['chain_2'] = 0,
			['ears_1'] = 0,     ['ears_2'] = 0,
			['bproof_1'] = 0,     ['bproof_2'] = 0
		}
	}
}
