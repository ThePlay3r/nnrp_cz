Config = {}

Config.Keys = {
	["E"] = 38,
}

Config.MaxDrawDistance = 50

Config.Blips = {
    {
        title = "Muscle Sands Gym",
        colour = 7,
        id = 311,
        x = -1201.2257,
        y = -1568.8670,
        z = 4.6101,
    }
}

Config.Shops = {
    {label = 'Posilka', name = 'shop', action = 'otevreni menu posilovny', coords = vector3(-1195.6551, -1577.7689, 4.6115)},
    {label = 'Půjčovna kol', name = 'rentbike', action = 'pujceni kola', coords = vector3(-1199.1164, -1584.5972, 4.3249)},
}

Config.Colors = {
    arms = {r = 201, g = 10, b = 10},
    pushups = {r = 102, g = 252, b = 48},
    yoga = {r = 255, g = 0, b = 191},
    situps = {r = 159, g = 25, b = 255},
    chins = {r = 255, g = 125, b = 25},
    box = {r = 25, g = 68, b = 255},
    jumpingjack = {r = 251, g = 255, b = 25},
    stretch = {r = 25, g = 255, b = 232},
}

Config.Workouts = {
    -- POSILOVANI RUKOU
    {
        label = 'Posilování rukou', name = 'arms', action = 'posilovani rukou',
        coords = vector3(-1210.98, -1560.39, 4.6115), scenario = 'world_human_muscle_free_weights', skills = {Strength = 0.5, Stamina = 0.15},
    },
    {
        label = 'Posilování rukou', name = 'arms', action = 'posilovani rukou',
        coords = vector3(-1203.35, -1567.68, 4.6115), scenario = 'world_human_muscle_free_weights', skills = {Strength = 0.5, Stamina = 0.15},
    },
    {
        label = 'Posilování rukou', name = 'arms', action = 'posilovani rukou',
        coords = vector3(-1199.34, -1579.21, 4.6115), scenario = 'world_human_muscle_free_weights', skills = {Strength = 0.5, Stamina = 0.15},
    },
    {
        label = 'Posilování rukou', name = 'arms', action = 'posilovani rukou',
        coords = vector3(-1200.75, -1577.44, 4.6115), scenario = 'world_human_muscle_free_weights', skills = {Strength = 0.5, Stamina = 0.15},
    },
    {
        label = 'Posilování rukou', name = 'arms', action = 'posilovani rukou',
        coords = vector3(-1202.08, -1575.43, 4.6115), scenario = 'world_human_muscle_free_weights', skills = {Strength = 0.5, Stamina = 0.15},
    },

    -- KLIKY
    {
        label = 'Kliky', name = 'pushups', action = 'kliky', animationSet = 'amb@world_human_push_ups@male@idle_a',
        coords = vector3(-1197.35, -1570.65, 4.6115), animation = 'idle_d', skills = {Strength = 0.35, Stamina = 0.25},
    },
    {
        label = 'Kliky', name = 'pushups', action = 'kliky', animationSet = 'amb@world_human_push_ups@male@idle_a',
        coords = vector3(-1200.23, -1570.08, 4.6115), animation = 'idle_d', skills = {Strength = 0.35, Stamina = 0.25},
    },
    {
        label = 'Kliky', name = 'pushups', action = 'kliky', animationSet = 'amb@world_human_push_ups@male@idle_a',
        coords = vector3(-1200.81, -1566.53, 4.6115), animation = 'idle_d', skills = {Strength = 0.35, Stamina = 0.25},
    },

    -- YOGA
    {
        label = 'Yoga', name = 'yoga', action = 'cviceni yogy',
        coords = vector3(-1207.22, -1560.25, 4.6115), scenario = 'world_human_yoga', skills = {Strength = 0.15, Stamina = 0.5},
    },
    {
        label = 'Yoga', name = 'yoga', action = 'cviceni yogy',
        coords = vector3(-1208.66, -1559.07, 4.6115), scenario = 'world_human_yoga', skills = {Strength = 0.15, Stamina = 0.5},
    },
    {
        label = 'Yoga', name = 'yoga', action = 'cviceni yogy',
        coords = vector3(-1205.99, -1558.48, 4.6115), scenario = 'world_human_yoga', skills = {Strength = 0.15, Stamina = 0.5},
    },
    
    -- SEDYLEHY
    {
        label = 'Sedylehy', name = 'situps', action = 'cviceni sedulehu', animationSet = 'amb@world_human_sit_ups@male@idle_a',
        coords = vector3(-1206.06, -1561.38, 4.6115), animation = 'idle_a', skills = {Strength = 0.3, Stamina = 0.3},
    },
    {
        label = 'Sedylehy', name = 'situps', action = 'cviceni sedulehu', animationSet = 'amb@world_human_sit_ups@male@idle_a',
        coords = vector3(-1207.22, -1563.97, 4.6115), animation = 'idle_a', skills = {Strength = 0.3, Stamina = 0.3},
    },

    -- PRITAHY
    {
        label = 'Přítahy', name = 'chins', action = 'cviceni pritahu',
        coords = vector3(-1209.33, -1563.51, 4.6115), scenario = 'prop_human_muscle_chin_ups', skills = {Strength = 0.4, Stamina = 0.2},
    },
    {
        label = 'Přítahy', name = 'chins', action = 'cviceni pritahu',
        coords = vector3(-1210.27, -1562.37, 4.6115), scenario = 'prop_human_muscle_chin_ups', skills = {Strength = 0.4, Stamina = 0.2},
    },
    {
        label = 'Přítahy', name = 'chins', action = 'cviceni pritahu',
        coords = vector3(-1204.83, -1564.29, 4.6115), scenario = 'prop_human_muscle_chin_ups', skills = {Strength = 0.4, Stamina = 0.2},
    },
    {
        label = 'Přítahy', name = 'chins', action = 'cviceni pritahu',
        coords = vector3(-1201.25, -1562.34, 4.6115), scenario = 'prop_human_muscle_chin_ups', skills = {Strength = 0.4, Stamina = 0.2},
    },
    {
        label = 'Přítahy', name = 'chins', action = 'cviceni pritahu',
        coords = vector3(-1200.16, -1563.88, 4.6115), scenario = 'prop_human_muscle_chin_ups', skills = {Strength = 0.4, Stamina = 0.2},
    },

    -- BOXING
    {
        label = 'Box', name = 'box', action = 'cviceni boxu', animation = 'shadow_boxing',
        coords = vector3(-1202.7, -1559.0, 4.6115), animationSet = 'anim@mp_player_intcelebrationmale@shadow_boxing', skills = {Strength = 0.4, Stamina = 0.2},
    },
    {
        label = 'Box', name = 'box', action = 'cviceni boxu', animation = 'shadow_boxing',
        coords = vector3(-1204.52, -1557.31, 4.6115), animationSet = 'anim@mp_player_intcelebrationmale@shadow_boxing', skills = {Strength = 0.4, Stamina = 0.2},
    },
    
    -- PANAKY
    {
        label = 'Panaci', name = 'jumpingjack', action = 'skakani panaka', animation = 'jimmy_getknocked',
        coords = vector3(-1198.31, -1566.95, 4.6115), animationSet = 'timetable@reunited@ig_2', skills = {Strength = 0.1, Stamina = 0.4},
    },
    {
        label = 'Panaci', name = 'jumpingjack', action = 'skakani panaka', animation = 'jimmy_getknocked',
        coords = vector3(-1197.72, -1568.76, 4.6115), animationSet = 'timetable@reunited@ig_2', skills = {Strength = 0.1, Stamina = 0.4},
    },
    {
        label = 'Panaci', name = 'jumpingjack', action = 'skakani panaka', animation = 'jimmy_getknocked',
        coords = vector3(-1199.75, -1571.88, 4.6115), animationSet = 'timetable@reunited@ig_2', skills = {Strength = 0.1, Stamina = 0.4},
    },

    -- PROTAHOVANI
    {
        label = 'Protazeni', name = 'stretch', action = 'protahovani', animation = 'idle_e',
        coords = vector3(-1195.02, -1571.49, 4.6115), animationSet = 'mini@triathlon', skills = {Strength = 0.3, Stamina = 0.3},
    },
    {
        label = 'Protazeni', name = 'stretch', action = 'protahovani', animation = 'idle_f',
        coords = vector3(-1196.03, -1572.71, 4.6115), animationSet = 'mini@triathlon', skills = {Strength = 0.3, Stamina = 0.3},
    },
    {
        label = 'Protazeni', name = 'stretch', action = 'protahovani', animation = 'idle_d',
        coords = vector3(-1197.46, -1573.8, 4.6115), animationSet = 'mini@triathlon', skills = {Strength = 0.3, Stamina = 0.3},
    },
    {
        label = 'Protazeni', name = 'stretch', action = 'protahovani', animation = 'idle_e',
        coords = vector3(-1198.7, -1574.88, 4.6115), animationSet = 'rcmfanatic1maryann_stretchidle_b', skills = {Strength = 0.3, Stamina = 0.3},
    },
}