Config.Keys['ammunation'] = {
	key_ammu = {'VCHOD', 'STRELNICE'},
}

Config.DoorList['ammunation'] = {
	VCHOD = {
		textCoords = vector3(17.35, -1115.1, 29.8),
		locked = true,
		maxDistance = 2.5,
		doors = {
			{objHash = 97297972, objHeading = 160.00, objCoords = vector3(16.12787, -1114.606, 29.94694)},
			{objHash = -8873588, objHeading = 340.00, objCoords = vector3(18.572, -1115.495, 29.94694)}
		}
	},

	STRELNICE = {
		objHash = 452874391,
		objHeading = 160.00,
		textCoords = vector3(7.35, -1098.5, 29.8),
		objCoords = vector3(6.81789, -1098.209, 29.94685),
		locked = true,
		maxDistance = 2.5,               
	},
}