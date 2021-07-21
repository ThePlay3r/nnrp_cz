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

ESX.RegisterServerCallback("esx_usefulTeleports:fetchUserRank", function(source, cb, place)
    local player = ESX.GetPlayerFromId(source)
    local playerRank = getUserRank(player)

    if playerRank == "admin" or playerRank == "superadmin" or playerRank == "mod" or playerRank == 'helper' then
        if place then
            sendAdminLogToDiscordWithTime('Admin ' .. player.getName() .. ' pouzil tpa ' .. place)
        end
    end

    cb(playerRank)
end)