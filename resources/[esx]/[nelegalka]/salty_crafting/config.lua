Config = {}

-- Ammo given by default to crafted weapons
Config.WeaponAmmo = 150

Config.Recipes = {
	['bulletproof'] = {
		{item = "iron", quantity = 2 }, 
		{item = "weapon_piece", quantity = 10 }, 
		{item = "leather", quantity = 3 }, 
		{item = "keycardweapon", quantity = 1, remove = false },
	},

	['gadget_parachute'] = {
		{item = "iron", quantity = 1 }, 
		{item = "weapon_piece", quantity = 1 }, 
		{item = "leather", quantity = 5 }, 
		{item = "keycardweapon", quantity = 1, remove = false },
	},

	['ammo-box'] = {
		{item = "iron", quantity = 10 }, 
		{item = "weapon_piece", quantity = 5 }, 
		{item = "leather", quantity = 1 }, 
		{item = "keycardweapon", quantity = 1, remove = false },
	},

	['WEAPON_FLARE'] = {
		{item = "iron", quantity = 2 }, 
		{item = "weapon_piece", quantity = 3 }, 
		{item = "keycardweapon", quantity = 1, remove = false },
	},
	['WEAPON_FLAREGUN'] = {
		{item = "iron", quantity = 1 }, 
		{item = "weapon_piece", quantity = 6 }, 
		{item = "keycardweapon", quantity = 1, remove = false },
	},
	
	-- WEAPONS
	['WEAPON_KNUCKLE'] = { 
		{item = "iron", quantity = 16 }, 
		{item = "weapon_piece", quantity = 4 }, 
		{item = "keycardweapon", quantity = 1, remove = false },
	},
	['WEAPON_BAT'] = { 
		{item = "iron", quantity = 2 }, 
		{item = "weapon_piece", quantity = 5 }, 
		{item = "keycardweapon", quantity = 1, remove = false },
	},
	['WEAPON_FLASHLIGHT'] = { 
		{item = "iron", quantity = 3 }, 
		{item = "weapon_piece", quantity = 4 }, 
		{item = "keycardweapon", quantity = 1, remove = false },
	},
	['WEAPON_CROWBAR'] = { 
		{item = "iron", quantity = 25 }, 
		{item = "weapon_piece", quantity = 5 }, 
		{item = "keycardweapon", quantity = 1, remove = false },
	},
	['WEAPON_HAMMER'] = { 
		{item = "iron", quantity = 22 }, 
		{item = "weapon_piece", quantity = 8 }, 
		{item = "keycardweapon", quantity = 1, remove = false },
	},
	['WEAPON_BATTLEAXE'] = { 
		{item = "iron", quantity = 40 }, 
		{item = "weapon_piece", quantity = 25 }, 
		{item = "keycardweapon", quantity = 1, remove = false },
	},
	['WEAPON_STUNGUN'] = { 
		{item = "iron", quantity = 35 }, 
		{item = "weapon_piece", quantity = 50 }, 
		{item = "keycardweapon", quantity = 1, remove = false },
	},
	['WEAPON_SWITCHBLADE'] = { 
		{item = "iron", quantity = 6 }, 
		{item = "weapon_piece", quantity = 6 }, 
		{item = "keycardweapon", quantity = 1, remove = false },
	},
	['WEAPON_KNIFE'] = { 
		{item = "iron", quantity = 7 }, 
		{item = "weapon_piece", quantity = 5 }, 
		{item = "keycardweapon", quantity = 1, remove = false },
	},

	['WEAPON_SNSPISTOL'] = { 
		{item = "iron", quantity = 55 }, 
		{item = "weapon_piece", quantity = 25 }, 
		{item = "keycardweapon", quantity = 1, remove = false },
	},
	['WEAPON_REVOLVER'] = { 
		{item = "iron", quantity = 210 }, 
		{item = "weapon_piece", quantity = 130 }, 
		{item = "keycardweapon", quantity = 1, remove = false },
	},
	['WEAPON_HEAVYPISTOL'] = { 
		{item = "iron", quantity = 100}, 
		{item = "weapon_piece", quantity = 70 }, 
		{item = "keycardweapon", quantity = 1, remove = false },
	},
	['WEAPON_DOUBLEACTION'] = { 
		{item = "iron", quantity = 380}, 
		{item = "weapon_piece", quantity = 300 }, 
		{item = "keycardweapon", quantity = 1, remove = false },
	},
	['WEAPON_VINTAGEPISTOL'] = { 
		{item = "iron", quantity = 90 }, 
		{item = "weapon_piece", quantity = 90 }, 
		{item = "keycardweapon", quantity = 1, remove = false },
	},
	['WEAPON_MARKSMANPISTOL'] = { 
		{item = "iron", quantity = 100 }, 
		{item = "weapon_piece", quantity = 80 }, 
		{item = "keycardweapon", quantity = 1, remove = false },
	},
	['WEAPON_PISTOL'] = { 
		{item = "iron", quantity = 50 }, 
		{item = "weapon_piece", quantity = 60 }, 
		{item = "keycardweapon", quantity = 1, remove = false },
	},
	['WEAPON_COMBATPISTOL'] = { 
		{item = "iron", quantity = 60 }, 
		{item = "weapon_piece", quantity = 50 }, 
		{item = "keycardweapon", quantity = 1, remove = false },
	},
	['WEAPON_PISTOL50'] = { 
		{item = "iron", quantity = 240 }, 
		{item = "weapon_piece", quantity = 100 }, 
		{item = "keycardweapon", quantity = 1, remove = false },
	},
	['WEAPON_PUMPSHOTGUN'] = { 
		{item = "iron", quantity = 360}, 
		{item = "weapon_piece", quantity = 200 }, 
		{item = "keycardweapon", quantity = 1, remove = false },
	},
	['WEAPON_SAWNOFFSHOTGUN'] = { 
		{item = "iron", quantity = 250 }, 
		{item = "weapon_piece", quantity = 260 }, 
		{item = "keycardweapon", quantity = 1, remove = false },
	},
	['WEAPON_MUSKET'] = { 
		{item = "iron", quantity = 400 }, 
		{item = "weapon_piece", quantity = 350 }, 
		{item = "keycardweapon", quantity = 1, remove = false },
	},

	['WEAPON_COMBATPDW'] = { 
		{item = "iron", quantity = 310 }, 
		{item = "weapon_piece", quantity = 300 }, 
		{item = "keycardweapon", quantity = 1, remove = false },
	},
	['WEAPON_CARBINERIFLE'] = { 
		{item = "iron", quantity = 335 }, 
		{item = "weapon_piece", quantity = 300 }, 
		{item = "keycardweapon", quantity = 1, remove = false },
	},
	['WEAPON_SMG'] = { 
		{item = "iron", quantity = 290 }, 
		{item = "weapon_piece", quantity = 200 }, 
		{item = "keycardweapon", quantity = 1, remove = false },
	},

	['WEAPON_ADVANCEDRIFLE'] = { 
		{item = "iron", quantity = 310 }, 
		{item = "weapon_piece", quantity = 260 }, 
		{item = "keycardweapon", quantity = 1, remove = false },
	},

	['WEAPON_COMPACTRIFLE'] = { 
		{item = "iron", quantity = 310 }, 
		{item = "weapon_piece", quantity = 250 }, 
		{item = "keycardweapon", quantity = 1, remove = false },
	},

	['WEAPON_ASSAULTRIFLE'] = { 
		{item = "iron", quantity = 320 }, 
		{item = "weapon_piece", quantity = 300 }, 
		{item = "keycardweapon", quantity = 1, remove = false },
	},

	['WEAPON_HEAVYSHOTGUN'] = { 
		{item = "iron", quantity = 320 }, 
		{item = "weapon_piece", quantity = 290 }, 
		{item = "keycardweapon", quantity = 1, remove = false },
	},

	['WEAPON_DBSHOTGUN'] = { 
		{item = "iron", quantity = 315 }, 
		{item = "weapon_piece", quantity = 245 }, 
		{item = "keycardweapon", quantity = 1, remove = false },
	},

	-- WEAPONS OLD
		
	['WEAPON_APPISTOL'] = { 
		{item = "iron", quantity = 290 }, 
		{item = "weapon_piece", quantity = 100 }, 
		{item = "keycardweapon", quantity = 1, remove = false },
	},
				
	['WEAPON_MICROSMG'] = { 
		{item = "iron", quantity = 260 }, 
		{item = "weapon_piece", quantity = 200 }, 
		{item = "keycardweapon", quantity = 1, remove = false },
	},
	
	['WEAPON_MINISMG'] = { 
		{item = "iron", quantity = 220 }, 
		{item = "weapon_piece", quantity = 260 }, 
		{item = "keycardweapon", quantity = 1, remove = false },
	},
	
	['WEAPON_ASSAULTSMG'] = { 
		{item = "iron", quantity = 250 }, 
		{item = "weapon_piece", quantity = 250 }, 
		{item = "keycardweapon", quantity = 1, remove = false },
	},
		
	['WEAPON_MACHINEPISTOL'] = { 
		{item = "iron", quantity = 210 }, 
		{item = "weapon_piece", quantity = 210 }, 
		{item = "keycardweapon", quantity = 1, remove = false },
	},
		
	['WEAPON_BULLPUPRIFLE'] = { 
		{item = "iron", quantity = 310 }, 
		{item = "weapon_piece", quantity = 410 }, 
		{item = "keycardweapon", quantity = 1, remove = false },
	},
			
	['WEAPON_BULLPUPSHOTGUN'] = { 
		{item = "iron", quantity = 325 }, 
		{item = "weapon_piece", quantity = 425 }, 
		{item = "keycardweapon", quantity = 1, remove = false },
	},
}


