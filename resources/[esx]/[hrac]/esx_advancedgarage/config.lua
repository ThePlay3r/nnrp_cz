Config = {}
Config.Locale = 'en'

Config.KickPossibleCheaters = true -- true = Kick Player that tries to Cheat Garage by changing Vehicle Hash/Plate.
Config.UseCustomKickMessage = true -- true = Sets Custom Kick Message for those that try to Cheat. Note: "Config.KickPossibleCheaters" must be true.

Config.UseDamageMult = true -- true = Costs more to Store a Broken/Damaged Vehicle.
Config.DamageMult = 5 -- Higher Number = Higher Repair Price.

Config.AircraftPoundPrice = 25000 -- How much it Costs to get Vehicle from Aircraft Pound.
Config.BoatPoundPrice = 5000 -- How much it Costs to get Vehicle from Boat Pound.
Config.CarPoundPrice = 5000 -- How much it Costs to get Vehicle from Car Pound.
Config.PolicingPoundPrice = 8000 -- How much it Costs to get Vehicle from Policing Pound.
Config.AmbulancePoundPrice = 8000 -- How much it Costs to get Vehicle from Ambulance Pound.

Config.ParkVehicles = true -- true = Automatically Park all Vehicles in Garage on Server/Script Restart | false = Opposite of true but players will have to go to Pound to get their Vehicle Back.

Config.UseAircraftGarages = false -- true = Allows use of Aircraft Garages.
Config.UseBoatGarages = false -- true = Allows use of Boat Garages.
Config.UseCarGarages = true -- true = Allows use of Car Garages.
Config.UsePrivateCarGarages = true -- true = Allows use of Private Car Garages.
Config.UseJobCarGarages = true -- true = Allows use of Job Garages.

Config.GiveSocietyMoney = true -- true = Gives money to society_mechanic. Note: REQUIRES esx_mechanicjob.
Config.DontShowPoundCarsInGarage = false -- true = Won't show Impounded Vehicles in Garage.
Config.ShowVehicleLocation = true -- true = Will show Location of the Vehicle in the Garage Menu.
Config.UseVehicleNamesLua = true -- true = Use a vehicle_names.lua for Addon Vehicles.

Config.ShowGarageSpacer1 = true -- true = Shows spacer1 in Garage Menu.
Config.ShowGarageSpacer2 = false -- true = Shows spacer2 in Garage Menu. Note: Don't use if "Config.ShowGarageSpacer3 = true".
Config.ShowGarageSpacer3 = false -- true = Shows spacer3 in Garage Menu. Note: Don't use if "Config.ShowGarageSpacer2 = true".

Config.ShowPoundSpacer2 = false -- true = Shows spacer2 in Pound Menu. Note: Don't use if "Config.ShowPoundSpacer3 = true".
Config.ShowPoundSpacer3 = true -- true = Shows spacer3 in Pound Menu. Note: Don't use if "Config.ShowPoundSpacer2 = true".

Config.MarkerType   = 1
Config.DrawDistance = 100

Config.BlipGarage = {
	Sprite = 290,
	Color = 38,
	Display = 2,
	Scale = 1.0
}

Config.BlipGaragePrivate = {
	Sprite = 290,
	Color = 53,
	Display = 2,
	Scale = 1.0
}

Config.BlipPound = {
	Sprite = 67,
	Color = 64,
	Display = 2,
	Scale = 1.0
}

Config.BlipJobPound = {
	Sprite = 67,
	Color = 49,
	Display = 2,
	Scale = 1.0
}

Config.PointMarker = {
	r = 0, g = 255, b = 0,     -- Green Color
	x = 1.5, y = 1.5, z = 1.0  -- Standard Size Circle
}

Config.DeleteMarker = {
	r = 255, g = 0, b = 0,     -- Red Color
	x = 5.0, y = 5.0, z = 1.0  -- Big Size Circle
}

Config.PoundMarker = {
	r = 0, g = 0, b = 100,     -- Blue Color
	x = 1.5, y = 1.5, z = 1.0  -- Standard Size Circle
}

Config.JobPoundMarker = {
	r = 255, g = 0, b = 0,     -- Red Color
	x = 1.5, y = 1.5, z = 1.0  -- Standard Size Circle
}

-- Start of Jobs

Config.PolicePounds = {
	Pound_LosSantos = {
		PoundPoint = { x = 374.42, y = -1620.68, z = 28.29 },
		SpawnPoint = { x = 391.74, y = -1619.0, z = 28.29, h = 318.34 }
	},
	Pound_Sandy = {
		PoundPoint = { x = 1646.01, y = 3812.06, z = 37.65 },
		SpawnPoint = { x = 1627.84, y = 3788.45, z = 33.77, h = 308.53 }
	},
	Pound_Paleto = {
		PoundPoint = { x = -223.6, y = 6243.37, z = 30.49 },
		SpawnPoint = { x = -230.88, y = 6255.89, z = 30.49, h = 136.5 }
	}
}

Config.AmbulancePounds = {
	Pound_LosSantos = {
		PoundPoint = { x = 374.42, y = -1620.68, z = 28.29 },
		SpawnPoint = { x = 391.74, y = -1619.0, z = 28.29, h = 318.34 }
	},
	Pound_Sandy = {
		PoundPoint = { x = 1646.01, y = 3812.06, z = 37.65 },
		SpawnPoint = { x = 1627.84, y = 3788.45, z = 33.77, h = 308.53 }
	},
	Pound_Paleto = {
		PoundPoint = { x = -223.6, y = 6243.37, z = 30.49 },
		SpawnPoint = { x = -230.88, y = 6255.89, z = 30.49, h = 136.5 }
	}
}

-- End of Jobs
-- Start of Cars

