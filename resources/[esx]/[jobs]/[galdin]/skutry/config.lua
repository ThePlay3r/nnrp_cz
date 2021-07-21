Config = {}
Config.Locale = 'cs'

Config.MaxDrawDistance = 100

Config.DiscordUrl = 'https://discordapp.com/api/webhooks/711603983491268638/7oYjaNjmgxTV6KkHuw809biSBAIZ0xFjnfr7JU9KejlzynjA5OMI7I7jZVSsznlTPTks'

Config.Zones = {
    Spawner = {
        Pos   = vector3(-2283.19, -612.13, 10.33),
        Size         = { x = 1.0, y = 1.0, z = 1.0 },
	    olor        = { r = 255, g = 255, b = 0 },
        Type  = 36,
    },
    Spawner2 = {
        Pos   = vector3(-2293.65, -657.9, 3.95),
        Size         = { x = 1.0, y = 1.0, z = 1.0 },
	    olor        = { r = 255, g = 255, b = 0 },
        Type  = 36,
    },

    Deleter = {
        Pos   = vector3(-2347.79, -634.04, 0.23),
	    Size  = { x = 3.0, y = 3.0, z = 3.0 },
	    Color = { r = 238, g = 0, b = 0 },
	    Type  = 1,
    },
}

Config.Vehicles = {
    {model = 'seashark', label = 'Vodni skutr', price = 15000},
}

Config.Keys = {
    ["E"] = 38
}