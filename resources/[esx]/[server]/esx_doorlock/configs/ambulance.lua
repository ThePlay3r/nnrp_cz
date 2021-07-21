Config.Keys['ambulance'] = {
	key_ems_sef = {'REDITEL', 'ADMINISTRACE'},
	key_ems = {
		'ZACHODY_U_SATEN', 'WARD_A', 'LABORKA', 'KUMBAL',
		'SAL_1', 'SAL_2', 'SAL_3', 'PRECHOD_WARD_A_B',
		'JIP', 'WARD_B', 'MRI', 'DIAGNOSTIKA',
		'RTG', 'WARD_C', 'DR_OFFICE_373',
		'DR_OFFICE_372', 'ORDINACE',
		'PRIVATE_ROOM_374', 'PRIVATE_ROOM_370', 'PRIVATE_ROOM_369',
		'PRIVATE_ROOM_371',
		'WARD_D', 'RECEPCE_1', 'RECEPCE_2'
	},
	remote_ems = {'BRANA_VZADU', 'REHABKO'},
}

Config.DoorList['ambulance'] = {
	BRANA_VZADU = {
		objHash = GetHashKey('prop_gate_prison_01'),
		objCoords  = vector3(374.9854, -548.3276, 28.01776),
		objHeading = 89.723,
		textCoords = vector3(375.06, -544.55, 29.58),
		locked = true,
		maxDistance = 15,
		isSliding = true,
	},

	ZACHODY_U_SATEN = {
		objHash = 854291622,
		objHeading = 250.00,
		objCoords = vector3(298.9548, -594.775, 43.43391),
		textCoords = vector3(298.8, -595.42, 43.28),
		locked = true,
		maxDistance = 2.5,
	},
	
    WARD_A = {
		textCoords = vector3(304.00, -581.92, 43.28),
		locked = true,
		maxDistance = 2.5,
		doors = {
			{objHash = GetHashKey('gabz_pillbox_doubledoor_r'), objHeading = 340.00, objCoords = vector3(305.2219, -582.3056, 43.43391)},
			{objHash = GetHashKey('gabz_pillbox_doubledoor_l'), objHeading = 340.00, objCoords = vector3(302.8031, -581.4246, 43.43391)}
		}
	},
	
	LABORKA = {
		objHash = 854291622,
		objHeading = 340.00,
		objCoords = vector3(307.11, -569.56, 43.43),
		textCoords = vector3(307.75, -569.75, 43.28),
		locked = true,
		maxDistance = 2.5,
	},

	KUMBAL = {
		objHash = 854291622,
		objHeading = 70.00,
		objCoords = vector3(303.9596, -572.5579, 43.43391),
		textCoords = vector3(304.23, -571.96, 43.45),
		locked = true,
		maxDistance = 2.5,
	},

	SAL_1 = {
		textCoords = vector3(313.24, -571.82, 43.28),
		locked = true,
		maxDistance = 2.5,
		doors = {
			{objHash = GetHashKey('gabz_pillbox_doubledoor_r'), objHeading = 339.82, objCoords = vector3(314.42, -572.22, 43.43)},
			{objHash = GetHashKey('gabz_pillbox_doubledoor_l'), objHeading = 340.00, objCoords = vector3(312.001, -571.34, 43.43)}
		}
	},

	SAL_2 = {
		textCoords = vector3(319.05, -573.87, 43.28),
		locked = true,
		maxDistance = 2.5,
		doors = {
			{objHash = GetHashKey('gabz_pillbox_doubledoor_r'), objHeading = 340.00, objCoords = vector3(320.26, -574.34, 43.43)},
			{objHash = GetHashKey('gabz_pillbox_doubledoor_l'), objHeading = 340.00, objCoords = vector3(317.84, -573.46, 43.43)}
		}
	},

	SAL_3 = {
		textCoords = vector3(324.45, -575.83, 43.28),
		locked = true,
		maxDistance = 2.5,
		doors = {
			{objHash = GetHashKey('gabz_pillbox_doubledoor_r'), objHeading = 340.00, objCoords = vector3(325.65, -576.30, 43.43)},
			{objHash = GetHashKey('gabz_pillbox_doubledoor_l'), objHeading = 340.00, objCoords = vector3(323.23, -575.42, 43.43)}
		}
	},

    PRECHOD_WARD_A_B = {
		textCoords = vector3(326.1, -579.3, 43.28),
		locked = true,
		maxDistance = 2.5,
		doors = {
			{objHash = GetHashKey('gabz_pillbox_doubledoor_r'), objHeading = 249.99, objCoords = vector3(325.66, -580.45, 43.43)},
			{objHash = GetHashKey('gabz_pillbox_doubledoor_l'), objHeading = 250.07, objCoords = vector3(326.56, -578.04, 43.43)}
		}
	},

    JIP = {
		textCoords = vector3(317.27, -578.67, 43.28),
		locked = true,
		maxDistance = 2.5,
		doors = {
			{objHash = GetHashKey('gabz_pillbox_doubledoor_r'), objHeading = 160.13, objCoords = vector3(316.06, -578.34, 43.28)},
			{objHash = GetHashKey('gabz_pillbox_doubledoor_l'), objHeading = 159.91, objCoords = vector3(318.48, -579.22, 43.43)}
		}
	},

    WARD_B = {
		textCoords = vector3(325.43, -589.72, 43.28),
		locked = true,
		maxDistance = 2.5,
		doors = {
			{objHash = GetHashKey('gabz_pillbox_doubledoor_r'), objHeading = 340.00, objCoords = vector3(326.65, -590.10, 43.43)},
			{objHash = GetHashKey('gabz_pillbox_doubledoor_l'), objHeading = 340.00, objCoords = vector3(324.23, -589.22, 43.43)}
		}
	},

	MRI = {
		objHash = 854291622,
		objHeading = 339.98,
		objCoords = vector3(336.16, -580.14, 43.43),
		textCoords = vector3(336.79, -580.55, 43.28),
		locked = true,
		maxDistance = 2.5,
	},

	DIAGNOSTIKA = {
		objHash = 854291622,
		objHeading = 340.16,
		objCoords = vector3(340.78, -581.82, 43.43),
		textCoords = vector3(341.41, -582.1, 43.28),
		locked = true,
		maxDistance = 2.5,
	},

	RTG = {
		objHash = 854291622,
		objHeading = 340.04,
		objCoords = vector3(346.77, -584.00, 43.43),
		textCoords = vector3(347.34, -584.23, 43.28),
		locked = true,
		maxDistance = 2.5,
	},

	ADMINISTRACE = {
		objHash = 854291622,
		objHeading = 340.11,
		objCoords = vector3(339.00, -586.70, 43.43),
		textCoords = vector3(339.68, -586.87, 43.28),
		locked = true,
		maxDistance = 2.5,
	},

	REDITEL = {
		objHash = 854291622,
		objHeading = 340.00,
		objCoords = vector3(336.8665, -592.5788, 43.43391),
		textCoords = vector3(337.37, -592.75, 43.45),
		locked = true,
		maxDistance = 2.5,
	},

    WARD_C = {
		textCoords = vector3(348.85, -587.52, 43.28),
		locked = true,
		maxDistance = 2.5,
		doors = {
			{objHash = GetHashKey('gabz_pillbox_doubledoor_r'), objHeading = 249.89, objCoords = vector3(348.43, -588.74, 43.43)},
			{objHash = GetHashKey('gabz_pillbox_doubledoor_l'), objHeading = 250.00, objCoords = vector3(349.31, -586.32, 43.43)}
		}
	},

	DR_OFFICE_373 = {
		objHash = 854291622,
		objHeading = 249.84,
		objCoords = vector3(352.19, -594.14, 43.43),
		textCoords = vector3(351.99, -594.73, 43.28),
		locked = true,
		maxDistance = 2.5,
	},
	
	DR_OFFICE_372 = {
		objHash = 854291622,
		objHeading = 340.12,
		objCoords = vector3(358.72, -593.88, 43.43),
		textCoords = vector3(359.24, -594.21, 43.28),
		locked = true,
		maxDistance = 2.5,
	},

	ORDINACE = {
		objHash = 854291622,
		objHeading = 70.00,
		objCoords = vector3(346.8855, -593.6, 43.43391),
		textCoords = vector3(347.15, -593.03,43.45),
		locked = true,
		maxDistance = 2.5,
	},

	PRIVATE_ROOM_374 = {
		objHash = 854291622,
		objHeading = 250.00,
		objCoords = vector3(350.8341, -597.8997, 43.3391),
		textCoords = vector3(350.55, -598.4, 43.45),	
		locked = true,
		maxDistance = 2.5,
	},

	PRIVATE_ROOM_370 = {
		objHash = 854291622,
		objHeading = 250.00,
		objCoords = vector3(356.1252, -583.3625, 43.43391),
		textCoords = vector3(355.87, -584.02, 43.45),
		locked = true,
		maxDistance = 2.5,
	},

	PRIVATE_ROOM_369 = {
		objHash = 854291622,
		objHeading = 250.00,
		objCoords = vector3(357.4908, -579.6105, 43.43391),
		textCoords = vector3(357.31, -580.22, 43.45),
		locked = true,
		maxDistance = 2.5,
	},

	PRIVATE_ROOM_371 = {
		objHash = 854291622,
		objHeading = 340.00,
		objCoords = vector3(360.5034, -588.9995, 43.43391),
		textCoords = vector3(361.02, -589.23, 43.45),
		locked = true,
		maxDistance = 2.5,
	},

    WARD_D = {
		textCoords = vector3(327.77, -593.97, 43.28),
		locked = true,
		maxDistance = 2.5,
		doors = {
			{objHash = GetHashKey('gabz_pillbox_doubledoor_r'), objHeading = 249.93, objCoords = vector3(327.25, -595.19, 43.43)},
			{objHash = GetHashKey('gabz_pillbox_doubledoor_l'), objHeading = 249.85, objCoords = vector3(328.13, -592.77, 43.43)}
		}
	},

	RECEPCE_1 = {
		objHash = 854291622,
		objHeading = 250.03,
		objCoords = vector3(313.48, -595.45, 43.43),
		textCoords = vector3(313.27, -596.2, 43.28),
		locked = true,
		maxDistance = 1,
	},

	RECEPCE_2 = {
		objHash = 854291622,
		objHeading = 160.04,
		objCoords = vector3(309.13, -597.75, 43.43),
		textCoords = vector3(308.47, -597.44, 43.28),
		locked = true,
		maxDistance = 1,
	},

	REHABKO = {
		textCoords = vector3(-1477.66, 884.96, 182.88),
		locked = true,
		maxDistance = 2.5,
		doors = {
			{objHash = -349730013, objHeading = 79.30696, objHeadingOpen = 158.0, objCoords = vector3(-1478.257, 882.243, 183.0719)},
			{objHash = -1918480350, objHeading = 79.079299, objHeadingOpen = 359.0, objCoords = vector3(-1477.229, 887.649, 183.0719)}
		}
	},
}