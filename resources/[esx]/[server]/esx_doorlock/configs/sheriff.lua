Config.Keys['sheriff'] = {
    key_sheriff = {'VCHOD',
        'VCHOD_K_CELAM_VEDLE_HL_VCHODU', 'VCHOD_K_CELAM_NAPROTI_HL_VCHODU', 'VCHOD_K_CELAM_VPRAVO_OD_HL_VCHODU', 'VCHOD_VYSLECH_U_HL_VCHODU',
        'VCHOD_ZADNI', 'ZBROJNICE', 'CELA_1', 'CELA_2',
        'PL_HL_VCHOD', 'PL_VCHOD_BACK', 'PL_VCHOD_BACK2', 'PL_VYSLECH', 'PL_ODPOSLECH',
        'PL_OFFICE1', 'PL_OFFICE2', 'PL_DVOJCHODBA1', 'PL_DVOJCHODBA2', 'PL_CELY', 'PL_ZBROJKA',
        'PL_CELA1', 'PL_CELA2'
    },
}

Config.DoorList['sheriff'] = {
    -- PALETO
    PL_CELA1 = {
        objHash = 631614199,
        objHeading = 315.51547241211,
        objCoords = vector3(-428.0646, 5996.672, 31.87312),
        textCoords = vector3(-428.53, 5997.18, 31.72),
        locked = true,
        maxDistance = 2.5,
    },
    PL_CELA2 = {
        objHash = 631614199,
        objHeading = 315.51547241211,
        objCoords = vector3(-431.1921, 5999.742, 31.87312),
        textCoords = vector3(-431.67, 6000.2, 31.72),
        locked = true,
        maxDistance = 2.5,
    },
    PL_CELY = {
        objHash = 631614199,
        objHeading = 315.50,
        objCoords = vector3(-432.1754, 5992.122, 31.87312),
        textCoords = vector3(-432.68, 5992.51, 31.72),
        locked = true,
        maxDistance = 2.5,
    },
    PL_ZBROJKA = {
        objHash = -1011692606,
        objHeading = 314.74157714844,
        objCoords = vector3(-437.6144, 5992.819, 31.93606),
        textCoords = vector3(-437.02, 5992.28, 31.72),
        locked = true,
        maxDistance = 2.5,
    },
    PL_HL_VCHOD = {
		textCoords = vector3(-443.65, 6016.02, 31.72),
		locked = true,
		maxDistance = 2.5,
		doors = {
			{objHash = -1501157055, objHeading = 135.00006103516, objCoords = vector3(-444.485, 6017.06, 31.86633)},
			{objHash = -1501157055, objHeading = 315.00006103516, objCoords = vector3(-442.6601, 6015.222, 31.86633)}
		}
    },
    PL_VCHOD_BACK = {
        objHash = 452874391,
        objHeading = 134.836945,
        objCoords = vector3(-447.2263, 6002.329, 31.83943),
        textCoords = vector3(-446.73, 6001.97, 31.72),
        locked = true,
        maxDistance = 2.5,
    },
    PL_VCHOD_BACK2 = {
        objHash = 452874391,
        objHeading = 315.336029,
        objCoords = vector3(-450.9787, 6006.075, 31.99417),
        textCoords = vector3(-451.41, 6006.58, 31.84),
        locked = true,
        maxDistance = 2.5,
    },
    PL_VYSLECH = {
        objHash = -519068795,
        objHeading = 10.008574,
        objCoords = vector3(-454.536, 6011.258, 31.86982),
        textCoords = vector3(-453.89, 6011.49, 31.72),
        locked = true,
        maxDistance = 2.5,
    },
    PL_ODPOSLECH = {
        objHash = -2023754432,
        objHeading = 135.00007629395,
        objCoords = vector3(-449.7946, 6015.448, 31.86633),
        textCoords = vector3(-450.31, 6015.99, 31.72),
        locked = true,
        maxDistance = 2.5,
    },
    PL_OFFICE1 = {
        objHash = -952356348,
        objHeading = 45.126373,
        objCoords = vector3(-437.6891, 6008.364, 31.86407),
        textCoords = vector3(-438.2, 6007.94, 31.72),
        locked = true,
        maxDistance = 2.5,
    },
    PL_OFFICE2 = {
        objHash = -952356348,
        objHeading = 44.858494,
        objCoords = vector3(-441.0539, 6004.997, 31.8644),
        textCoords = vector3(-441.72, 6004.6, 31.72),
        locked = true,
        maxDistance = 2.5,
    },

    PL_DVOJCHODBA1 = {
		textCoords = vector3(-448.57, 6007.72, 31.72),
		locked = true,
		maxDistance = 2.5,
		doors = {
			{objHash = -681066206, objHeading = 135.00007629395, objCoords = vector3(-449.55, 6008.558, 31.80887)},
			{objHash = 245182344, objHeading = 315.00006103516, objCoords = vector3(-447.7092, 6006.717, 31.80887)},
		}
    },
    PL_DVOJCHODBA2 = {
		textCoords = vector3(-441.95, 6011.92, 31.72),
		locked = true,
		maxDistance = 2.5,
		doors = {
			{objHash = 964838196, objHeading = 224.8373260498, objCoords = vector3(-442.8215, 6010.931, 31.86633)},
			{objHash = 964838196, objHeading = 45.070064544678, objCoords = vector3(-440.9807, 6012.771, 31.86633)}
		}
    },
    -- SANDY
	VCHOD = {
        objHash = -1765048490,
        objHeading = 30.0,
        objCoords = vector3(1855.687, 3683.927, 34.58585),
        textCoords = vector3(1855.21, 3683.59, 34.45),
        locked = true,
        maxDistance = 2.5,
    },

	VCHOD_K_CELAM_VEDLE_HL_VCHODU = {
        textCoords = vector3(1850.87, 3682.81, 34.26),
        locked = true,
        maxDistance = 2.5,
        objHash = -2023754432,
        objHeading = 299.971253,
        objCoords = vector3(1850.446, 3683.377, 34.40295),
    },

    VCHOD_K_CELAM_NAPROTI_HL_VCHODU = {
        textCoords = vector3(1848.35, 3690.49, 34.26),
        locked = true,
        maxDistance = 2.5,
        objHash = -2023754432,
        objHeading = 209.65591431,
        objCoords = vector3(1848.856, 3690.847, 34.40295),
    },

    VCHOD_K_CELAM_VPRAVO_OD_HL_VCHODU = {
        textCoords = vector3(1856.91, 3689.63, 34.26),
        locked = true,
        maxDistance = 1.5,
        objHash = -2023754432,
        objHeading = 209.944672,
        objCoords = vector3(1857.466, 3689.996, 34.40029),
    },

    VCHOD_VYSLECH_U_HL_VCHODU = {
        textCoords = vector3(1859.17, 3688.5, 34.26),
        locked = true,
        maxDistance = 1.5,
        objHash = -1765048490,
        objHeading = 300.029724,
        objCoords = vector3(1859.518, 3687.894, 34.56854),
    },

    VCHOD_ZADNI = {
        textCoords = vector3(1854.87, 3700.49, 34.26),
        locked = true,
        maxDistance = 1.5,
        objHash = 452874391,
        objHeading = 209.97125244141,
        objCoords = vector3(1854.107, 3700.163, 34.40295),
    },

    ZBROJNICE = {
        textCoords = vector3(1844.62, 3693.53, 34.26),
        locked = true,
        maxDistance = 1.5,
        objHash = -519068795,
        objHeading = 299.971252,
        objCoords = vector3(1844.318, 3694.14, 34.40425),
    },

    CELA_1 = {
        textCoords = vector3(1847.04, 3684.89, 34.26),
        locked = true,
        maxDistance = 1.5,
        objHash = 631614199,
        objHeading = 119.945221,
        objCoords = vector3(1846.645, 3685.48, 34.40243),
    },

    CELA_2 = {
        textCoords = vector3(1845.16, 3688.0, 34.26),
        locked = true,
        maxDistance = 1.5,
        objHash = 631614199,
        objHeading = 120.0864,
        objCoords = vector3(1844.865, 3688.567, 34.40243),
    },
}