Config.CarGarages = {
	Garage_CentralLS = {
		GaragePoint = { x = 219.47, y = -811.48, z = 29.727 },
		SpawnPoint = { x = 229.700, y = -800.1149, z = 29.5722, h = 157.84 },
		DeletePoint = { x = 223.797, y = -760.415, z = 29.646 }
	},
	Garage_Sandy = {
		GaragePoint = { x = 1737.59, y = 3710.2, z = 33.14 },
		SpawnPoint = { x = 1737.84, y = 3719.28, z = 33.04, h = 21.22 },
		DeletePoint = { x = 1722.66, y = 3713.74, z = 33.21 }
	},
	Garage_Paleto = {
		GaragePoint = { x = 105.359, y = 6613.586, z = 31.3973 },
		SpawnPoint = { x = 128.7822, y = 6622.9965, z = 30.7828, h = 315.01 },
		DeletePoint = { x = 126.3572, y = 6608.4150, z = 30.8565 }
	},
	
	Garage_plaz = {
		GaragePoint = { x = -1996.73, y = -492.12, z = 10.48 },
		SpawnPoint = { x = -2009.29, y = -475.0, z = 10.53, h = 51.63 },
		DeletePoint = { x = -1991.74, y = -487.22, z = 10.58 }
	},
	
	Garage_Prison = {
		GaragePoint = { x = 1846.56, y = 2585.86, z = 44.67 },
		SpawnPoint = { x = 1855.11, y = 2592.72, z = 44.67, h = 274.8 },
		DeletePoint = { x = 1855.21, y = 2615.3, z = 34.67 } -- z = 44.67
	},
	
	Garage_RaceTrack = {
		GaragePoint = { x = 1212.32, y = 339.94, z = 80.99 },
		SpawnPoint = { x = 1199.02, y = 330.92, z = 80.99, h = 144.86 },
		DeletePoint = { x = 1207.9, y = 343.8, z = 80.99 }
	},

	Garage_GYM = {
		GaragePoint = { x = -1197.64, y = -1497.1, z = 3.36 },
		SpawnPoint = { x = -1193.29, y = -1491.28, z = 4.38, h = 214.68 },
		DeletePoint = { x = -1193.48, y = -1499.9, z = 3.37 }
	},

	Garage_SPECKY = {
		GaragePoint = { x = -941.47, y = -182.46, z = 40.88 },
		SpawnPoint = { x = -939.88, y = -173.81, z = 41.88, h = 112.17 },
		DeletePoint = { x = -935.67, y = -176.52, z = 40.88 }
	},
	Garage_DRAG = {
		GaragePoint = { x = 1728.64, y = 3290.78, z = 40.17 },
		SpawnPoint = { x = 1736.19, y = 3289.59, z = 41.14, h = 178.55 },
		DeletePoint = { x = 1734.64, y = 3298.14, z = 40.22 }
	},

	-- Garage_RALLY = {
	-- 	GaragePoint = { x = -14.26, y = 2823.52, z = 55.3 },
	-- 	SpawnPoint = { x = -23.18, y = 2826.4, z = 55.16, h = 290.85 },
	-- 	DeletePoint = { x = -21.66, y = 2824.28, z = 55.17 }
	-- },
}

Config.CarPounds = {
	Pound_LosSantos = {
		PoundPoint = { x = 408.61, y = -1625.47, z = 28.29 },
		SpawnPoint = { x = 405.64, y = -1643.4, z = 27.61, h = 229.54 }
	},
	Pound_Sandy = {
		PoundPoint = { x = 1651.38, y = 3804.84, z = 37.65 },
		SpawnPoint = { x = 1627.84, y = 3788.45, z = 33.77, h = 308.53 }
	},
	Pound_Paleto = {
		PoundPoint = { x = -234.82, y = 6198.65, z = 30.94 },
		SpawnPoint = { x = -230.08, y = 6190.24, z = 30.49, h = 140.24 }
	}
}

-- End of Cars
-- Start of Boats

Config.BoatGarages = {
	Garage_LSDock = {
		GaragePoint = { x = -735.87, y = -1325.08, z = 0.6 },
		SpawnPoint = { x = -718.87, y = -1320.18, z = -0.47477427124977, h = 45.0 },
		DeletePoint = { x = -731.15, y = -1334.71, z = -0.47477427124977 }
	},
	Garage_SandyDock = {
		GaragePoint = { x = 1333.2, y = 4269.92, z = 30.5 },
		SpawnPoint = { x = 1334.61, y = 4264.68, z = 29.86, h = 87.0 },
		DeletePoint = { x = 1323.73, y = 4269.94, z = 29.86 }
	},
	Garage_PaletoDock = {
		GaragePoint = { x = -283.74, y = 6629.51, z = 6.3 },
		SpawnPoint = { x = -290.46, y = 6622.72, z = -0.47477427124977, h = 52.0 },
		DeletePoint = { x = -304.66, y = 6607.36, z = -0.47477427124977 }
	}
}

Config.BoatPounds = {
	Pound_LSDock = {
		PoundPoint = { x = -738.67, y = -1400.43, z = 4.0 },
		SpawnPoint = { x = -738.33, y = -1381.51, z = 0.12, h = 137.85 }
	},
	Pound_SandyDock = {
		PoundPoint = { x = 1299.36, y = 4217.93, z = 32.91 },
		SpawnPoint = { x = 1294.35, y = 4226.31, z = 29.86, h = 345.0 }
	},
	Pound_PaletoDock = {
		PoundPoint = { x = -270.2, y = 6642.43, z = 6.36 },
		SpawnPoint = { x = -290.38, y = 6638.54, z = -0.47477427124977, h = 130.0 }
	}
}

-- End of Boats
-- Start of Aircrafts

Config.AircraftGarages = {
	Garage_LSAirport = {
		GaragePoint = { x = -1617.14, y = -3145.52, z = 12.99 },
		SpawnPoint = { x = -1657.99, y = -3134.38, z = 12.99, h = 330.11 },
		DeletePoint = { x = -1642.12, y = -3144.25, z = 12.99 }
	},
	Garage_SandyAirport = {
		GaragePoint = { x = 1723.84, y = 3288.29, z = 40.16 },
		SpawnPoint = { x = 1710.85, y = 3259.06, z = 40.69, h = 104.66 },
		DeletePoint = { x = 1714.45, y = 3246.75, z = 40.07 }
	},
	Garage_GrapeseedAirport = {
		GaragePoint = { x = 2152.83, y = 4797.03, z = 40.19 },
		SpawnPoint = { x = 2122.72, y = 4804.85, z = 40.78, h = 115.04 },
		DeletePoint = { x = 2082.36, y = 4806.06, z = 40.07 }
	}
}

Config.AircraftPounds = {
	Pound_LSAirport = {
		PoundPoint = { x = -1243.0, y = -3391.92, z = 12.94 },
		SpawnPoint = { x = -1272.27, y = -3382.46, z = 12.94, h = 330.25 }
	}
}

-- End of Aircrafts
-- Start of Private Garages

