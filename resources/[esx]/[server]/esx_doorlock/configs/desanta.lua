Config.Keys['desanta'] = {
	key_desanta = {'HL_VCHOD', 'VCHOD_BAZEN1', 'VCHOD_BAZEN2', 'BRANKA', 'DVERE_GARAZ'},
	remote_desanta = {'BRANA_VPREDU', 'BRANA_GARAZ'},
}

Config.DoorList['desanta'] = {
    BRANA_VPREDU = {
		objHash = -2125423493,
		objCoords  = vector3(-844.051, 155.9599, 66.03116),
		objHeading = 90.0,
		textCoords = vector3(-843.91, 159.46, 66.81),
		locked = true,
		maxDistance = 15,
		isSliding = true,
	},

    BRANA_GARAZ = {
        objHash = 30769481,
        objCoords  = vector3(-815.2816, 185.975, 72.99993),
        objHeading = 291.0,
        textCoords = vector3(-815.29, 185.84, 72.48),
        locked = true,
        maxDistance = 7,
        isSliding = true,
	},

    HL_VCHOD = {
		textCoords = vector3(-816.26, 178.33, 72.22),
		locked = true,
		maxDistance = 2.5,
		doors = {
			{objHash = -1686014385, objHeading = 291.0, objCoords = vector3(-816.1068, 177.5109, 72.82738)},
			{objHash = 159994461, objHeading = 291.0, objCoords = vector3(-816.716, 179.098, 72.82738)}
		}
    },
    
    VCHOD_BAZEN1 = {
		textCoords = vector3(-795.57, 177.51, 72.84),
		locked = true,
		maxDistance = 2.5,
		doors = {
			{objHash = 1245831483, objHeading = 21.0, objCoords = vector3(-794.5051, 178.0124, 73.04045)},
			{objHash = -1454760130, objHeading = 21.0, objCoords = vector3(-796.5657, 177.2214, 73.04045)}
		}
    },
    
    VCHOD_BAZEN2 = {
		textCoords = vector3(-793.81, 181.54, 72.84),
		locked = true,
		maxDistance = 2.5,
		doors = {
			{objHash = 1245831483, objHeading = 111.0, objCoords = vector3(-794.1853, 182.568, 73.04045)},
			{objHash = -1454760130, objHeading = 111.0, objCoords = vector3(-793.3943, 180.5075, 73.04045)}
		}
	},

    BRANKA = {
		objHash = -1568354151,
		objHeading = 265.0,
		objCoords = vector3(-848.9343, 179.3079, 70.0247),
		textCoords = vector3(-849.03, 178.48, 69.81),
		locked = true,
		maxDistance = 2.5,
	},

    DVERE_GARAZ = {
		objHash = -1563640173,
		objHeading = 201.0,
		objCoords = vector3(-806.2817, 186.0246, 72.62405),
		textCoords = vector3(-807.12, 185.67, 72.48),
		locked = true,
		maxDistance = 2.5,
	},

}