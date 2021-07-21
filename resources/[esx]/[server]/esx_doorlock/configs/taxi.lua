Config.Keys['taxi'] = {
	key_taxi = {
		'ZAMEK_1', 'ZAMEK_2', 'ZAMEK_3', 'ZAMEK_4', 'ZAMEK_5', 
		'ZAMEK_6', 'ZAMEK_7', 'ZAMEK_8', 'ZAMEK_9'
	},
	remote_taxi = {'HLAVNI_BRANA', 'ZAMEK_10'},
}

Config.DoorList['taxi'] = {
	HLAVNI_BRANA = {
		objHash = -2125423493,
		objHeading = 237.98696899414,
		textCoords = vector3(914.3, -180.02, 74.12),
		objCoords = vector3(916.0846, -177.229, 73.24475),
		locked = true,
		isSliding = true,
		maxDistance = 12,
	},

	ZAMEK_1 = {
		textCoords = vector3(907.4, -160.43, 74.13),
		locked = true,
		maxDistance = 2.5,
		doors = {
			{objHash = 1519319655, objHeading = 238.00, objCoords = vector3(906.6433, -161.5644, 74.54778)},
			{objHash = 1519319655, objHeading = 58.00, objCoords = vector3(908.1147, -159.1847, 74.54778)},
		}
	},

	ZAMEK_2 = {
		textCoords = vector3(899.73, -164.14, 74.13),
		locked = true,
		maxDistance = 2.5,
		doors = {
			{objHash = -2023754432, objHeading = 328.00, objCoords = vector3(898.5289, -163.3064, 74.33624)},
			{objHash = -2023754432, objHeading = 148.00, objCoords = vector3(900.7323, -164.6911, 74.33624)},
		}
	},

	ZAMEK_3 = {
		textCoords = vector3(894.67, -171.99, 74.67),
		locked = true,
		maxDistance = 2.5,
		doors = {
			{objHash = -2023754432, objHeading = 328.00, objCoords = vector3(893.644, -171.1679, 74.83767)},
			{objHash = -2023754432, objHeading = 147.00, objCoords = vector3(895.8329, -172.5739, 74.83767)},
		}
	},

	ZAMEK_4 = {
		textCoords = vector3(894.32, -179.3, 74.7),
		locked = true,
		maxDistance = 2.5,
		doors = {
			{objHash = -2023754432, objHeading = 238.00, objCoords = vector3(895.1225, -178.2061, 74.85624)},
			{objHash = -2023754432, objHeading = 59.00, objCoords = vector3(893.7596, -180.4167, 74.85624)},
		}
	},

	ZAMEK_5 = {
		textCoords = vector3(900.21, -162.4, 83.5),
		locked = true,
		maxDistance = 2.5,
		doors = {
			{objHash = -2037125726, objHeading = 329.00, objCoords = vector3(901.36, -163.18, 83.65056)},
			{objHash = -2037125726, objHeading = 149.00, objCoords = vector3(899.1704, -161.8671, 83.65056)},
		}
	},

	ZAMEK_6 = {
		objHash = -2023754432,
		objHeading = 328.00,
		textCoords = vector3(904.25, -152.51, 74.11),
		objCoords = vector3(903.5715, -152.1612, 74.33624),
		locked = true,
		maxDistance = 2.5,                      
	},

	ZAMEK_7 = {
		objHash = -2023754432,
		objHeading = 58.00,
		textCoords = vector3(896.15, -160.48, 76.87),
		objCoords = vector3(895.8756, -161.0501, 77.0637),
		locked = true,
		maxDistance = 2.5,                      
	},

	ZAMEK_8 = {
		objHash = -2023754432,
		objHeading = 238.00,
		textCoords = vector3(889.99, -170.28, 76.87),
		objCoords = vector3(890.2437, -169.8149, 77.0637),
		locked = true,
		maxDistance = 2.5,                      
	},

	ZAMEK_9 = {
		objHash = -2023754432,
		objHeading = 329.00,
		textCoords = vector3(895.76, -145.19, 76.87),
		objCoords = vector3(895.2413, -144.8651, 77.04504),
		locked = true,
		maxDistance = 2.5,                      
	},

	ZAMEK_10 = {
		objHash = 2064385778,
		objCoords  = vector3(900.0894, -147.8234, 77.3556),
		objHeading = 148.00,
		textCoords = vector3(899.99, -147.73, 76.6),
		locked = true,
		maxDistance = 8,
		isSliding = true,
	},
}