Config.Keys['bene'] = {
	key_bene = {
		'HL_DVERE', 'KANCL'
	},
	remote_bene = {
		'VRATA'
	},
}

Config.DoorList['bene'] = {
	HL_DVERE = {
		textCoords = vector3(-68.8, 64.25, 71.89),
		locked = true,
		maxDistance = 2.5,
		doors = {
			{objHash = 2059227086, objHeading = 330.5, objCoords = vector3(-69.5, 64.6, 72.1)},
			{objHash = 2059227086, objHeading = 150.2, objCoords = vector3(-67.9, 63.7, 72.1)},
		}
	},
	
	KANCL = {
	    objHash = -1320876379,
	    objHeading = 246.9,
	    textCoords = vector3(-55.4, 78.08, 71.81),
	    objCoords = vector3(-55.6, 77.3, 71.7),
		locked = true,
		maxDistance = 2.5,                      
	},

	VRATA = {
	    objHash = 1286535678,
	    objHeading = 330.2793,
	    textCoords = vector3(-87.47, 74.9, 71.57),
	    objCoords = vector3(-84.26734, 73.20184, 70.26432),
		locked = true,
		isSliding = true,
		maxDistance = 15.0,                      
	},

}