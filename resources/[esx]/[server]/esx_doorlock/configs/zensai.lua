Config.Keys['zensai'] = {
    key_zensai = {'VCHOD', 'KUCHYN'},
    remote_zensai = {'HL_BRANA', 'VEDLEJSI_BRANA'},
}

Config.DoorList['zensai'] = {
    VCHOD = {
        textCoords = vector3(114.83, -1038.75, 29.29),
        locked = true,
        maxDistance = 2.5,
        doors = {
            {objHash = GetHashKey('prop_showroom_door_l'), objHeading = 70.77, objCoords = vector3(114.55, -1039.65, 29.52)},
            {objHash = GetHashKey('prop_showroom_door_r'), objHeading = 70.77, objCoords = vector3(115.19, -1037.84, 29.52)}
        }
    },

    KUCHYN = {
        textCoords = vector3(133.07, -1056.61, 22.96),
        locked = true,
        maxDistance = 2.5,
        objHash = -2023754432,
        objHeading = 249.5618,
        objCoords = vector3(133.224, -1055.855, 23.1155),
    },

    HL_BRANA = {
        textCoords = vector3(99.54, -1068.32, 29.31),
        locked = true,
        maxDistance = 15.0,
        objHash = 1286535678,
        objHeading = 245.0000,
        isSliding = true,
        objCoords = vector3(98.17435, -1071.624, 28.31908),
    },

    VEDLEJSI_BRANA = {
        textCoords = vector3(131.65, -1030.37, 29.36),
        locked = true,
        isSliding = true,
        maxDistance = 15.0,
        objHash = -982531572,
        objHeading = 160.0000,
        objCoords = vector3(131.6898, -1031.126, 30.77738),
    },
}