Config.Keys['vigne'] = {
	key_vinari = {'VCHOD_DO_KUCHYNE', 'VCHODY_U_FIREMNI_GARAZE', 'VCHODY_DO_OBYVAKU', 'VCHODY_DO_OBYVAKU_3', 'VCHODY_DO_OBYVAKU_4', 'VCHODY_DO_OBYVAKU_5',
		'VCHOD_DO_MISTNOSTI_S_KULECNIKEM', 'VCHOD_DO_MISTNOSTI_S_KULECNIKEM_2', 'VCHOD_DO_MISTNOSTI_S_KULECNIKEM_3', 'HLAVNI_KANCELAR'
	},
	remote_vinari = {'MACKANI'},
	key_vinari_lednice = {'LEDNICE'},
}

Config.DoorList['vigne'] = {

	-- Lednice
	LEDNICE = {
		textCoords = vector3(-1869.06, 2066.15, 140.98),
		locked = true,
		maxDistance = 2.5,
		doors = {
			{objHash = GetHashKey('ball_fridge_mafia_r'), objHeading = 270.02, objCoords = vector3(-1864.2, 2059.899, 141.1452)},
			{objHash = GetHashKey('ball_fridge_mafia_l'), objHeading = 270.60, objCoords = vector3(-1864.213, 2061.265, 141.1456)}
		}
	},

	VCHOD_DO_KUCHYNE = {
		textCoords = vector3(-1860.49, 2054.13, 141.07),
		locked = true,
		maxDistance = 2.5,
		doors = {
			{objHash = GetHashKey('ball_prop_italy2'), objHeading = 0.36, objCoords = vector3(-1859.214, 2054.118, 141.3535)},
			{objHash = GetHashKey('ball_prop_italy2'), objHeading = 179.33, objCoords = vector3(-1861.689, 2054.116, 141.3536)}
		}
	},

	VCHODY_U_FIREMNI_GARAZE = {
		textCoords = vector3(-1887.75, 2051.34, 141.31),
		locked = true,
		maxDistance = 4,
		doors = {
			{objHash = GetHashKey('ball_prop_italy2'), objHeading = 159.61, objCoords = vector3(-1887.534, 2051.234, 141.3125)},
			{objHash = GetHashKey('ball_prop_italy2'), objHeading = 340.09, objCoords = vector3(-1885.211, 2050.38, 141.3085)},
			{objHash = GetHashKey('ball_prop_italy2'), objHeading = 339.99, objCoords = vector3(-1887.903, 2051.387, 141.3115)},
			{objHash = GetHashKey('ball_prop_italy2'), objHeading = 159.63, objCoords = vector3(-1890.225, 2052.236, 141.3125)}
		}
	},

	--Vchody do obyvaku

	VCHODY_DO_OBYVAKU = {
		textCoords = vector3(-1909.89, 2073.70, 140.89),
		locked = true,
		maxDistance = 4,
		doors = {
			{objHash = GetHashKey('ball_prop_italy3'), objHeading = 139.97, objCoords = vector3(-1909.624, 2073.472, 140.91)},
			{objHash = GetHashKey('ball_prop_italy3'), objHeading = 319.63, objCoords = vector3(-1907.732, 2071.878, 140.91)},
			{objHash = GetHashKey('ball_prop_italy3'), objHeading = 319.48, objCoords = vector3(-1910.209, 2073.969, 140.91)},
			{objHash = GetHashKey('ball_prop_italy3'), objHeading = 139.87, objCoords = vector3(-1912.101, 2075.56, 140.91)}
		}
	},

	VCHODY_DO_OBYVAKU_3 = {
		textCoords = vector3(-1910.98, 2079.65, 140.89),
		locked = true,
		maxDistance = 2.5,
		doors = {
			{objHash = GetHashKey('ball_prop_italy3'), objHeading = 229.48, objCoords = vector3(-1911.81, 2078.795, 140.91)},
			{objHash = GetHashKey('ball_prop_italy3'), objHeading = 49.78, objCoords = vector3(-1910.20, 2080.679, 140.91)}
		}
	},


	VCHODY_DO_OBYVAKU_4 = {
		textCoords = vector3(-1906.8, 2084.59, 140.89),
		locked = true,
		maxDistance = 2.5,
		doors = {
			{objHash = GetHashKey('ball_prop_italy3'), objHeading = 229.67, objCoords = vector3(-1907.596, 2083.744, 140.91)},
			{objHash = GetHashKey('ball_prop_italy3'), objHeading = 49.77, objCoords = vector3(-1905.994, 2085.627, 140.91)}
		}
	},

	VCHODY_DO_OBYVAKU_5 = {
		textCoords = vector3(-1900.78, 2084.70, 140.89),
		locked = true,
		maxDistance = 4,
		doors = {
			{objHash = GetHashKey('ball_prop_italy3'), objHeading = 319.81, objCoords = vector3(-1900.994, 2084.947, 140.91)},
			{objHash = GetHashKey('ball_prop_italy3'), objHeading = 139.37, objCoords = vector3(-1902.882, 2086.545, 140.91)},
			{objHash = GetHashKey('ball_prop_italy3'), objHeading = 139.79, objCoords = vector3(-1900.406, 2084.447, 140.91)},
			{objHash = GetHashKey('ball_prop_italy3'), objHeading = 319.90, objCoords = vector3(-1898.514, 2082.852, 140.91)}
		}
	},

	VCHOD_DO_MISTNOSTI_S_KULECNIKEM = {
		textCoords = vector3(-1893.83, 2075.21, 141.01),
		locked = true,
		maxDistance = 2.5,
		doors = {
			{objHash = GetHashKey('ball_prop_italy2'), objHeading = 140.60, objCoords = vector3(-1894.73, 2075.967, 141.31)},
			{objHash = GetHashKey('ball_prop_italy2'), objHeading = 319.30, objCoords = vector3(-1892.833, 2074.381, 141.30)}
		}
	},

	VCHOD_DO_MISTNOSTI_S_KULECNIKEM_2 = {
		textCoords = vector3(-1886.15, 2073.85, 141.01),
		locked = true,
		maxDistance = 2.5,
		doors = {
			{objHash = GetHashKey('ball_prop_italy2'), objHeading = 159.57, objCoords = vector3(-1887.243, 2074.308, 141.31)},
			{objHash = GetHashKey('ball_prop_italy2'), objHeading = 339.89, objCoords = vector3(-1884.921, 2073.462, 141.30)}
		}
	},

	VCHOD_DO_MISTNOSTI_S_KULECNIKEM_3 = {
		textCoords = vector3(-1874.48, 2069.64, 141.01),
		locked = true,
		maxDistance = 2.5,
		doors = {
			{objHash = GetHashKey('ball_prop_italy2'), objHeading = 159.57, objCoords = vector3(-1875.614, 2070.068, 141.31)},
			{objHash = GetHashKey('ball_prop_italy2'), objHeading = 340.33, objCoords = vector3(-1873.294, 2069.22, 141.30)}
		}
	},

	MACKANI = {
		textCoords = vector3(143.45, 319.36, 112.14),
		locked = true,
		isSliding = true,
		maxDistance = 18.0,
		objHash = -915091986,
		objHeading = 294.490295,
		objCoords = vector3(143.4332, 319.1841, 112.8127),
	},

	--Hlavni kancelar
	HLAVNI_KANCELAR = {
		textCoords = vector3(-1880.92, 2061.57, 145.57),
		locked = true,
		maxDistance = 2.5,
		doors = {
			{objHash = GetHashKey('ball_prop_italy1'), objHeading = 70.36, objCoords = vector3(-1880.465, 2062.785, 145.72)},
			{objHash = GetHashKey('ball_prop_italy1'), objHeading = 249.27, objCoords = vector3(-1881.358, 2060.34, 145.73)}
		}
	},
}