Config                            = {}
Config.DrawDistance               = 100.0
Config.MarkerType                 = 1
Config.MarkerSize                 = { x = 1.5, y = 1.5, z = 1.0 }
Config.MarkerColor                = { r = 111, g = 25, b = 209 }
Config.EnablePlayerManagement     = true
Config.EnableArmoryManagement     = true
Config.EnableESXIdentity          = true -- only turn this on if you are using esx_identity
Config.EnableNonFreemodePeds      = false -- turn this on if you want custom peds
Config.EnableSocietyOwnedVehicles = false
Config.EnableLicenses             = true
Config.MaxInService               = -1
Config.Locale                     = 'en'

Config.ShopCoords = {
  coords = vector3(133.19, -1924.8, 24.6),
  heading = 121.09,
}
Config.SpawnPoints = {
	{coords = vector3(114.48, -1934.43, 20.17), heading = 33.26, radius = 4},
	{coords = vector3(106.97, -1928.91, 20.13), heading = 20.13, radius = 4},
}

Config.AuthorizedVehicles = {
	{ model = 'bmx',  label = 'BMX', price = 1, props = { color1 = 145}},
	{ model = 'chino2',  label = 'Chino', price = 1, props = { color1 = 145}},
	{ model = 'bf400',  label = 'BF 400', price = 1, props = { color1 = 145, color2 = 145}},
}

Config.BallasStations = {

  Ballas = {

	Blip = {
		Pos     = { x = 425.130, y = -979.558, z = 30.711 },
	  Sprite  = 60,
	  Display = 4,
	  Scale   = 1.2,
	  Colour  = 29,
	},

	Clothes = {
		male = {},
		female = {},
	},

	AuthorizedWeapons = {
	 -- { name = 'WEAPON_SAWNOFFSHOTGUN',       price = 9000 },
	 -- { name = 'WEAPON_PISTOL50',     price = 30000 },
	--  { name = 'WEAPON_BULLPUPSHOTGUN',       price = 1125000 },
	 -- { name = 'WEAPON_COMPACTRIFLE',     price = 1500000 },
	 -- { name = 'WEAPON_PUMPSHOTGUN',      price = 600000 },
	 -- { name = 'WEAPON_STUNGUN',          price = 50000 },
	 -- { name = 'WEAPON_FLASHLIGHT',       price = 800 },
	 -- { name = 'WEAPON_FIREEXTINGUISHER', price = 1200 },
	 -- { name = 'WEAPON_FLAREGUN',         price = 6000 },
	 -- { name = 'GADGET_PARACHUTE',        price = 3000 },
	 -- { name = 'WEAPON_BAT'		,        price = 3000 },
	 -- { name = 'WEAPON_STICKYBOMB',       price = 200000 },
   --   { name = 'WEAPON_SNIPERRIFLE',      price = 2200000 },
	 -- { name = 'WEAPON_FIREWORK',         price = 30000 },
	 -- { name = 'WEAPON_GRENADE',          price = 180000 },
	 -- { name = 'WEAPON_BZGAS',            price = 120000 },
	--  { name = 'WEAPON_SMOKEGRENADE',     price = 100000 },
	  --{ name = 'WEAPON_APPISTOL',         price = 70000 },
	  --{ name = 'WEAPON_CARBINERIFLE',     price = 1100000 },
   --   { name = 'WEAPON_HEAVYSNIPER',      price = 2000000 },
	--  { name = 'WEAPON_MINIGUN',          price = 700000 },
	 -- { name = 'WEAPON_RAILGUN',          price = 2500000 },
	},

	-- nepouziva se
	  AuthorizedVehicles = {
		  { name = 'cognoscenti2',  label = 'Véhicule Blindé' },
		  { name = 'Manchez',    label = 'Moto' },
		  { name = 'Contender',   label = '4X4' },
		  { name = 'felon',      label = 'Véhicule Civil' },
	  },

	Cloakrooms = {
	  { x = 74.58, y = -1967.45, z = 20.12},
	},

	Armories = {
	  { x = 78.02, y = -1964.44, z = 20.12},
	},

	Vehicles = {
	  {
		Spawner    = { x = 116.97, y = -1933.17, z = 20.75 },
		SpawnPoint = { x = 0, y = 0, z = 0 },
		Heading    = 113.52,
		MarkerSize = { x = 1.0, y = 1.0, z = 1.0},
		MarkerColor = {r = 111, g = 25, b = 209},
		type = 36,
	  }
	},

	-- nepouziva se
	Helicopters = {
	  {
		Spawner    = { x = 0, y = 0, z = 0 },
		SpawnPoint = { x = 112.94457244873, y = -3102.5942382813, z = 6.0050659179688 },
		Heading    = 0.0,
	  }
	},

	-- nepouziva se
	VehicleDeleters = {
	  { x = 0, y = 0, z = 0 },
	  
	},

	BossActions = {
	  { x = 84.66, y = -1954.77, z = 19.81 },
	},

  },

}
