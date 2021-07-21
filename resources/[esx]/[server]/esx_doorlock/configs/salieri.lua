Config.Keys['steakhouse'] = {
	key_italia = {'VCHOD', 'DRUHY_VCHOD', 'ZADNI_VCHOD', 'DRUHY_ZADNI_VCHOD', 'VCHOD_KUCHYN'},
}

Config.DoorList['steakhouse'] = {

	VCHOD = {
		textCoords = vector3(-695.22, 5802.02, 17.33),
		locked = true,
		maxDistance = 2.5,
		doors = {
			{objHash = -1033983061, objHeading = 245.00, objCoords = vector3(-695.6858, 5800.984, 17.5304)},
			{objHash = -1033983061, objHeading = 65.00, objCoords = vector3(-694.7182, 5803.066, 17.52943)}
		}
	},

	DRUHY_VCHOD = {
		textCoords = vector3(-702.13, 5789.26, 17.56),
		locked = true,
		maxDistance = 2.5,
		doors = {
			{objHash = 473423708, objHeading = 245.00, objCoords = vector3(-702.7004, 5788.391, 17.64029)},
			{objHash = 473423708, objHeading = 65.00, objCoords = vector3(-701.7103, 5790.468, 17.64076)}
		}
	},

	ZADNI_VCHOD = {
		objHash = 1890297615,
		objHeading = 244.00,
		textCoords = vector3(-687.54, 5793.99, 17.45),
		objCoords = vector3(-687.30041, 5794.58, 17.5999),		
		locked = true,
		maxDistance = 2.5,                      
	},

	DRUHY_ZADNI_VCHOD = {
		objHash = 1890297615,
		objHeading = 243.00,
		objHeadingOpen = 16.99,
		textCoords = vector3(-689.77, 5789.28, 17.44),
		objCoords = vector3(-689.52, 5789.784, 17.5999),
		locked = true,
		maxDistance = 2.5,                      
	},

	VCHOD_KUCHYN = {
		objHash = -1128607325,
		objHeading = 334.00,
		textCoords = vector3(-689.32, 5793.68, 17.33),
		objCoords = vector3(-688.7421, 5793.461, 17.49037),
		locked = true,
		maxDistance = 2.5,                      
	},


}