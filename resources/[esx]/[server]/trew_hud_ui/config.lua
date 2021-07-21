Config = {}

Config.Locale = 'cs'

Config.serverLogo = 'https://i.imgur.com/QFZOXFN.png'

Config.font = {
	name 	= 'Montserrat',
	url 	= 'https://fonts.googleapis.com/css?family=Montserrat:300,400,700,900&display=swap'
}

Config.ElectroCars = {
	'models',
	'ipace',
	'teslax',
	'ep9'
}

Config.date = {
	format	 	= 'default',
	AmPm		= false
}

Config.voice = {
	levels = {
		default = 5.0,
		shout = 12.0,
		whisper = 1.0,
		current = 0
	},
	
	keys = {
		distance 	= 'H',
	}
}

Config.vehicle = {
	speedUnit = 'KMH',
	maxSpeed = 420,

	keys = {
		seatbelt 	= 'B',
		cruiser		= 'CAPS',
		signalLeft	= 'LEFT',
		signalRight	= 'RIGHT',
		signalBoth	= 'DOWN',
	}
}

Config.ui = {
	showServerLogo			= false,

	showJob		 		= false,

	showWalletMoney 		= false,
	showBankMoney 			= false,
	showBlackMoney 			= false,
	showSocietyMoney		= true,

	showDate 			= false,
	showLocation 			= false,
	showVoice	 		= false,

	showHealth			= true,
	showArmor	 		= true,
	showStamina	 		= false,
	showHunger 			= true,
	showThirst	 		= true,

	showMinimap			= false,
	showWeapons			= false,	
}