Config = {}
Config.Locale = 'cs'

Config.MaxDrawDistance = 100

Config.DiscordUrl = 'https://discordapp.com/api/webhooks/735796210388172822/nO7lsAXt9ioKsVYvEo-pm4v9nozPMnEzVocNhLA19bPtHcaDKe-tJdlrvK3JW1YBZElx'

Config.Zones = {
    Spawner = {
        Pos   = vector3(1108.85, 2107.67, 53.88),
        Size         = { x = 1.0, y = 1.0, z = 1.0 },
	    olor        = { r = 255, g = 255, b = 0 },
        Type  = 36,
    },

    Deleter = {
        Pos   = vector3(1097.02, 2099.83, 52.63),
	    Size  = { x = 3.0, y = 3.0, z = 1.0 },
	    Color = { r = 238, g = 0, b = 0 },
	    Type  = 1,
    },
}

Config.Vehicles = {
    {model = 'kx450f', label = 'Kawasaki KX450F', price = 5000},
    {model = 'sanchez', label = 'Sanchez', 5000}
}

Config.Keys = {
    ["E"] = 38
}