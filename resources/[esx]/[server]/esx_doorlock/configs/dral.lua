Config.Keys['dral'] = {
	remote_dral = {'BRANA'},
	key_dral = {'VSTUP1', 'VSTUP2'},
}

Config.DoorList['dral'] = {   
    BRANA = {
		textCoords = vector3(-674.54, 907.23, 230.6),
		locked = true,
		maxDistance = 15,
		isSliding = true,
		objHash = -915091986,
		objCoords = vector3(-674.3669, 907.1718, 231.2129),
		objHeading = 146.5
	},

	VSTUP1 = {
		textCoords = vector3(-659.06, 897.43, 229.24),
		locked = true,
		maxDistance = 2.5,
		doors = {
			{objHash = -147423412, objCoords = vector3(-657.8004, 896.8133, 229.5137), objHeading = 156.0},
			{objHash = 1541959547, objCoords = vector3(-660.1741, 897.8536, 229.5137), objHeading = 336.1}
		}
	},

	VSTUP2 = {
		textCoords = vector3(-648.99, 888.46, 229.25),
		locked = true,
		maxDistance = 2.5,
		objHash = -1592690224,
		objCoords = vector3(-648.3293, 888.7767, 229.5137),
		objHeading = 196.2
	},
}