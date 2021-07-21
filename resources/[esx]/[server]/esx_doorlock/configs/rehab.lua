Config.Keys['rehab'] = {
	key_rehab = {
		'VSTUP', 'VSTUP_DVOJITY', 'VSTUP2', 'VSTUP_DVOJITY2'
	},
}

Config.DoorList['rehab'] = {
  	VSTUP_DVOJITY = {
		textCoords = vector3(-1516.84, 851.21, 181.59),
		locked = true,
		maxDistance = 2.5,
		doors = {
			{objHash = -2112350883, objHeading = 339.7, objCoords = vector3(-1515.652, 850.721, 181.7789)},
			{objHash = -816468097, objHeading = 340.2, objCoords = vector3(-1518.079, 851.5972, 181.7789)}
		}
	},

	VSTUP = {
		objHash = 1042741067,
		objHeading = 25.0,
		objCoords = vector3(-1519.644, 848.9271, 181.7574),
		textCoords = vector3(-1520.23, 848.72, 181.59),
		locked = true,
		maxDistance = 2.5,
	},

	VSTUP2 = {
		objHash = 1042741067,
		objHeading = 25.0,
		objCoords = vector3(-1500.684, 856.7652, 181.7504),
		textCoords = vector3(-1501.35, 856.53, 181.6),
		locked = true,
		maxDistance = 2.5,
	},

	VSTUP_DVOJITY2 = {
		textCoords = vector3(-1490.88, 852.07, 181.59),
		locked = true,
		maxDistance = 2.5,
		doors = {
			{objHash = -1259801187, objHeading = 294.85, objCoords = vector3(-1490.365, 850.8654, 181.6913)},
			{objHash = -1563799200, objHeading = 114.5, objCoords = vector3(-1491.471, 853.2147, 181.6902)}
		}
	},
}