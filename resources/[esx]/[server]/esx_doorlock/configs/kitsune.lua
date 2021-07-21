Config.Keys['kitsune'] = {
	key_kitsune = {'PREDNIDVERE', 'ZADNIDVERE', 'KNIHOVNA'},
    remote_kitsune = {'BRANA'},
}

Config.DoorList['kitsune'] = {   
    BRANA = {
		textCoords = vector3(-135.29, 972.56, 235.88),
		locked = true,
		maxDistance = 18.0,
		doors = {
			{objHash = GetHashKey('prop_lrggate_01c_l'), objHeading = 335.54, objHeadingOpen = 70.4, objCoords = vector3(-137.7991, 973.7089, 236.1143)},
			{objHash = GetHashKey('prop_lrggate_01c_r'), objHeading = 336.54, objHeadingOpen = 244.4, objCoords = vector3(-132.7885, 971.5002, 236.1143)}
		}
	},
	PREDNIDVERE = {
		textCoords = vector3(-112.51, 986.18, 235.78),
		locked = true,
		maxDistance = 2.5,
		objHash = 1901183774,
		objHeading = 289.50885,
		objCoords = vector3(-112.217, 985.5247, 235.991)
	},
	ZADNIDVERE = {
		textCoords = vector3(-62.15, 998.77, 234.69),
		locked = true,
		maxDistance = 2.5,
		objHash = 1901183774,
		objHeading = 319.4655,
		objCoords = vector3(-61.77089, 998.0297, 234.736)
	},
	KNIHOVNA = {
		textCoords = vector3(-75.96, 994.72, 234.57),
		locked = true,
		hideAll = true,
		maxDistance = 2.5,
		objHash = -1364226422,
		objHeading = 140.53491,
		objCoords = vector3(-76.38983, 995.1635, 234.6799)
	},
}