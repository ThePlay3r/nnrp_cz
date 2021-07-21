Config.Keys['police'] = {
    key_lspd_kancl = {'KANCL_SEFA', 'KANCL_SEFA_HORNI'},
    key_pd = {
        'ZADNI_VCHOD_NAHORE_NAD_GARAZI', 'VCHOD', 'ZBROJNICE', 'DVERE_SATNA', 
        'STRECHA', 'SKLENENE_DVERE_HL_BRANA', 'PRUCHOD_K_HL_GARAZI', 'VCHOD_OD_GARAZI', 
        'VSTUP_DO_CEL_Z_HL_BUDOVY', 'CELA_1', 'CELA_2', 'CELA_3', 
        'VCHOD_DO_CEL_Z_VENKU', 'VCHOD_DO_CEL_ZADNI', 'SKLENENA_CELA_1', 'SKLENENA_CELA_2', 
        'SKLENENA_CELA_3', 'SKLENENA_CELA_4', 'VRCHNI_VCHOD_DO_CEL_STRECHY_KANCLU',
        'VYSLECH_1', 'VYSLECH_2',
    },
    remote_pd = {
        'VEZNICE', 'HLAVNI_BRANA', 'ZADNI_BRANA'
    }
}

Config.DoorList['police'] = {
    VEZNICE = {
        textCoords = vector3(1844.68, 2608.52, 45.59),
        locked = true,
        maxDistance = 25,
        isSliding = true,
        objHash = 741314661,
        objHeading = 90,
        objCoords = vector3(1844.998, 2604.811, 44.63626),
    },

    ZADNI_VCHOD_NAHORE_NAD_GARAZI = {
        textCoords = vector3(463.44, -1011.29, 32.99),
        locked = true,
        maxDistance = 2,
        isSliding = true,
        objHash = 507213820,
        objHeading = 0.2545299,
        objCoords = vector3(464.1584, -1011.26, 33.01121),
    },

    VCHOD = {
        textCoords = vector3(434.73, -981.87, 30.83),
        locked = true,
        maxDistance = 2.5,
        doors = {
            {objHash = GetHashKey('v_ilev_ph_door002'), objHeading = 270.21, objCoords = vector3(434.74, -983.2151, 30.83)},
            {objHash = GetHashKey('v_ilev_ph_door01'), objHeading = 269.75, objCoords = vector3(434.74, -980.6184, 30.83)}
        }
    },

    KANCL_SEFA = {
        objHash = -1320876379,
        objHeading = 180.00012207031,
        objCoords = vector3(446.5728, -980.0106, 30.83931),
        textCoords = vector3(447.3, -980.18, 30.69),
        locked = true,
        maxDistance = 4.5,
    },

    HLAVNI_BRANA = {
        objHash = GetHashKey('hei_prop_station_gate'),
        objCoords  = vector3(411.2037, -1026.055, 28.40516),
        objHeading = 269.72,
        textCoords = vector3(411.24, -1023.46, 29.43),
        locked = true,
        maxDistance = 15,
        isSliding = true,
    },

    ZBROJNICE = {
        objHash = -1033001619,
        objHeading = 90.63,
        objCoords = vector3(453.0938, -983.2294, 30.83927),
        textCoords = vector3(453.19, -982.59, 30.69),
        locked = true,
        maxDistance = 2,
    },

    DVERE_SATNA = {
        objHash = 1557126584,
        objHeading = 89.99,
        objCoords = vector3(450.1042, -985.7384, 30.83927),
        textCoords = vector3(450.18, -986.35, 30.69),
        locked = true,
        maxDistance = 2,
    },

    STRECHA = {
        objHash = -340230128,
        objHeading = 90.21,
        objCoords = vector3(464.3614, -984.678, 43.83),
        textCoords = vector3(464.28, -983.98, 43.69),
        locked = true,
        maxDistance = 4.5,
    },

    SKLENENE_DVERE_HL_BRANA = {
        objHash = -368655288,
        objHeading = 180.51,
        objCoords = vector3(419.7636, -1018.158, 29.73),
        textCoords = vector3(419.11, -1018.14, 29.38),
        locked = true,
        maxDistance = 2.0,
    },

    PRUCHOD_K_HL_GARAZI = {
        textCoords = vector3(423.76, -992.33, 30.8),
        locked = true,
        maxDistance = 2.0,
        doors = {
            {objHash = GetHashKey('v_ilev_cbankvaulgate01'), objHeading = 180.0, objCoords = vector3(423.76, -992.33, 30.8)}
        }
    },

    VCHOD_OD_GARAZI = {
        textCoords = vector3(445.89, -998.97, 30.72),
        locked = true,
        maxDistance = 2.5,
        doors = {
            {objHash = GetHashKey('v_ilev_gtdoor'), objHeading = 179.80, objCoords = vector3(447.21, -999.00, 30.78)},
            {objHash = GetHashKey('v_ilev_gtdoor'), objHeading = 0.08, objCoords = vector3(444.62, -999.00, 30.78)}
        }
    },

    VSTUP_DO_CEL_Z_HL_BUDOVY = {
        objHash = 631614199,
        objHeading = 0.00,
        objCoords = vector3(464.57, -992.66, 25.06),
        textCoords = vector3(463.92, -992.7, 24.91),
        locked = true,
        maxDistance = 1.5,
    },  

    CELA_1 = {
        objHash = 631614199,
        objHeading = 269.66,
        objCoords = vector3(461.80, -994.40, 25.06),
        textCoords = vector3(461.87, -993.82, 24.91),
        locked = true,
        maxDistance = 1.5,
    },  

    CELA_2 = {
        objHash = 631614199,
        objHeading = 90.16,
        objCoords = vector3(461.80, -997.65, 25.06),
        textCoords = vector3(461.87, -998.35, 24.91),
        locked = true,
        maxDistance = 1.5,
    },  

    CELA_3 = {
        objHash = 631614199,
        objHeading = 90.16,
        objCoords = vector3(461.80, -1001.30, 25.06),
        textCoords = vector3(461.87, -1001.97, 24.91),
        locked = true,
        maxDistance = 1.5,
    },  

    VCHOD_DO_CEL_Z_VENKU = {
        objHash = -1033001619,
        objHeading = 0.04,
        objCoords = vector3(463.47, -1003.53, 25.00),
        textCoords = vector3(464.12, -1003.49, 24.91),
        locked = true,
        maxDistance = 1.5,
    },  

    VCHOD_DO_CEL_ZADNI = {
        textCoords = vector3(468.67, -1014.51, 26.39),
        locked = true,
        maxDistance = 2.5,
        doors = {
            {objHash = GetHashKey('v_ilev_rc_door2'), objHeading = 179.81, objCoords = vector3(469.96, -1014.45, 26.53)},
            {objHash = GetHashKey('v_ilev_rc_door2'), objHeading = 359.98, objCoords = vector3(467.37, -1014.452, 26.53)}
        }
    },

    ZADNI_BRANA = {
        objHash = GetHashKey('hei_prop_station_gate'),
        objCoords  = vector3(488.89, -1017.21, 27.14),
        objHeading = 90.00,
        textCoords = vector3(488.86, -1019.8, 28.21),     
	    locked = true,
        maxDistance = 15,
        isSliding = true,
    },

    SKLENENA_CELA_1 = {
        objHash = -1033001619,
        objHeading = 0.0,
        objCoords = vector3(467.19, -996.45, 25.00),
        textCoords = vector3(467.89, -996.45, 25.00),
        locked = true,
        maxDistance = 1.5,
    },  

    SKLENENA_CELA_2 = {
        objHash = -1033001619,
        objHeading = 0.0,
        objCoords = vector3(471.47, -996.45, 25.00),
        textCoords = vector3(472.1, -996.45, 25.00),
        locked = true,
        maxDistance = 1.5,
    },  

    SKLENENA_CELA_3 = {
        objHash = -1033001619,
        objHeading = 0.0,
        objCoords = vector3(475.75, -996.45, 25.00),
        textCoords = vector3(476.3, -996.45, 25.00),
        locked = true,
        maxDistance = 1.5,
    },  

    SKLENENA_CELA_4 = {
        objHash = -1033001619,
        objHeading = 0.0,
        objCoords = vector3(480.03, -996.45, 25.00),
        textCoords = vector3(480.68, -996.45, 25.00),       
	    locked = true,
        maxDistance = 1.5,
    },  

    VRCHNI_VCHOD_DO_CEL_STRECHY_KANCLU = {
        textCoords = vector3(444.68, -989.43, 30.69),
        locked = true,
        maxDistance = 2.5,
        doors = {
            {objHash = GetHashKey('v_ilev_ph_gendoor005'), objHeading = 179.58, objCoords = vector3(443.40, -989.44, 30.83)},
            {objHash = GetHashKey('v_ilev_ph_gendoor005'), objHeading = 359.81, objCoords = vector3(446.00, -989.44, 30.83)}
        }
    },

    KANCL_SEFA_HORNI = {
        objHash = -1320876379,
        objHeading = 0.0,
        objCoords = vector3(463.4168, -1001.015, 36.05486),
        textCoords = vector3(462.68, -1000.97, 35.93),       
	    locked = true,
        maxDistance = 1.5,
    },


    -- VYSLECHOVKY
    VYSLECH_1 = {
        objHash = -1033001619,
        objHeading = 179.55696,
        objCoords = vector3(468.4872, -1003.548, 25.01314),
        textCoords = vector3(467.83, -1003.48, 24.91),       
	    locked = true,
        maxDistance = 1.5,
    },
    VYSLECH_2 = {
        objHash = -1033001619,
        objHeading = 179.4440,
        objCoords = vector3(477.0497, -1003.553, 25.01203),
        textCoords = vector3(476.32, -1003.58, 24.91),       
	    locked = true,
        maxDistance = 1.5,
    },
}