Config.RecipesNelegal = {
	['bulletproof'] = {
		{item = "iron", quantity = 2 }, 
		{item = "weapon_piece", quantity = 1 }, 
		{item = "leather", quantity = 3 }, 
		{item = "keycardweapon", quantity = 1, remove = false },
	},

	['gadget_parachute'] = {
		{item = "iron", quantity = 1 }, 
		{item = "weapon_piece", quantity = 1 }, 
		{item = "leather", quantity = 5 }, 
		{item = "keycardweapon", quantity = 1, remove = false },
	},

	['ammo-box'] = {
		{item = "iron", quantity = 2 }, 
		{item = "weapon_piece", quantity = 2 }, 
		{item = "leather", quantity = 1 }, 
		{item = "keycardweapon", quantity = 1, remove = false },
	},

	['WEAPON_FLARE'] = {
		{item = "iron", quantity = 1 }, 
		{item = "weapon_piece", quantity = 1 }, 
		{item = "keycardweapon", quantity = 1, remove = false },
	},
	['WEAPON_FLAREGUN'] = {
		{item = "iron", quantity = 1 }, 
		{item = "weapon_piece", quantity = 3 }, 
		{item = "keycardweapon", quantity = 1, remove = false },
	},
	
	-- WEAPONS
	['WEAPON_KNUCKLE'] = { 
		{item = "iron", quantity = 2 }, 
		{item = "weapon_piece", quantity = 3 }, 
		{item = "keycardweapon", quantity = 1, remove = false },
	},
	['WEAPON_BAT'] = { 
		{item = "iron", quantity = 2 }, 
		{item = "weapon_piece", quantity = 5 }, 
		{item = "keycardweapon", quantity = 1, remove = false },
	},
	['WEAPON_FLASHLIGHT'] = { 
		{item = "iron", quantity = 1 }, 
		{item = "weapon_piece", quantity = 4 }, 
		{item = "keycardweapon", quantity = 1, remove = false },
	},
	['WEAPON_CROWBAR'] = { 
		{item = "iron", quantity = 5 }, 
		{item = "weapon_piece", quantity = 5 }, 
		{item = "keycardweapon", quantity = 1, remove = false },
	},
	['WEAPON_HAMMER'] = { 
		{item = "iron", quantity = 4 }, 
		{item = "weapon_piece", quantity = 5 }, 
		{item = "keycardweapon", quantity = 1, remove = false },
	},
	['WEAPON_BATTLEAXE'] = { 
		{item = "iron", quantity = 7 }, 
		{item = "weapon_piece", quantity = 7 }, 
		{item = "keycardweapon", quantity = 1, remove = false },
	},
	['WEAPON_STUNGUN'] = { 
		{item = "iron", quantity = 4 }, 
		{item = "weapon_piece", quantity = 9 }, 
		{item = "keycardweapon", quantity = 1, remove = false },
	},
	['WEAPON_SWITCHBLADE'] = { 
		{item = "iron", quantity = 4 }, 
		{item = "weapon_piece", quantity = 6 }, 
		{item = "keycardweapon", quantity = 1, remove = false },
	},
	['WEAPON_KNIFE'] = { 
		{item = "iron", quantity = 6 }, 
		{item = "weapon_piece", quantity = 4 }, 
		{item = "keycardweapon", quantity = 1, remove = false },
	},

	['WEAPON_SNSPISTOL'] = { 
		{item = "iron", quantity = 20 }, 
		{item = "weapon_piece", quantity = 25 }, 
		{item = "keycardweapon", quantity = 1, remove = false },
	},
	['WEAPON_REVOLVER'] = { 
		{item = "iron", quantity = 70 }, 
		{item = "weapon_piece", quantity = 43 }, 
		{item = "keycardweapon", quantity = 1, remove = false },
	},
	['WEAPON_HEAVYPISTOL'] = { 
		{item = "iron", quantity = 33}, 
		{item = "weapon_piece", quantity = 23 }, 
		{item = "keycardweapon", quantity = 1, remove = false },
	},
	['WEAPON_DOUBLEACTION'] = { 
		{item = "iron", quantity = 95}, 
		{item = "weapon_piece", quantity = 75 }, 
		{item = "keycardweapon", quantity = 1, remove = false },
	},
	['WEAPON_VINTAGEPISTOL'] = { 
		{item = "iron", quantity = 30 }, 
		{item = "weapon_piece", quantity = 30 }, 
		{item = "keycardweapon", quantity = 1, remove = false },
	},
	['WEAPON_MARKSMANPISTOL'] = { 
		{item = "iron", quantity = 70 }, 
		{item = "weapon_piece", quantity = 26 }, 
		{item = "keycardweapon", quantity = 1, remove = false },
	},
	['WEAPON_PISTOL'] = { 
		{item = "iron", quantity = 16 }, 
		{item = "weapon_piece", quantity = 20 }, 
		{item = "keycardweapon", quantity = 1, remove = false },
	},
	['WEAPON_COMBATPISTOL'] = { 
		{item = "iron", quantity = 20 }, 
		{item = "weapon_piece", quantity = 16 }, 
		{item = "keycardweapon", quantity = 1, remove = false },
	},
	['WEAPON_PISTOL50'] = { 
		{item = "iron", quantity = 60 }, 
		{item = "weapon_piece", quantity = 25 }, 
		{item = "keycardweapon", quantity = 1, remove = false },
	},
	['WEAPON_PUMPSHOTGUN'] = { 
		{item = "iron", quantity = 90}, 
		{item = "weapon_piece", quantity = 50 }, 
		{item = "keycardweapon", quantity = 1, remove = false },
	},
	['WEAPON_SAWNOFFSHOTGUN'] = { 
		{item = "iron", quantity = 63 }, 
		{item = "weapon_piece", quantity = 65 }, 
		{item = "keycardweapon", quantity = 1, remove = false },
	},
	['WEAPON_MUSKET'] = { 
		{item = "iron", quantity = 100 }, 
		{item = "weapon_piece", quantity = 87 }, 
		{item = "keycardweapon", quantity = 1, remove = false },
	},

	['WEAPON_COMBATPDW'] = { 
		{item = "iron", quantity = 77 }, 
		{item = "weapon_piece", quantity = 75 }, 
		{item = "keycardweapon", quantity = 1, remove = false },
	},
	['WEAPON_CARBINERIFLE'] = { 
		{item = "iron", quantity = 84 }, 
		{item = "weapon_piece", quantity = 75 }, 
		{item = "keycardweapon", quantity = 1, remove = false },
	},
	['WEAPON_SMG'] = { 
		{item = "iron", quantity = 73 }, 
		{item = "weapon_piece", quantity = 50 }, 
		{item = "keycardweapon", quantity = 1, remove = false },
	},

	['WEAPON_ADVANCEDRIFLE'] = { 
		{item = "iron", quantity = 78 }, 
		{item = "weapon_piece", quantity = 65 }, 
		{item = "keycardweapon", quantity = 1, remove = false },
	},

	['WEAPON_COMPACTRIFLE'] = { 
		{item = "iron", quantity = 78 }, 
		{item = "weapon_piece", quantity = 63 }, 
		{item = "keycardweapon", quantity = 1, remove = false },
	},

	['WEAPON_ASSAULTRIFLE'] = { 
		{item = "iron", quantity = 80 }, 
		{item = "weapon_piece", quantity = 75 }, 
		{item = "keycardweapon", quantity = 1, remove = false },
	},

	['WEAPON_HEAVYSHOTGUN'] = { 
		{item = "iron", quantity = 80 }, 
		{item = "weapon_piece", quantity = 72 }, 
		{item = "keycardweapon", quantity = 1, remove = false },
	},

	['WEAPON_DBSHOTGUN'] = { 
		{item = "iron", quantity = 78 }, 
		{item = "weapon_piece", quantity = 61 }, 
		{item = "keycardweapon", quantity = 1, remove = false },
	},

	-- WEAPONS OLD
		
	['WEAPON_APPISTOL'] = { 
		{item = "iron", quantity = 72 }, 
		{item = "weapon_piece", quantity = 25 }, 
		{item = "keycardweapon", quantity = 1, remove = false },
	},
				
	['WEAPON_MICROSMG'] = { 
		{item = "iron", quantity = 65 }, 
		{item = "weapon_piece", quantity = 50 }, 
		{item = "keycardweapon", quantity = 1, remove = false },
	},
	
	['WEAPON_MINISMG'] = { 
		{item = "iron", quantity = 55 }, 
		{item = "weapon_piece", quantity = 65 }, 
		{item = "keycardweapon", quantity = 1, remove = false },
	},
	
	['WEAPON_ASSAULTSMG'] = { 
		{item = "iron", quantity = 62 }, 
		{item = "weapon_piece", quantity = 62 }, 
		{item = "keycardweapon", quantity = 1, remove = false },
	},
		
	['WEAPON_MACHINEPISTOL'] = { 
		{item = "iron", quantity = 52 }, 
		{item = "weapon_piece", quantity = 52 }, 
		{item = "keycardweapon", quantity = 1, remove = false },
	},
		
	['WEAPON_BULLPUPRIFLE'] = { 
		{item = "iron", quantity = 77 }, 
		{item = "weapon_piece", quantity = 102 }, 
		{item = "keycardweapon", quantity = 1, remove = false },
	},
			
	['WEAPON_BULLPUPSHOTGUN'] = { 
		{item = "iron", quantity = 81 }, 
		{item = "weapon_piece", quantity = 106 }, 
		{item = "keycardweapon", quantity = 1, remove = false },
	},
}

