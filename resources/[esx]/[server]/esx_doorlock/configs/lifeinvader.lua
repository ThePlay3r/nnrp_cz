Config.Keys['lifeinvader'] = {
    key_lifeinvader = { 'ZAMEK_1', 'ZAMEK_2', 'SKLAD_1', 'HLAVNI_VCHOD', 'ZADNI_VCHOD'},
}

Config.DoorList['lifeinvader'] = {
    SKLAD_1 = {
        objHash = -1881825907,
        objHeading = 27.00,
        textCoords = vector3(-1051.63, -236.96, 39.73),
        objCoords = vector3(-1050.967, -236.6299, 39.88301),
        locked = true,
        maxDistance = 2.5,                      
    },

    ZAMEK_1 = {
        objHash = -1881825907,
        objHeading = 118.00,
        textCoords = vector3(-1063.19, -241.40, 39.73),
        objCoords = vector3(-1063.804, -240.8321, 39.88301),
        locked = true,
        maxDistance = 2.5,                      
    },

    ZAMEK_2 = {
        objHash = -495720969,
        objHeading = 207.00,
        textCoords = vector3(-1055.40, -235.95, 44.02),
        objCoords = vector3(-1055.958, -236.4251, 44.171),
        locked = true,
        maxDistance = 2.5,                      
    },

    HLAVNI_VCHOD = {
        textCoords = vector3(-1082.29, -259.82, 37.81),
        locked = true,
        maxDistance = 2.5,
        doors = {
            {objHash = -1045015371, objHeading = 28.00, objCoords = vector3(-1080.974, -259.0204, 38.1867)},
            {objHash = -1679881977, objHeading = 28.00, objCoords = vector3(-1083.62, -260.4167, 38.1867)},
        }
    },

    ZADNI_VCHOD = {
        textCoords = vector3(-1045.84, -230.58, 39.01),
        locked = true,
        maxDistance = 2.5,
        doors = {
            {objHash = -1425071302, objHeading = 118.00, objCoords = vector3(-1046.516, -229.3581, 39.43794)},
            {objHash = -1104171198, objHeading = 118.00, objCoords = vector3(-1045.12, -232.004, 39.43794)},
        }
    },  
}