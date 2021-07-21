Config.Keys['bennys'] = {
	key_bennys = {'KANCL_NAHORE'},
	remote_bennys = {'VRATA_DO_DILNY', 'HLAVNI_BRANA'},
}

Config.DoorList['bennys'] = {

	VRATA_DO_DILNY = {
		objHash = GetHashKey('lr_prop_supermod_door_01'),
		objCoords  = vector3(-205.68, -1310.68, 31.52),
		objHeading = 73.24,
		textCoords = vector3(-205.69, -1310.68, 31.3),
		locked = true,
		maxDistance = 10,
		isSliding = true,
	},
	
	HLAVNI_BRANA = {
		objHash = GetHashKey('hei_prop_station_gate'),
		objCoords  = vector3(-244.08, -1302.75, 30.30),
		objHeading = 90.49,
		textCoords = vector3(-244.12, -1305.48, 31.29),
		locked = false,
		maxDistance = 15,
		isSliding = true,
    },

    KANCL_NAHORE = {
        objHash = 100848840,
        objHeading = 180.88,
        objCoords = vector3(-227.04, -1312.39, 40.56),
        textCoords = vector3(-226.49, -1312.45, 40.56),
        locked = true,
        maxDistance = 4.5,
    },
}