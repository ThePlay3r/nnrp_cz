Config.Keys['cosanostra'] = {
	remote_cosanostra = {'BRANA'},
	key_cosanostra_s = {'TAJNA_MISTNOST'},
	key_cosanostra = {'HL_DVERE', 'BRANKA', 'SKLAD'},
}

Config.DoorList['cosanostra'] = {
	TAJNA_MISTNOST = {
		objHash = -147325430,
		objHeading = 180.3,
		objCoords = vector3(-2666.396, 1330.098, 147.585),
		textCoords = vector3(-2666.92, 1330.19, 147.45),
		locked = true,
		maxDistance = 2.5,
	},

	HL_DVERE = {
		textCoords = vector3(-2667.49, 1326.19, 147.45),
		locked = true,
		maxDistance = 2.5,
		objHash = 1901183774,
		objCoords = vector3(-2667.602, 1326.96, 147.5934),
		objHeading = 89.39,
	},

	BRANKA = {
		objHash = GetHashKey('prop_lrggate_01c_r'),
		objHeading = 90.54,
		objCoords = vector3(-2652.752, 1327.773, 147.6059),
		textCoords = vector3(-2652.46, 1326.25, 147.05),
		locked = true,
		maxDistance = 2.5,
	},

	BRANA = {
		textCoords = vector3(-2652.56, 1307.58, 146.65),
		locked = true,
		maxDistance = 15,
		isSliding = true,
		objHash = -1573772550,
		objCoords = vector3(-2652.431, 1307.366, 147.7214),
		objHeading = 90.9,
	},

	SKLAD = {
		objHash = -1230442770,
		objHeading = 160.04901,
		objCoords = vector3(241.3621, 361.0471, 105.8883),
		textCoords = vector3(241.91, 361.0471, 105.8883),
		locked = true,
		maxDistance = 4.5,
	},
}