Config.PrivateCarGarages = {
	-- Maze Bank Building Garages
	Garage_MazeBankBuilding = {
		Private = "MazeBankBuilding",
		GaragePoint = { x = -60.38, y = -790.31, z = 43.23 },
		SpawnPoint = { x = -44.031, y = -787.363, z = 43.186, h = 254.322 },
		DeletePoint = { x = -58.88, y = -778.625, z = 43.175 }
	},
	Garage_OldSpiceWarm = {
		Private = "OldSpiceWarm",
		GaragePoint = { x = -60.38, y = -790.31, z = 43.23 },
		SpawnPoint = { x = -44.031, y = -787.363, z = 43.186, h = 254.322 },
		DeletePoint = { x = -58.88, y = -778.625, z = 43.175 }
	},
	Garage_OldSpiceClassical = {
		Private = "OldSpiceClassical",
		GaragePoint = { x = -60.38, y = -790.31, z = 43.23 },
		SpawnPoint = { x = -44.031, y = -787.363, z = 43.186, h = 254.322 },
		DeletePoint = { x = -58.88, y = -778.625, z = 43.175 }
	},
	Garage_race = {
		GaragePoint = { x = 2438.17, y = 3015.94, z = 545.3 },
		SpawnPoint = { x = 2444.23, y = 3024.43, z = 545.3, h = 301.3 },
		DeletePoint = { x = 2428.07, y = 3009.43, z = 545.3 } -- z = 44.67
	},
	Garage_zahradnik = {
		GaragePoint = { x = -1160.82, y = -226.99, z = 36.94 },
		SpawnPoint = { x = -1152.07, y = -222.59, z = 36.92, h = 225.09 },
		DeletePoint = { x = -1140.42, y = -218.75, z = 36.94 } -- z = 44.67
	},
	Garage_trucker = {
		GaragePoint = { x = 206.69, y = 2787.69, z = 44.66 },
		SpawnPoint = { x = 194.33, y = 2786.75, z = 44.66, h = 9.59 },
		DeletePoint = { x = 204.8, y = 2799.25, z = 44.66 } -- z = 44.67
	},
	Garage_LSPD = {
		GaragePoint = { x = 447.03, y = -995.6, z = 24.78 },
		SpawnPoint = { x = 447.27, y = -1012.68, z = 27.51, h = 185.75 },
		DeletePoint = { x = 452.75, y = -996.12, z = 24.78 }
	},
	Garage_Ems = {
		GaragePoint = { x = 315.25, y = -547.9, z = 27.74 },
		SpawnPoint = { x = 315.46, y = -551.11, z = 27.74, h = 280.27 },
		DeletePoint = { x = 316.07, y = -540.6, z = 27.74 }
	},
	Garage_OldSpiceVintage = {
		Private = "OldSpiceVintage",
		GaragePoint = { x = -60.38, y = -790.31, z = 43.23 },
		SpawnPoint = { x = -44.031, y = -787.363, z = 43.186, h = 254.322 },
		DeletePoint = { x = -58.88, y = -778.625, z = 43.175 }
	},
	Garage_ExecutiveRich = {
		Private = "ExecutiveRich",
		GaragePoint = { x = -60.38, y = -790.31, z = 43.23 },
		SpawnPoint = { x = -44.031, y = -787.363, z = 43.186, h = 254.322 },
		DeletePoint = { x = -58.88, y = -778.625, z = 43.175 }
	},
	Garage_ExecutiveCool = {
		Private = "ExecutiveCool",
		GaragePoint = { x = -60.38, y = -790.31, z = 43.23 },
		SpawnPoint = { x = -44.031, y = -787.363, z = 43.186, h = 254.322 },
		DeletePoint = { x = -58.88, y = -778.625, z = 43.175 }
	},
	Garage_ExecutiveContrast = {
		Private = "ExecutiveContrast",
		GaragePoint = { x = -60.38, y = -790.31, z = 43.23 },
		SpawnPoint = { x = -44.031, y = -787.363, z = 43.186, h = 254.322 },
		DeletePoint = { x = -58.88, y = -778.625, z = 43.175 }
	},
	Garage_PowerBrokerIce = {
		Private = "PowerBrokerIce",
		GaragePoint = { x = -60.38, y = -790.31, z = 43.23 },
		SpawnPoint = { x = -44.031, y = -787.363, z = 43.186, h = 254.322 },
		DeletePoint = { x = -58.88, y = -778.625, z = 43.175 }
	},
	Garage_PowerBrokerConservative = {
		Private = "PowerBrokerConservative",
		GaragePoint = { x = -60.38, y = -790.31, z = 43.23 },
		SpawnPoint = { x = -44.031, y = -787.363, z = 43.186, h = 254.322 },
		DeletePoint = { x = -58.88, y = -778.625, z = 43.175 }
	},
	Garage_PowerBrokerPolished = {
		Private = "PowerBrokerPolished",
		GaragePoint = { x = -60.38, y = -790.31, z = 43.23 },
		SpawnPoint = { x = -44.031, y = -787.363, z = 43.186, h = 254.322 },
		DeletePoint = { x = -58.88, y = -778.625, z = 43.175 }
	},
	-- End of Maze Bank Building Garages
	-- Start of Lom Bank Garages
	Garage_LomBank = {
		Private = "LomBank",
		GaragePoint = { x = -1545.17, y = -566.24, z = 24.85 },
		SpawnPoint = { x = -1551.88, y = -581.383, z = 24.708, h = 331.176 },
		DeletePoint = { x = -1538.564, y = -576.049, z = 24.708 }
	},
	Garage_LBOldSpiceWarm = {
		Private = "LBOldSpiceWarm",
		GaragePoint = { x = -1545.17, y = -566.24, z = 24.85 },
		SpawnPoint = { x = -1551.88, y = -581.383, z = 24.708, h = 331.176 },
		DeletePoint = { x = -1538.564, y = -576.049, z = 24.708 }
	},
	Garage_LBOldSpiceClassical = {
		Private = "LBOldSpiceClassical",
		GaragePoint = { x = -1545.17, y = -566.24, z = 24.85 },
		SpawnPoint = { x = -1551.88, y = -581.383, z = 24.708, h = 331.176 },
		DeletePoint = { x = -1538.564, y = -576.049, z = 24.708 }
	},
	Garage_LBOldSpiceVintage = {
		Private = "LBOldSpiceVintage",
		GaragePoint = { x = -1545.17, y = -566.24, z = 24.85 },
		SpawnPoint = { x = -1551.88, y = -581.383, z = 24.708, h = 331.176 },
		DeletePoint = { x = -1538.564, y = -576.049, z = 24.708 }
	},
	Garage_LBExecutiveRich = {
		Private = "LBExecutiveRich",
		GaragePoint = { x = -1545.17, y = -566.24, z = 24.85 },
		SpawnPoint = { x = -1551.88, y = -581.383, z = 24.708, h = 331.176 },
		DeletePoint = { x = -1538.564, y = -576.049, z = 24.708 }
	},
	Garage_LBExecutiveCool = {
		Private = "LBExecutiveCool",
		GaragePoint = { x = -1545.17, y = -566.24, z = 24.85 },
		SpawnPoint = { x = -1551.88, y = -581.383, z = 24.708, h = 331.176 },
		DeletePoint = { x = -1538.564, y = -576.049, z = 24.708 }
	},
	Garage_LBExecutiveContrast = {
		Private = "LBExecutiveContrast",
		GaragePoint = { x = -1545.17, y = -566.24, z = 24.85 },
		SpawnPoint = { x = -1551.88, y = -581.383, z = 24.708, h = 331.176 },
		DeletePoint = { x = -1538.564, y = -576.049, z = 24.708 }
	},
	Garage_LBPowerBrokerIce = {
		Private = "LBPowerBrokerIce",
		GaragePoint = { x = -1545.17, y = -566.24, z = 24.85 },
		SpawnPoint = { x = -1551.88, y = -581.383, z = 24.708, h = 331.176 },
		DeletePoint = { x = -1538.564, y = -576.049, z = 24.708 }
	},
	Garage_LBPowerBrokerConservative = {
		Private = "LBPowerBrokerConservative",
		GaragePoint = { x = -1545.17, y = -566.24, z = 24.85 },
		SpawnPoint = { x = -1551.88, y = -581.383, z = 24.708, h = 331.176 },
		DeletePoint = { x = -1538.564, y = -576.049, z = 24.708 }
	},
	Garage_LBPowerBrokerPolished = {
		Private = "LBPowerBrokerPolished",
		GaragePoint = { x = -1545.17, y = -566.24, z = 24.85 },
		SpawnPoint = { x = -1551.88, y = -581.383, z = 24.708, h = 331.176 },
		DeletePoint = { x = -1538.564, y = -576.049, z = 24.708 }
	},
	-- End of Lom Bank Garages
	-- Start of Maze Bank West Garages
	Garage_MazeBankWest = {
		Private = "MazeBankWest",
		GaragePoint = { x = -1368.14, y = -468.01, z = 30.6 },
		SpawnPoint = { x = -1376.93, y = -474.32, z = 30.5, h = 97.95 },
		DeletePoint = { x = -1362.065, y = -471.982, z = 30.5 }
	},
	Garage_MBWOldSpiceWarm = {
		Private = "MBWOldSpiceWarm",
		GaragePoint = { x = -1368.14, y = -468.01, z = 30.6 },
		SpawnPoint = { x = -1376.93, y = -474.32, z = 30.5, h = 97.95 },
		DeletePoint = { x = -1362.065, y = -471.982, z = 30.5 }
	},
	Garage_MBWOldSpiceClassical = {
		Private = "MBWOldSpiceClassical",
		GaragePoint = { x = -1368.14, y = -468.01, z = 30.6 },
		SpawnPoint = { x = -1376.93, y = -474.32, z = 30.5, h = 97.95 },
		DeletePoint = { x = -1362.065, y = -471.982, z = 30.5 }
	},
	Garage_MBWOldSpiceVintage = {
		Private = "MBWOldSpiceVintage",
		GaragePoint = { x = -1368.14, y = -468.01, z = 30.6 },
		SpawnPoint = { x = -1376.93, y = -474.32, z = 30.5, h = 97.95 },
		DeletePoint = { x = -1362.065, y = -471.982, z = 30.5 }
	},
	Garage_MBWExecutiveRich = {
		Private = "MBWExecutiveRich",
		GaragePoint = { x = -1368.14, y = -468.01, z = 30.6 },
		SpawnPoint = { x = -1376.93, y = -474.32, z = 30.5, h = 97.95 },
		DeletePoint = { x = -1362.065, y = -471.982, z = 30.5 }
	},
	Garage_MBWExecutiveCool = {
		Private = "MBWExecutiveCool",
		GaragePoint = { x = -1368.14, y = -468.01, z = 30.6 },
		SpawnPoint = { x = -1376.93, y = -474.32, z = 30.5, h = 97.95 },
		DeletePoint = { x = -1362.065, y = -471.982, z = 30.5 }
	},
	Garage_MBWExecutiveContrast = {
		Private = "MBWExecutiveContrast",
		GaragePoint = { x = -1368.14, y = -468.01, z = 30.6 },
		SpawnPoint = { x = -1376.93, y = -474.32, z = 30.5, h = 97.95 },
		DeletePoint = { x = -1362.065, y = -471.982, z = 30.5 }
	},
	Garage_MBWPowerBrokerIce = {
		Private = "MBWPowerBrokerIce",
		GaragePoint = { x = -1368.14, y = -468.01, z = 30.6 },
		SpawnPoint = { x = -1376.93, y = -474.32, z = 30.5, h = 97.95 },
		DeletePoint = { x = -1362.065, y = -471.982, z = 30.5 }
	},
	Garage_MBWPowerBrokerConvservative = {
		Private = "MBWPowerBrokerConvservative",
		GaragePoint = { x = -1368.14, y = -468.01, z = 30.6 },
		SpawnPoint = { x = -1376.93, y = -474.32, z = 30.5, h = 97.95 },
		DeletePoint = { x = -1362.065, y = -471.982, z = 30.5 }
	},
	Garage_MBWPowerBrokerPolished = {
		Private = "MBWPowerBrokerPolished",
		GaragePoint = { x = -1368.14, y = -468.01, z = 30.6 },
		SpawnPoint = { x = -1376.93, y = -474.32, z = 30.5, h = 97.95 },
		DeletePoint = { x = -1362.065, y = -471.982, z = 30.5 }
	},
	-- End of Maze Bank West Garages
	-- Start of Intergrity Way Garages
	Garage_IntegrityWay = {
		Private = "IntegrityWay",
		GaragePoint = { x = -14.1, y = -614.93, z = 34.86 },
		SpawnPoint = { x = -7.351, y = -635.1, z = 34.724, h = 66.632 },
		DeletePoint = { x = -37.575, y = -620.391, z = 34.073 }
	},
	Garage_IntegrityWay28 = {
		Private = "IntegrityWay28",
		GaragePoint = { x = -14.1, y = -614.93, z = 34.86 },
		SpawnPoint = { x = -7.351, y = -635.1, z = 34.724, h = 66.632 },
		DeletePoint = { x = -37.575, y = -620.391, z = 34.073 }
	},
	Garage_IntegrityWay30 = {
		Private = "IntegrityWay30",
		GaragePoint = { x = -14.1, y = -614.93, z = 34.86 },
		SpawnPoint = { x = -7.351, y = -635.1, z = 34.724, h = 66.632 },
		DeletePoint = { x = -37.575, y = -620.391, z = 34.073 }
	},
	-- End of Intergrity Way Garages
	-- Start of Dell Perro Heights Garages
	Garage_DellPerroHeights = {
		Private = "DellPerroHeights",
		GaragePoint = { x = -1477.15, y = -517.17, z = 33.74 },
		SpawnPoint = { x = -1483.16, y = -505.1, z = 31.81, h = 299.89 },
		DeletePoint = { x = -1452.612, y = -508.782, z = 30.582 }
	},
	Garage_DellPerroHeightst4 = {
		Private = "DellPerroHeightst4",
		GaragePoint = { x = -1477.15, y = -517.17, z = 33.74 },
		SpawnPoint = { x = -1483.16, y = -505.1, z = 31.81, h = 299.89 },
		DeletePoint = { x = -1452.612, y = -508.782, z = 30.582 }
	},
	Garage_DellPerroHeightst7 = {
		Private = "DellPerroHeightst7",
		GaragePoint = { x = -1477.15, y = -517.17, z = 33.74 },
		SpawnPoint = { x = -1483.16, y = -505.1, z = 31.81, h = 299.89 },
		DeletePoint = { x = -1452.612, y = -508.782, z = 30.582 }
	},
	-- End of Dell Perro Heights Garages
	-- Start of Milton Drive Garages
	Garage_MiltonDrive = {
		Private = "MiltonDrive",
		GaragePoint = { x = -795.96, y = 331.83, z = 84.5 },
		SpawnPoint = { x = -800.496, y = 333.468, z = 84.5, h = 180.494 },
		DeletePoint = { x = -791.755, y = 333.468, z = 84.5 }
	},
	Garage_Modern1Apartment = {
		Private = "Modern1Apartment",
		GaragePoint = { x = -795.96, y = 331.83, z = 84.5 },
		SpawnPoint = { x = -800.496, y = 333.468, z = 84.5, h = 180.494 },
		DeletePoint = { x = -791.755, y = 333.468, z = 84.5 }
	},
	Garage_Modern2Apartment = {
		Private = "Modern2Apartment",
		GaragePoint = { x = -795.96, y = 331.83, z = 84.5 },
		SpawnPoint = { x = -800.496, y = 333.468, z = 84.5, h = 180.494 },
		DeletePoint = { x = -791.755, y = 333.468, z = 84.5 }
	},
	Garage_Modern3Apartment = {
		Private = "Modern3Apartment",
		GaragePoint = { x = -795.96, y = 331.83, z = 84.5 },
		SpawnPoint = { x = -800.496, y = 333.468, z = 84.5, h = 180.494 },
		DeletePoint = { x = -791.755, y = 333.468, z = 84.5 }
	},
	Garage_Mody1Apartment = {
		Private = "Mody1Apartment",
		GaragePoint = { x = -795.96, y = 331.83, z = 84.5 },
		SpawnPoint = { x = -800.496, y = 333.468, z = 84.5, h = 180.494 },
		DeletePoint = { x = -791.755, y = 333.468, z = 84.5 }
	},
	Garage_Mody2Apartment = {
		Private = "Mody2Apartment",
		GaragePoint = { x = -795.96, y = 331.83, z = 84.5 },
		SpawnPoint = { x = -800.496, y = 333.468, z = 84.5, h = 180.494 },
		DeletePoint = { x = -791.755, y = 333.468, z = 84.5 }
	},
	Garage_Mody3Apartment = {
		Private = "Mody3Apartment",
		GaragePoint = { x = -795.96, y = 331.83, z = 84.5 },
		SpawnPoint = { x = -800.496, y = 333.468, z = 84.5, h = 180.494 },
		DeletePoint = { x = -791.755, y = 333.468, z = 84.5 }
	},
	Garage_Vibrant1Apartment = {
		Private = "Vibrant1Apartment",
		GaragePoint = { x = -795.96, y = 331.83, z = 84.5 },
		SpawnPoint = { x = -800.496, y = 333.468, z = 84.5, h = 180.494 },
		DeletePoint = { x = -791.755, y = 333.468, z = 84.5 }
	},
	Garage_Vibrant2Apartment = {
		Private = "Vibrant2Apartment",
		GaragePoint = { x = -795.96, y = 331.83, z = 84.5 },
		SpawnPoint = { x = -800.496, y = 333.468, z = 84.5, h = 180.494 },
		DeletePoint = { x = -791.755, y = 333.468, z = 84.5 }
	},
	Garage_Vibrant3Apartment = {
		Private = "Vibrant3Apartment",
		GaragePoint = { x = -795.96, y = 331.83, z = 84.5 },
		SpawnPoint = { x = -800.496, y = 333.468, z = 84.5, h = 180.494 },
		DeletePoint = { x = -791.755, y = 333.468, z = 84.5 }
	},
	Garage_Sharp1Apartment = {
		Private = "Sharp1Apartment",
		GaragePoint = { x = -795.96, y = 331.83, z = 84.5 },
		SpawnPoint = { x = -800.496, y = 333.468, z = 84.5, h = 180.494 },
		DeletePoint = { x = -791.755, y = 333.468, z = 84.5 }
	},
	Garage_Sharp2Apartment = {
		Private = "Sharp2Apartment",
		GaragePoint = { x = -795.96, y = 331.83, z = 84.5 },
		SpawnPoint = { x = -800.496, y = 333.468, z = 84.5, h = 180.494 },
		DeletePoint = { x = -791.755, y = 333.468, z = 84.5 }
	},
	Garage_Sharp3Apartment = {
		Private = "Sharp3Apartment",
		GaragePoint = { x = -795.96, y = 331.83, z = 84.5 },
		SpawnPoint = { x = -800.496, y = 333.468, z = 84.5, h = 180.494 },
		DeletePoint = { x = -791.755, y = 333.468, z = 84.5 }
	},
	Garage_Monochrome1Apartment = {
		Private = "Monochrome1Apartment",
		GaragePoint = { x = -795.96, y = 331.83, z = 84.5 },
		SpawnPoint = { x = -800.496, y = 333.468, z = 84.5, h = 180.494 },
		DeletePoint = { x = -791.755, y = 333.468, z = 84.5 }
	},
	Garage_Monochrome2Apartment = {
		Private = "Monochrome2Apartment",
		GaragePoint = { x = -795.96, y = 331.83, z = 84.5 },
		SpawnPoint = { x = -800.496, y = 333.468, z = 84.5, h = 180.494 },
		DeletePoint = { x = -791.755, y = 333.468, z = 84.5 }
	},
	Garage_Monochrome3Apartment = {
		Private = "Monochrome3Apartment",
		GaragePoint = { x = -795.96, y = 331.83, z = 84.5 },
		SpawnPoint = { x = -800.496, y = 333.468, z = 84.5, h = 180.494 },
		DeletePoint = { x = -791.755, y = 333.468, z = 84.5 }
	},
	Garage_Seductive1Apartment = {
		Private = "Seductive1Apartment",
		GaragePoint = { x = -795.96, y = 331.83, z = 84.5 },
		SpawnPoint = { x = -800.496, y = 333.468, z = 84.5, h = 180.494 },
		DeletePoint = { x = -791.755, y = 333.468, z = 84.5 }
	},
	Garage_Seductive2Apartment = {
		Private = "Seductive2Apartment",
		GaragePoint = { x = -795.96, y = 331.83, z = 84.5 },
		SpawnPoint = { x = -800.496, y = 333.468, z = 84.5, h = 180.494 },
		DeletePoint = { x = -791.755, y = 333.468, z = 84.5 }
	},
	Garage_Seductive3Apartment = {
		Private = "Seductive3Apartment",
		GaragePoint = { x = -795.96, y = 331.83, z = 84.5 },
		SpawnPoint = { x = -800.496, y = 333.468, z = 84.5, h = 180.494 },
		DeletePoint = { x = -791.755, y = 333.468, z = 84.5 }
	},
	Garage_Regal1Apartment = {
		Private = "Regal1Apartment",
		GaragePoint = { x = -795.96, y = 331.83, z = 84.5 },
		SpawnPoint = { x = -800.496, y = 333.468, z = 84.5, h = 180.494 },
		DeletePoint = { x = -791.755, y = 333.468, z = 84.5 }
	},
	Garage_Regal2Apartment = {
		Private = "Regal2Apartment",
		GaragePoint = { x = -795.96, y = 331.83, z = 84.5 },
		SpawnPoint = { x = -800.496, y = 333.468, z = 84.5, h = 180.494 },
		DeletePoint = { x = -791.755, y = 333.468, z = 84.5 }
	},
	Garage_Regal3Apartment = {
		Private = "Regal3Apartment",
		GaragePoint = { x = -795.96, y = 331.83, z = 84.5 },
		SpawnPoint = { x = -800.496, y = 333.468, z = 84.5, h = 180.494 },
		DeletePoint = { x = -791.755, y = 333.468, z = 84.5 }
	},
	Garage_Aqua1Apartment = {
		Private = "Aqua1Apartment",
		GaragePoint = { x = -795.96, y = 331.83, z = 84.5 },
		SpawnPoint = { x = -800.496, y = 333.468, z = 84.5, h = 180.494 },
		DeletePoint = { x = -791.755, y = 333.468, z = 84.5 }
	},
	Garage_Aqua2Apartment = {
		Private = "Aqua2Apartment",
		GaragePoint = { x = -795.96, y = 331.83, z = 84.5 },
		SpawnPoint = { x = -800.496, y = 333.468, z = 84.5, h = 180.494 },
		DeletePoint = { x = -791.755, y = 333.468, z = 84.5 }
	},
	Garage_Aqua3Apartment = {
		Private = "Aqua3Apartment",
		GaragePoint = { x = -795.96, y = 331.83, z = 84.5 },
		SpawnPoint = { x = -800.496, y = 333.468, z = 84.5, h = 180.494 },
		DeletePoint = { x = -791.755, y = 333.468, z = 84.5 }
	},
	-- End of Milton Drive Garages
	-- Start of Single Garages
	Garage_RichardMajesticApt2 = {
		Private = "RichardMajesticApt2",
		GaragePoint = { x = -887.5, y = -349.58, z = 33.534 },
		SpawnPoint = { x = -886.03, y = -343.78, z = 33.534, h = 206.79 },
		DeletePoint = { x = -894.324, y = -349.326, z = 33.534 }
	},
	Garage_WildOatsDrive = {
		Private = "WildOatsDrive",
		GaragePoint = { x = -178.65, y = 503.45, z = 135.85 },
		SpawnPoint = { x = -189.98, y = 505.8, z = 133.48, h = 282.62 },
		DeletePoint = { x = -189.28, y = 500.56, z = 132.93 }
	},
	Garage_WhispymoundDrive = {
		Private = "WhispymoundDrive",
		GaragePoint = { x = 123.65, y = 565.75, z = 183.04 },
		SpawnPoint = { x = 130.11, y = 571.47, z = 182.42, h = 270.71 },
		DeletePoint = { x = 131.97, y = 566.77, z = 181.95 }
	},
	Garage_NorthConkerAvenue2044 = {
		Private = "NorthConkerAvenue2044",
		GaragePoint = { x = 348.18, y = 443.01, z = 146.7 },
		SpawnPoint = { x = 358.397, y = 437.064, z = 144.277, h = 285.911 },
		DeletePoint = { x = 351.383, y = 438.865, z = 145.66 }
	},
	Garage_NorthConkerAvenue2045 = {
		Private = "NorthConkerAvenue2045",
		GaragePoint = { x = 370.69, y = 430.76, z = 144.11 },
		SpawnPoint = { x = 392.88, y = 434.54, z = 142.17, h = 264.94 },
		DeletePoint = { x = 389.72, y = 429.95, z = 141.81 }
	},
	Garage_HillcrestAvenue2862 = {
		Private = "HillcrestAvenue2862",
		GaragePoint = { x = -688.71, y = 597.57, z = 142.64 },
		SpawnPoint = { x = -683.72, y = 609.88, z = 143.28, h = 338.06 },
		DeletePoint = { x = -685.259, y = 601.083, z = 142.365 }
	},
	Garage_HillcrestAvenue2868 = {
		Private = "HillcrestAvenue2868",
		GaragePoint = { x = -752.753, y = 624.901, z = 141.2 },
		SpawnPoint = { x = -749.32, y = 628.61, z = 141.48, h = 197.14 },
		DeletePoint = { x = -754.286, y = 631.581, z = 141.2 }
	},
	Garage_HillcrestAvenue2874 = {
		Private = "HillcrestAvenue2874",
		GaragePoint = { x = -859.01, y = 695.95, z = 147.93 },
		SpawnPoint = { x = -863.681, y = 698.72, z = 147.052, h = 341.77 },
		DeletePoint = { x = -855.66, y = 698.77, z = 147.81 }
	},
	Garage_MadWayneThunder = {
		Private = "MadWayneThunder",
		GaragePoint = { x = -1290.95, y = 454.52, z = 96.66 },
		SpawnPoint = { x = -1297.62, y = 459.28, z = 96.48, h = 285.652 },
		DeletePoint = { x = -1298.088, y = 468.952, z = 96.0 }
	},
	Garage_TinselTowersApt12 = {
		Private = "TinselTowersApt12",
		GaragePoint = { x = -616.74, y = 56.38, z = 42.736 },
		SpawnPoint = { x = -620.588, y = 60.102, z = 42.736, h = 109.316 },
		DeletePoint = { x = -621.128, y = 52.691, z = 42.735 }
	},
	-- End of Single Garages
	-- Start of VENT Custom Garages
	Garage_MedEndApartment1 = {
		Private = "MedEndApartment1",
		GaragePoint = { x = 240.23, y = 3102.84, z = 41.49 },
		SpawnPoint = { x = 233.58, y = 3094.29, z = 41.49, h = 93.91 },
		DeletePoint = { x = 237.52, y = 3112.63, z = 41.39 }
	},
	Garage_MedEndApartment2 = {
		Private = "MedEndApartment2",
		GaragePoint = { x = 246.08, y = 3174.63, z = 41.72 },
		SpawnPoint = { x = 234.15, y = 3164.37, z = 41.54, h = 102.03 },
		DeletePoint = { x = 240.72, y = 3165.53, z = 41.65 }
	},
	Garage_MedEndApartment3 = {
		Private = "MedEndApartment3",
		GaragePoint = { x = 984.92, y = 2668.95, z = 39.06 },
		SpawnPoint = { x = 993.96, y = 2672.68, z = 39.06, h = 0.61 },
		DeletePoint = { x = 994.04, y = 2662.1, z = 39.13 }
	},
	Garage_MedEndApartment4 = {
		Private = "MedEndApartment4",
		GaragePoint = { x = 196.49, y = 3027.48, z = 42.89 },
		SpawnPoint = { x = 203.1, y = 3039.47, z = 42.08, h = 271.3 },
		DeletePoint = { x = 192.24, y = 3037.95, z = 42.89 }
	},
	Garage_MedEndApartment5 = {
		Private = "MedEndApartment5",
		GaragePoint = { x = 1724.49, y = 4638.13, z = 42.31 },
		SpawnPoint = { x = 1723.98, y = 4630.19, z = 42.23, h = 117.88 },
		DeletePoint = { x = 1733.66, y = 4635.08, z = 42.24 }
	},
	Garage_MedEndApartment6 = {
		Private = "MedEndApartment6",
		GaragePoint = { x = 1670.76, y = 4740.99, z = 41.08 },
		SpawnPoint = { x = 1673.47, y = 4756.51, z = 40.91, h = 12.82 },
		DeletePoint = { x = 1668.46, y = 4750.83, z = 40.88 }
	},
	Garage_MedEndApartment7 = {
		Private = "MedEndApartment7",
		GaragePoint = { x = 15.24, y = 6573.38, z = 31.72 },
		SpawnPoint = { x = 16.77, y = 6581.68, z = 31.42, h = 222.6 },
		DeletePoint = { x = 10.45, y = 6588.04, z = 31.47 }
	},
	Garage_MedEndApartment8 = {
		Private = "MedEndApartment8",
		GaragePoint = { x = -374.73, y = 6187.06, z = 30.54 },
		SpawnPoint = { x = -377.97, y = 6183.73, z = 30.49, h = 223.71 },
		DeletePoint = { x = -383.31, y = 6188.85, z = 30.49 }
	},
	Garage_MedEndApartment9 = {
		Private = "MedEndApartment9",
		GaragePoint = { x = -24.6, y = 6605.99, z = 30.45 },
		SpawnPoint = { x = -16.0, y = 6607.74, z = 30.18, h = 35.31 },
		DeletePoint = { x = -9.36, y = 6598.86, z = 30.47 }
	},
	Garage_MedEndApartment10 = {
		Private = "MedEndApartment10",
		GaragePoint = { x = -365.18, y = 6323.95, z = 28.9 },
		SpawnPoint = { x = -359.49, y = 6327.41, z = 28.83, h = 218.58 },
		DeletePoint = { x = -353.47, y = 6334.57, z = 28.83 }
	},
	Garage_Vigne = {
		GaragePoint = { x = -1933.9, y = 2038.72, z = 139.83 },
		SpawnPoint = { x = -1922.57, y = 2036.19, z = 139.73, h = 253.9 },
		DeletePoint = { x = -1922.14, y = 2040.38, z = 139.73 }
	},

	Garage_Taxi = {
		GaragePoint = { x = 893.46, y = -147.36, z = 75.89 },
		SpawnPoint = {x = 903.79, y = -141.62, z = 76.56, h = 324.1},
		DeletePoint = {x = 897.99, y = -152.17, z = 75.56},
	},

	PDM = {
		GaragePoint = { x = -6.41, y = -1083.52, z = 25.63 },
		SpawnPoint = {x = -14.37, y = -1085.36, z = 26.65, h = 74.84},
		DeletePoint = { x = -16.82, y = -1079.38, z = 25.67},
	},

	EMS = {
		GaragePoint = { x = 295.09, y = -601.03, z = 42.3 },
		SpawnPoint = {x = 285.65, y = -602.48, z = 43.19, h = 331.1},
		DeletePoint = { x = 296.91, y = -607.94, z = 42.36},
	},

	STEAKHOUSE = {
		GaragePoint = vector3(-681.58, 5775.31, 16.33),
		SpawnPoint = {x = -675.17, y = 5779.74, z = 17.33, h = 64.37},
		DeletePoint = vector3(-670.08, 5787.43, 16.36)
	},

	LSC = {
		GaragePoint = vector3(454.1, -1888.28, 25.43),
		SpawnPoint = {x = 458.75, y = -1889.23, z = 25.98, h = 203.18},
		DeletePoint = vector3(449.7, -1882.86, 25.88),
	},

	GALDIN = {
		GaragePoint = vector3(-2111.91, -491.69, 11.1),
		SpawnPoint = {x = -2104.39, y = -493.27, z = 11.1, h = 318.61},
		DeletePoint = vector3(-2101.48, -495.72, 11.1),
	},

	SHERIFF = {
		GaragePoint = vector3(1868.62, 3704.41, 32.26),
		SpawnPoint = {x = 1863.7, y = 3702.88, z = 32.48, h = 213.12},
		DeletePoint = vector3(1877.97, 3697.69, 32.39),
	},

	ZENSAI = {
		GaragePoint = vector3(113.27, -1049.72, 28.21),
		SpawnPoint = {x = 107.73, y = -1059.72, z = 29.19, h = 243.56},
		DeletePoint = vector3(109.13, -1056.06, 28.19),
	},

	VLADA = {
		GaragePoint = vector3(-505.03, -255.5, 34.66),
		SpawnPoint = {x = -504.4, y = -259.24, z = 35.54, h = 110.06},
		DeletePoint = vector3(-497.94, -256.52, 34.58),
	},

	DESANTA = {
		GaragePoint = vector3(-821.73, 186.78, 71.13),
		SpawnPoint = {x = -821.62, y = 183.44, z = 71.98, h = 133.25},
		DeletePoint = vector3(-811.64, 187.56, 71.48),
	},

	VANILLA = {
		GaragePoint = vector3(140.3, -1334.89, 28.2),
		SpawnPoint = {x = 145.32, y = -1329.69, z = 29.2, h = 231.06},
		DeletePoint = vector3(151.27, -1328.65, 28.2),
	},

	HASICI = {
		GaragePoint = vector3(-1650.35, 52.5, 61.78),
		SpawnPoint = {x = -1659.89, y = 47.86, z = 63.82, h = 135.96},
		DeletePoint = vector3(-1659.47, 42.32, 62.26),
	},

	RANCH = {
		GaragePoint = vector3(1415.77, 1115.98, 113.84),
		SpawnPoint = {x = 1411.89, y = 1118.55, z = 113.84, h = 82.58},
		DeletePoint = vector3(1393.02, 1117.43, 113.84),
	},

	KITSUNE = {
		GaragePoint = vector3(-135.69, 1004.23, 235.05),
		SpawnPoint = {x = -128.0, y = 1002.15, z = 235.73, h = 200.28},
		DeletePoint = vector3(-125.01, 1007.99, 234.73),
	},

	BENNYS = {
		GaragePoint = vector3(-175.36, -1288.7, 30.3),
		SpawnPoint = {x = -182.88, y = -1291.97, z = 31.3, h = 174.89},
		DeletePoint = vector3(-191.59, -1284.54, 30.23),
	},

	KASINO = {
		GaragePoint = vector3(917.78, 62.21, 79.9),
		SpawnPoint = {x = 919.4, y = 57.48, z = 80.9, h = 147.44 },
		DeletePoint = vector3(930.05, 61.98, 79.26),
	},

	HUNTING = {
		GaragePoint = vector3(-803.7, 5399.3, 33.3),
		SpawnPoint = { x = -798.93, y = 5406.14, z = 33.98, h = 12.67},
		DeletePoint = vector3(-798.22, 5389.98, 33.31),
	},

	BAZAR = {
		GaragePoint = vector3(2146.71, 3834.63, 32.07),
		SpawnPoint = {x = 2153.13, y = 3841.16, z = 33.1, h = 28.27},
		DeletePoint = vector3(2137.0, 3833.11, 32.1),
		specialJob = 'bazar',
	},

	FARMA = {
		GaragePoint = vector3(2518.8, 4963.12, 43.59),
		SpawnPoint = {x = 2513.92, y = 4968.53, z = 44.6, h = 76.14},
		DeletePoint = vector3(2523.65, 4970.49, 43.52),
	},

	LIFEINVADER = {
		GaragePoint = vector3(-1095.79, -263.03, 36.69),
		SpawnPoint = { x = -1100.55, y = -262.66, z = 36.90, h = 202.77},
		DeletePoint = vector3(-1097.58, -255.68, 36.69),
	},
	SHERIFFPALETO = {
		GaragePoint = vector3(-449.81, 5988.93, 30.34),
		SpawnPoint = { x = -448.84, y = 5994.61, z = 31.34, h = 80.21},
		DeletePoint = vector3(-456.02, 6001.98, 30.34),
	},
	LOST = {
		GaragePoint = vector3(2002.88, 3051.13, 46.21),
		SpawnPoint = { x = 2009.45, y = 3056.4, z = 47.06, h = 65.17},
		DeletePoint = vector3(2007.31, 3053.39, 46.05),
	},
	VRAKOVISTE = {
		GaragePoint = vector3(1387.31, -2072.24, 51.0),
		SpawnPoint = { x = 1386.6, y = -2059.08, z = 52.0, h = 38.25},
		DeletePoint = vector3(1396.57, -2068.18, 51.0),
	},
	KOSTEL = {
		GaragePoint = vector3(-1648.9, -260.07, 53.4),
		SpawnPoint = { x = -1646.78, y = -248.51, z = 54.6, h = 252.72},
		DeletePoint = vector3(-1655.79, -253.55, 53.82),
	},
	ZOE_VILA = {
		GaragePoint = vector3(-167.54, 926.53, 234.66),
		SpawnPoint = { x = -164.16, y = 933.19, z = 235.66, h = 230.09},
		DeletePoint = vector3(-166.9, 921.57, 234.66),
	},
	PIVOVAR = {
		GaragePoint = vector3(850.49, -1974.87, 28.3),
		SpawnPoint = { x = 843.27, y = -1969.06, z = 28.29, h = 74.88},
		DeletePoint = vector3(852.36, -1968.27, 28.29),
	},
	BLOODS = {
		GaragePoint = vector3(1295.58, -1696.97, 54.08),
		SpawnPoint = { x = 1309.53, y = -1719.02, z = 54.45, h = 114.45},
		DeletePoint = vector3(1301.12, -1702.99, 54.14),
	},
	BALLAS = {
		GaragePoint = vector3(87.39, -1964.29, 19.75),
		SpawnPoint = { x = 89.73, y = -1966.79, z = 20.75, h = 323.16},
		DeletePoint = vector3(85.17, -1972.04, 19.78),
	},
	WCORP = {
		GaragePoint = vector3(813.17, -2115.27, 28.37),
		SpawnPoint = { x = 822.3, y = -2124.03, z = 29.33, h = 86.17},
		DeletePoint = vector3(820.01, -2118.84, 28.37),
	},
	WCORP_SKLAD = {
		GaragePoint = vector3(891.45, -3237.52, -99.27),
		SpawnPoint = { x = 887.6, y = -3245.6, z = -99.28, h = 83.72},
		DeletePoint = vector3(896.42, -3245.73, -99.24),
	},
	SVATBA = {
		GaragePoint = vector3(3327.07, 5158.29, 17.57),
		SpawnPoint = {x = 3326.92, y = 5152.68, z = 18.28, h = 124.47},
		DeletePoint = vector3(3331.96, 5157.85, 17.31),
	},
	VILA_DRAL = {
		GaragePoint = vector3(-678.75, 908.0, 229.58),
		SpawnPoint = {x = -671.41, y = 911.57, z = 229.38, h = 329.68},
		DeletePoint = vector3(-675.78, 903.33, 229.58),
	},
	COSANOSTRA = {
		GaragePoint = vector3(-2674.1, 1310.67, 146.16),
		SpawnPoint = {x = -2661.26, y = 1307.18, z = 146.12, h = 267.15},
		DeletePoint = vector3(-2669.13, 1309.45, 146.12),
	},
	PRISTAV = {
		GaragePoint = vector3(-737.24, -1503.43, 4.0),
		SpawnPoint = {x = -744.3, y = -1499.28, z = 5.0, h = 293.78},
		DeletePoint = vector3(-742.24, -1505.2, 4.0),
	},

	ODTAH1 = {
		GaragePoint = vector3(392.7, -1644.02, 28.3),
		SpawnPoint = {x = 401.9, y = -1641.61, z = 29.29, h = 227.97},
		DeletePoint = vector3(398.09, -1646.92, 28.29),
	},
	ODTAH2 = {
		GaragePoint = vector3(1662.82, 3823.61, 33.89),
		SpawnPoint = {x = 1673.62, y = 3821.67, z = 34.92, h = 32.34},
		DeletePoint = vector3(1679.43, 3812.96, 33.92),
	},
	ODTAH3 = {
		GaragePoint = vector3(-250.14, 6214.4, 30.94),
		SpawnPoint = {x = -255.12, y = 6205.79, z = 31.49, h = 221.46},
		DeletePoint = vector3(-245.45, 6203.73, 30.49),
	},

	KARGO_VILA = {
		GaragePoint = vector3(21.08, 548.24, 175.03),
		SpawnPoint = {x = 14.07, y = 549.52, z = 175.27, h = 58.75},
		DeletePoint = vector3(23.86, 543.91, 175.03),
	},

	BENEFACTOR = {
		GaragePoint = vector3(-69.97, 80.06, 70.6),
		SpawnPoint = {x = -68.73, y = 82.71, z = 71.51, h = 65.96},
		DeletePoint = vector3(-76.0, 89.74, 70.54),
		specialJob = 'benefactor',
	},

	DRAHALOST = {
		GaragePoint = vector3(1155.47, 2115.21, 54.68),
		SpawnPoint = {x = 1162.3, y = 2114.26, z = 55.65, h = 358.34},
		DeletePoint = vector3(1168.31, 2122.97, 54.49),
	},
	VADENEZDVILA = {
		GaragePoint = vector3(-108.95, 827.0, 234.72),
		SpawnPoint = {x = -106.76, y = 836.17, z = 235.69, h = 354.37},
		DeletePoint = vector3(-102.35, 823.89, 234.73),
	},
	SLAVICNICK = {
		GaragePoint = vector3(-85.2, -20.71, 65.32),
		SpawnPoint = {x = -76.04, y = -26.39, z = 66.05, h = 224.16},
		DeletePoint = vector3(-86.26, -29.24, 65.32),
	},

	OHNY_VILA = {
		GaragePoint = vector3(-922.6, 113.99, 54.32),
		SpawnPoint = {x = -927.03, y = 112.46, z = 54.65, h = 35.36},
		DeletePoint = vector3(-918.36, 111.37, 54.32),
	},

	HESLO_VILA = {
		GaragePoint = vector3(-938.12, 206.94, 66.46),
		SpawnPoint = {x = -933.4, y = 210.7, z = 66.46, h = 169.68},
		DeletePoint = vector3(-928.21, 210.05, 66.47),
	},

	KAVARNA = {
		GaragePoint = vector3(-632.35, 248.96, 80.51),
		SpawnPoint = {x = -630.47, y = 254.0, z = 80.44, h = 258.7},
		DeletePoint = vector3(-622.36, 249.56, 80.7),
	},

	EASYWAY = {
		GaragePoint = vector3(506.48, -3157.19, 5.07),
		SpawnPoint = {x = 497.34, y = -3155.83, z = 6.07, h = 18.05},
		DeletePoint = vector3(504.84, -3146.51, 5.07),
	},
	-- End of VENT Custom Garages
}

-- End of Private Garages
