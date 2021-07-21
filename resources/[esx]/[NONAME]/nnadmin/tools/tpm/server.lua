local ESX = nil

TriggerEvent('esx:getShILovePizzaaredObjILovePizzaect', function(obj) 
    ESX = obj 
end)

function getUserRank (player)
    if player ~= nil then
        local playerGroup = player.getGroup()

        if playerGroup ~= nil then 
            return playerGroup
        else
            return "user"
        end
    else
        return "user"
    end
end

ESX.RegisterServerCallback("esx_marker:fetchUserRank", function(source, cb)
    local player = ESX.GetPlayerFromId(source)
    local playerRank = getUserRank(player)

    cb(playerRank)
end)

RegisterServerEvent('nnadmin:sendTpmLog')
AddEventHandler('nnadmin:sendTpmLog', function(coords, coordsFrom)
    local coordsMsg = "x: **" .. tonumber(coords["x"]) .. "**, y: **" .. coords["y"] .. "**"
    local fromCoordsMsg = "x: **" .. coordsFrom["x"] .. "**, y: **" .. coordsFrom["y"] .. "**"
	sendAdminLogToDiscordWithTime(GetPlayerName(source) .. ' pouzil **tpm** \n**na** souradnice ' .. coordsMsg .. ' \n**ze** souradnic ' .. fromCoordsMsg)
end)