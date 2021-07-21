Config              = {}
Config.DrawDistance = 100
Config.Size         = {x = 1.5, y = 1.5, z = 1.5}
Config.Color        = {r = 0, g = 128, b = 255}
Config.Type         = 1
Config.Locale = 'cs'

Config.Zones = {

	TwentyFourSeven = {
		Items = {},
		Pos = {
			{x = 373.875,   y = 325.896,  z = 102.566},
			{x = 2557.458,  y = 382.282,  z = 107.622},
			{x = -3038.939, y = 585.954,  z = 6.908},
			{x = -3241.927, y = 1001.462, z = 11.830},
			{x = 547.431,   y = 2671.710, z = 41.156},
			{x = 1961.464,  y = 3740.672, z = 31.343},
			{x = 2678.916,  y = 3280.671, z = 54.241},
			{x = 1729.216,  y = 6414.131, z = 34.037}
		}
	},

	RobsLiquor = {
		Items = {},
		Pos = {
			{x = 1135.808,  y = -982.281,  z = 45.415},
			{x = -1222.915, y = -906.983,  z = 11.326},
			{x = -1487.553, y = -379.107,  z = 39.163},
			{x = -2968.243, y = 390.910,   z = 14.043},
			{x = 1166.024,  y = 2708.930,  z = 37.157},
			{x = 1392.562,  y = 3604.684,  z = 33.980},
		}
	},

	PrisonShop = {
		hideBlip = true,
		Items = {},
		Pos = {
			{x = 1786.65, y = 2484.54, z = -123.7},
		},
	},

	AmmuShop = {
		hideBlip = true,
		minJobGrade = 2,
		Items = {},
		Pos = {
			{x = 14.09,  y = -1110.2,  z = 28.8}
		},
	},
	
	BlackShop = {
		hideBlip = true,
		hideJobGrades = {
			'offpolice', 'offstate', 'offhasici', 'offambulance', 'offsheriff',
			'police', 'state', 'hasici', 'ambulance', 'sheriff'
		},
		Items = {},
		Pos = {
			{x = 125.83,  y = -1183.94,  z = 28.3}
		},
		Marker = {
			Size = {x = 1.8, y = 1.8, z = 0.1},
			Color = {r = 30, g = 21, b = 24},
		},
	},
	
	EMS = {
		hideBlip = true,
		jobGrades = {'offambulance', 'ambulance'},
		Items = {},
		Pos = {
			{x = 303.93,  y = -600.61,  z = 42.28}
		}
	},
	
	hasici = {
		hideBlip = true,
		jobGrades = {'offhasici', 'hasici'},
		Items = {},
		Pos = {
			{x = -1685.36,  y = 71.59,  z = 67.8}
		}
	},

	BallasBloodsShop = {
		hideBlip = true,
		jobGrades = {'ballas', 'cartel'},
		Items = {},
		Pos = {
			{x = 78.11, y = -1943.1, z = 19.88},
			{x = 1271.76, y = -1711.98, z = 53.77},
		},
	},
	
	PDshopJidlo = {
		hideBlip = true,
		jobGrades = {'police', 'offpolice', 'sheriff', 'offsheriff'},
		Items = {},
		Pos = {
			{x = 440.64,  y = -994.93,  z = 29.69},
			{x = 1852.48,  y = 3697.36,  z = 33.26},
			{x = -443.43, y = 6008.92, z = 30.72},
		}
	},

	pulyaShop = {
		hideBlip = true,
		jobGrades = {'pulya'},
		Items = {},
		Pos = {
			{x = 1391.71, y = 1164.3, z = 113.37},
		},
	},

	vanillaShop = {
		hideBlip = true,
		jobGrades = {'nnn'},
		Items = {},
		Pos = {
			{x = 97.08, y = -1291.77, z = 28.27},
		},
	},

	sheriffShop = {
		hideBlip = true,
		minJobGrade = 6,
		jobGrades = {'sheriff', 'offsheriff'},
		Items = {},
		Pos = {
			{x = 1843.62, y = 3691.17, z = 33.26},
			{x = -439.29, y = 6004.6, z = 30.72},
		},
	},

	vladashop = {
		hideBlip = true,
		jobGrades = {'state', 'offstate'},
		Items = {},
		Pos = {
			{x = -544.62,  y = -196.8,  z = 46.41}
		}
	},
		
	PDsef = {
		hideBlip = true,
		minJobGrade = 6,
		Items = {},
		Pos = {
			{x = 451.89,  y = -974.64,  z = 29.69},
			{x = 467.53,  y = -1009.32,  z = 34.93},
		}
	},

	LSSLShop = {
		jobGrades = {'state'},
		minJobGrade = 3,
		logUrl = 'https://discordapp.com/api/webhooks/713333767585923163/SHb3NaaRu4r5ldDWthM-907IV4S77B-LqiCMmeGqIoA511tE2dFvblWuydPoT80kq4xK',
		hideBlip = true,
		Items = {},
		Pos = {
			{x = -547.55, y = -181.05, z = 37.22},
		}
	},
	
	EMSsef = {
		hideBlip = true,
		minJobGrade = 10,
		Items = {},
		Pos = {
			{x = 339.48,  y = -594.83,  z = 42.28}
		}
	},

	Fireworks = {
		Items = {},
		Pos = {
			{x = 2726.56, y = 3488.41, z = 54.67}
		}
	},

	LTDgasoline = {
		Items = {},
		Pos = {
			{x = -48.519,   y = -1757.514, z = 28.421},
			{x = 1163.373,  y = -323.801,  z = 68.205},
			{x = -707.501,  y = -914.260,  z = 18.215},
			{x = -1820.523, y = 792.518,   z = 137.118},
			{x = 1698.388,  y = 4924.404,  z = 41.063}
		}
	}
}
