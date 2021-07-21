function AddTextEntry(key, value)
	Citizen.InvokeNative(GetHashKey("ADD_TEXT_ENTRY"), key, value)
end

local config = {
    ["TITLE"] = "NoNameRP",
    ["SUBTITLE"] = "",
    ["MAP"] = "Mapa",
    ["STATUS"] = "Status",
    ["GAME"] = "Letiste",
    ["INFO"] = "Info",
    ["SETTINGS"] = "Nastavení",
    ["R*EDITOR"] = "Editor",
    ["GALLERY"] = "Galerie",
    ["STATS"] = "Staty",
    ["DISCONNECT"] = "Navrat na letiste",
    ["EXIT_GAME"] = "Odletet z mesta",
}

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        N_0xb9449845f73f5e9c("SHIFT_CORONA_DESC")
        PushScaleformMovieFunctionParameterBool(true)
        PopScaleformMovieFunction()
        N_0xb9449845f73f5e9c("SET_HEADER_TITLE")
        PushScaleformMovieFunctionParameterString(config["TITLE"])
        PushScaleformMovieFunctionParameterBool(true)
        PushScaleformMovieFunctionParameterString(config["SUBTITLE"])
        PushScaleformMovieFunctionParameterBool(true)
        PopScaleformMovieFunctionVoid()
    end
end)

Citizen.CreateThread(function()
    AddTextEntry('PM_SCR_MAP', config["MAP"])
    AddTextEntry('PM_SCR_STA', config["STATUS"])
    AddTextEntry('PM_SCR_GAM', config["GAME"])
    AddTextEntry('PM_SCR_INF', config["INFO"])
    AddTextEntry('PM_SCR_SET', config["SETTINGS"])
    AddTextEntry('PM_SCR_RPL', config["R*EDITOR"])
    AddTextEntry('PM_SCR_GAL', config["GALLERY"])
    AddTextEntry('PM_SCR_STA', config["STATS"])
    AddTextEntry('PM_PANE_LEAVE', config["DISCONNECT"])
    AddTextEntry('PM_PANE_QUIT', config["EXIT_GAME"])
end)
