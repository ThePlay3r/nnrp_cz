Citizen.CreateThread(function()
    local SUPPRESSED_MODELS = {
        "BIFTA", 
        "BLAZER", 
        "BTYPE", 
        "BTYPE2", 
        "BTYPE3", 
        "BUFFALO",
        "GRESLEY",
        "CHEBUREK", 
        "CHIMERA", 
        "DUBSTA", 
        "DUBSTA3",
        "KAMACHO", 
        "SABREGT2", 
        "SANCTUS",
        "STAFFORD",
        "SURFER",
        "WINDSOR2",
	    "POLICEB",
        "POLICE",
        "POLICE2",
        "POLICE3",
        "POLICE4",
	    "INFERNUS2",
        "INFERNUS",
        "FIRETRUK",
        'BLIMP',
        'BLIMP2',
        'AMBULANCE',
        'POLMAV',
    }

    while true do
        for _, model in next, SUPPRESSED_MODELS do
            SetVehicleModelIsSuppressed(GetHashKey(model), true)
        end
        Wait(10000)
    end
end)