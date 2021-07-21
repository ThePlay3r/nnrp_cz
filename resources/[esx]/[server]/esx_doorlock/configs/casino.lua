Config.Keys['casino'] = {
	key_casino = {'HL_VCHOD'},
	key_casino_sef = {'BOSS_ROOM'},
}

Config.DoorList['casino'] = {
    HL_VCHOD = {
		textCoords = vector3(925.56, 46.16, 81.1),
		locked = true,
		maxDistance = 5.0,
		doors = {
			-- PROSTREDEK
			{objHash = 21324050, objHeading = 238.0, objCoords = vector3(926.2392, 47.21412, 81.54191)},
			{objHash = 558771340, objHeading = 238.0, objCoords = vector3(924.9089, 45.085, 81.54191)},
			-- PRAVE
			{objHash = 21324050, objHeading = 238.0, objCoords = vector3(924.75, 44.83085, 81.54191)},
			{objHash = 558771340, objHeading = 238.0, objCoords = vector3(923.4195, 42.70175, 81.54191)},
			-- LEVE
			{objHash = 21324050, objHeading = 238.0, objCoords = vector3(927.7387, 49.60354, 81.54191)},
			{objHash = 558771340, objHeading = 238.0, objCoords = vector3(926.4083, 47.47442, 81.54191)},
		}
	},
	BOSS_ROOM = {
		textCoords = vector3(1111.11, 251.1, -45.84),
		locked = true,
		maxDistance = 5.0,
		doors = {
			{objHash = -643593781, objHeading = 0.0658562, objCoords = vector3(1110.052, 251.0432, -45.69093)},
			{objHash = -643593781, objHeading = 179.551163, objCoords = vector3(1112.052, 251.0432, -45.69063)},
		}
	}
}