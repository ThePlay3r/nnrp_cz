Config              = {}
Config.MarkerType   = 27
Config.DrawDistance = 70.0
Config.ZoneSize     = {x = 2.0, y = 2.0, z = 2.0}
Config.MarkerColor  = {r = 100, g = 204, b = 100}

Config.RequiredCopsCoke  = 2
Config.RequiredCopsMeth  = 2
Config.RequiredCopsWeed  = 2
Config.RequiredCopsOpium = 2
Config.RequiredCopsLsd = 2

Config.RequiredCopsCigar = 0

Config.TimeToFarm    = 6 * 1000
Config.TimeShort = 2 * 1000
Config.TimeToProcess = 6 * 1000
Config.TimeToSell    = 4 * 1000

Config.Locale = 'cs'

Config.Zones = {
	-- CokeField =			{x = 1651.69,	y = 4840.6,	z = 41.05,	name = _U('coke_field'),		sprite = 501,	color = 40},
	CokeProcessing =	{x = 1649.93,	y = 4844.11,		z = 41.05,	name = _U('coke_processing'),	sprite = 478,	color = 40},
	CokeDealer =		{x = 1808.04,	y = 3913.91,		z = 36.13,	name = _U('coke_dealer'),		sprite = 500,	color = 75},
	
	-- MethField =			{x = -54.68,	y = -2443.71,	z = 6.21,	name = _U('meth_field'),		sprite = 499,	color = 26},
	-- MethProcessing =	{x = -59.6,		y = -2440.04,	z = 6.21,	name = _U('meth_processing'),	sprite = 499,	color = 26},
	-- MethDealer =		{x = -1313.27, 	y = -257.63, 	z = 45.53,	name = _U('meth_dealer'),		sprite = 500,	color = 75},
	-- CrackField =			{x = 985.59,	y = -1717.05,	z = 31.1,	name = _U('meth_field'),		sprite = 499,	color = 26},
	-- CrackProcessing =	{x = 986.1,		y = -1723.48,	z = 31.12,	name = _U('meth_processing'),	sprite = 499,	color = 26},
	-- CrackDealer =		{x = 1808.42,	y = 3913.74,	z = 37.14,	name = _U('meth_dealer'),		sprite = 500,	color = 75},
	-- WeedField =			{x = -1569.49,	y = 4486.32,	z = 21.68,	name = _U('weed_field'),		sprite = 496,	color = 52},
	WeedProcessing =	{x = -1566.33,	y = 4484.13,	z = 21.60,	name = _U('weed_processing'),	sprite = 496,	color = 52},
	WeedDealer =		{x = 1375.95,	y = -701.9,		z = 66.30,	name = _U('weed_dealer'),		sprite = 500,	color = 75},
	
	CigarField = 		{x = 1995.74, 	y = 3046.42, 	z = 49.51, 	name = _U('cigar_field'), 		sprite = 496, 	color = 52, job = 'lost'},
	CigarProcessing = 	{x = 1982.5, 	y = 3028.0, 	z = 46.06, 	name = _U('cigar_processing'), sprite = 496, 	color = 52, job = 'lost'},
	CigarDealer = 		{x = -2961.55,	y = 376.42,	z = 14.02, 	name = _U('cigar_dealer'), 	sprite = 500, 	color = 75, job = 'lost'},

	LsdField = 			{x = 1333.23, 	y = 4316.86, 	z = 37.21, 	name = _U('lsd_field'), 		sprite = 496, 	color = 52},
	LsdProcessing = 	{x = 1329.1, 	y = 4318.3, 	z = 37.24, 	name = _U('lsd_processing'), sprite = 496, 	color = 52},
	LsdDealer = 		{x = 209.58, 	y = -95.99, 	z = 72.28, 	name = _U('lsd_dealer'), 	sprite = 500, 	color = 75},

--	OpiumField =		{x = 532.07,	y = 1900.11,	z = 33.5,	name = _U('opium_field'),		sprite = 51,	color = 60},
--	OpiumProcessing =	{x = 536.59,	y = 1895.85,	z = 33.55,	name = _U('opium_processing'),	sprite = 51,	color = 60},
--	OpiumDealer =		{x = 145.21,	y = -82.97,		z = 64.33,	name = _U('opium_dealer'),		sprite = 500,	color = 75}
}
