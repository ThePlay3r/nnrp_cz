Config.Keys['ranch'] = {
	key_ranch = {'DVOJDVERE1', 'DVOJDVERE2', 'DVOJDVERE3', 'DVOJDVERE4', 'DVOJDVERE5', 'DVOJDVERE6', 'DVOJDVERE7'},
	remote_ranch = {'HLAVNI_BRANA', 'DRUHA_BRANA', 'ZADNI_BRANA'},
}

Config.DoorList['ranch'] = {
    DVOJDVERE1 = {
		textCoords = vector3(1390.64, 1132.23, 114.33),
		locked = true,
		maxDistance = 2.5,
		doors = {
			{objHash = -52575179, objHeading = 90.00897, objCoords = vector3(1390.666, 1133.317, 114.4808)},
			{objHash = -1032171637, objHeading = 90.044151, objCoords = vector3(1390.666, 1131.117, 114.4808)},
		}
    },

    DVOJDVERE2 = {
		textCoords = vector3(1400.53, 1128.12, 114.33),
		locked = true,
		maxDistance = 2.5,
		doors = {
			{objHash = -52575179, objHeading = 179.9544, objCoords = vector3(1400.488, 1128.314, 114.4836)},
			{objHash = -1032171637, objHeading = 179.99765, objCoords = vector3(1400.489, 1128.314, 114.4836)},
		}
    },

    DVOJDVERE3 = {
		textCoords = vector3(1395.91, 1141.73, 114.65),
		locked = true,
		maxDistance = 2.5,
		doors = {
			{objHash = 262671971, objHeading = 89.99752, objCoords = vector3(1395.92, 1140.705, 114.7902)},
			{objHash = 1504256620, objHeading = 270.135895, objCoords = vector3(1395.92, 1142.904, 114.7902)},
		}
    },

    DVOJDVERE4 = {
		textCoords = vector3(1390.54, 1162.34, 114.37),
		locked = true,
		maxDistance = 2.5,
		doors = {
			{objHash = -52575179, objHeading = 269.358368, objCoords = vector3(1390.478, 1161.238, 114.4832)},
			{objHash = -1032171637, objHeading = 269.9544, objCoords = vector3(1390.478, 1163.438, 114.4832)},
		}
    },

    DVOJDVERE5 = {
		textCoords = vector3(1408.58, 1164.79, 114.33),
		locked = true,
		maxDistance = 2.5,
		doors = {
			{objHash = -52575179, objHeading = 269.9145, objCoords = vector3(1408.581, 1163.634, 114.4833)},
			{objHash = -1032171637, objHeading = 269.8839, objCoords = vector3(1408.581, 1165.834, 114.4833)},
		}
    },

    DVOJDVERE6 = {
		textCoords = vector3(1408.56, 1160.11, 114.33),
		locked = true,
		maxDistance = 2.5,
		doors = {
			{objHash = -52575179, objHeading = 269.9951, objCoords = vector3(1408.581, 1158.965, 114.4833)},
			{objHash = -1032171637, objHeading = 270.1930, objCoords = vector3(1408.581, 1161.165, 114.4833)},
		}
    },

    DVOJDVERE7 = {
		textCoords = vector3(1409.23, 1147.31, 114.33),
		locked = true,
		maxDistance = 2.5,
		doors = {
			{objHash = -52575179, objHeading = 90.2286, objCoords = vector3(1409.292, 1148.454, 114.4869)},
			{objHash = -1032171637, objHeading = 89.9714, objCoords = vector3(1409.292, 1146.254, 114.4869)},
		}
	},
	
	HLAVNI_BRANA = {
		textCoords = vector3(1348.27, 1147.78, 113.76),
		locked = true,
		isSliding = true,
		maxDistance = 18.0,
		objHash= -1153093533,
		objHeading = 274.060364,
		objCoords = vector3(1347.924, 1150.539, 112.8591),
	},
	DRUHA_BRANA = {
		textCoords = vector3(1312.93, 1188.8, 106.9),
		locked = true,
		isSliding = true,
		maxDistance = 18.0,
		objHash= -1153093533,
		objHeading = 272.19696,
		objCoords = vector3(1313.23, 1191.527, 105.8075),
	},
	ZADNI_BRANA = {
		textCoords = vector3(1514.0, 1129.13, 114.11),
		locked = true,
		isSliding = true,
		maxDistance = 18.0,
		objHash= -1153093533,
		objHeading = 274.918579,
		objCoords = vector3(1513.948, 1131.812, 113.3859),
	},
}