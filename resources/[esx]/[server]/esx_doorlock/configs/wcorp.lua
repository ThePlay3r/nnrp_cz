Config.Keys['wcorp'] = {
	key_wcorp = {'VCHOD'},
	remote_wcorp = {'BRANA'},
}

Config.DoorList['wcorp'] = {
    VCHOD = {
		textCoords = vector3(811.93, -2148.16, 29.62),
        locked = true,
		maxDistance = 5,
		doors = {
			{objHash = -8873588, objHeading = 179.999, objCoords = vector3(810.5769, -2148.27, 29.76892)},
			{objHash = 97297972, objHeading = 360.0, objCoords = vector3(813.1779, -2148.27, 29.76892)},
		}
	},
	BRANA = {
		textCoords = vector3(795.28, -2123.92, 29.52),
		locked = true,
		isSliding = true,
		maxDistance = 10,
		doors = {
			{objHash = 1286535678, objHeading = 265.0, objCoords = vector3(794.9615, -2131.369, 28.48314)},
			{objHash = 1286535678, objHeading = 85.0, objCoords = vector3(796.1762, -2116.315, 28.47822)},
		}
	},
}