Config.Shop = {
	useShop = true,
	shopCoordinates = { x=-177.4, y=1000.51, z=228.12 },
	shopName = "Vyrobna",
	log = 'https://discordapp.com/api/webhooks/738310660655677511/BV7eFDuaaggpY8GU0FM25TtPo-usGeBFXMW_X_-PL_pckfhgbTPet7ZdKio5bCJhG2dg',
	shopBlipID = 446,
	zoneSize = { x = 2.5, y = 2.5, z = 1.5 },
	zoneColor = { r = 255, g = 0, b = 0, a = 100 }
}

Config.Shop2 = {
	useShop = true,
	shopCoordinates = { x=834.01, y=-3243.41, z=-99.7 },
	shopName = "Vyrobna",
	log = 'https://discordapp.com/api/webhooks/732203784272609301/1r6tHfo3FEV0vPj6YOFq0yxPRo2Gz1PFWBbakDbTsq9dRfdKM9mI1m_3QCgPPwUzWnQD',
	shopBlipID = 446,
	zoneSize = { x = 4.5, y = 4.5, z = 1.5 },
	zoneColor = { r = 255, g = 0, b = 0, a = 100 }
}

-- Enable crafting menu through a keyboard shortcut
Config.Keyboard = {
	useKeyboard = false,
	keyCode = 303
}

Config.RecipesInfo = {
	shopCoordinates = { x=86.81, y=811.22, z=210.12 },
	zoneSize = { x = 2.5, y = 2.5, z = 1.0 },
	zoneColor = { r = 255, g = 0, b = 0, a = 100 }
}