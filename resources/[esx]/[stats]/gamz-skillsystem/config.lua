Config = {}

Config.UpdateFrequency = 600 -- seconds interval between removing values 

Config.Notifications = false -- notification when skill is added

Config.Skills = {
    ["Stamina"] = {
        ["Current"] = 0, -- Default value 
        ["RemoveAmount"] = -0.3, -- % to remove when updating,
        ["Stat"] = "MP0_STAMINA" -- GTA stat hashname
    },

    ["Strength"] = {
        ["Current"] = 0,
        ["RemoveAmount"] = -0.2,
        ["Stat"] = "MP0_STRENGTH"
    },

    ["Shooting"] = {
        ["Current"] = 0,
        ["RemoveAmount"] = -0.05,
        ["Stat"] = "MP0_SHOOTING_ABILITY"
    },
}

Config.Zones = {
    ammu = vector3(13.55, -1097.19, 29.83),
}