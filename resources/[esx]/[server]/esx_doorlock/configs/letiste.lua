Config.Keys['letiste'] = {
	remote_letiste = {'PRAVY_VCHOD', 'LEVY_VCHOD'},
}

Config.DoorList['letiste'] = {
    PRAVY_VCHOD = {
		textCoords = vector3(-1144.82, -2726.68, 15.20),
        locked = true,
        isSliding = true,
		maxDistance = 20,
		doors = {
			{objHash = 725274945, objHeading = 330.00, objCoords = vector3(-1138.471, -2730.447, 12.94635)},
			{objHash = 725274945, objHeading = 149.99998474121, objCoords = vector3(-1151.208, -2723.092, 12.94643)},
		}
	},

    LEVY_VCHOD = {
		textCoords = vector3(-983.82, -2833.53, 15.20),
        locked = true,
        isSliding = true,
		maxDistance = 20,
		doors = {
			{objHash = 725274945, objHeading = 330.00, objCoords = vector3(-977.5174, -2837.264, 12.95486)},
			{objHash = 725274945, objHeading = 149.99, objCoords = vector3(-990.2963, -2829.887, 12.94986)},
		}
	},
}

Config.Keys['easyway'] = {
	remote_easyway = {'VRATA'},
}

Config.DoorList['easyway'] = {
    VRATA = {
		textCoords = vector3(484.21, -3116.57, 6.07),
        locked = true,
        isSliding = true,
		maxDistance = 20,
		doors = {
			{objHash = 1286392437, objHeading = 0.0, objCoords = vector3(492.2758, -3115.934, 5.162354)},
			{objHash = 1286392437, objHeading = 179.99998, objCoords = vector3(476.3256, -3115.925, 5.160969)},
		}
	},
}