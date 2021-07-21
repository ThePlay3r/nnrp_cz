Config.Keys['bazar'] = {
	key_bazar = {
		'VCHOD1',
		'VCHOD2',
	},
	remote_bazar = {
		'VRATA'
	},
}

Config.DoorList['bazar'] = {
	VCHOD1 = {
		textCoords = vector3(2141.15, 3873.0, 33.1),
		locked = true,
		maxDistance = 2.5,
		doors = {
			{objHash = -2050436002, objHeading = 207.0098572, objCoords = vector3(2141.99, 3873.488, 33.57693)},
			{objHash = 100848840, objHeading = 207.0098572, objCoords = vector3(2140.075, 3872.508, 33.57693)},
		}
	},
	VCHOD2 = {
		textCoords = vector3(2152.76, 3879.14, 33.1),
		locked = true,
		maxDistance = 2.5,
		doors = {
			{objHash = -2050436002, objHeading = 207.00985712, objCoords = vector3(2153.732, 3879.674, 33.57693)},
			{objHash = 100848840, objHeading = 207.0098572, objCoords = vector3(2151.816, 3878.696, 33.57693)},
		}
	},

	VRATA = {
		objHash = -427498890,
		objCoords  = vector3(2161.952, 3828.302, 32.32756),
		objHeading = 28.271301,
		textCoords = vector3(2161.89, 3828.31, 33.09),
		locked = true,
		maxDistance = 15,
		isSliding = true,
    },
}