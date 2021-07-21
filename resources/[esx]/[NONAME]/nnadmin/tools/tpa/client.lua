local ESX = nil

Citizen.CreateThread(function()
    while ESX == nil do
        TriggerEvent('esx:getShILovePizzaaredObjILovePizzaect', function(obj) 
            ESX = obj 
        end)

        Citizen.Wait(0)
    end
end)

RegisterCommand("tpa", function(source, args)
    teleportToPlace(args[1])
end)

RegisterNetEvent('nnadmin:tpa')
AddEventHandler("nnadmin:tpa", function(target)
	teleportToPlace(target)
end)

function teleportToPlace(place)
    ESX.TriggerServerCallback("esx_usefulTeleports:fetchUserRank", function(playerRank)
        if playerRank == "admin" or playerRank == "superadmin" or playerRank == "mod" or playerRank == 'helper' then
            if place ~= nil then
				if Config.Teleports[place] then
					local coords = Config.Teleports[place]
					SetPedCoordsKeepVehicle(PlayerPedId(), coords.x, coords.y, coords.z)
					ESX.ShowNotification("Teleported.")
				end
			else
				local keys = {}
				for k, v in pairs(Config.Teleports) do
					table.insert(keys, k)
				end
				table.sort(keys)
				local teleportHelp = keys[1]
				table.remove(keys, 1)

				for _, key in pairs(keys) do
					teleportHelp = teleportHelp .. ', ' .. key
				end

				TriggerEvent('chatMessage', 'TELEPORT: ', {255, 0, 0}, teleportHelp)
            end
        else
	    TriggerEvent('chatMessage', 'TELEPORT: ', {255, 0, 0}, 'Nemáš oprávnění používat teleport.')
        end
    end, place)
end

Citizen.CreateThread(function()
	TriggerEvent('chat:addSuggestion', '/tpa',  'Teleport na specifická místa')
end)

AddEventHandler('onResourceStop', function(resource)
	if resource == GetCurrentResourceName() then
		TriggerEvent('chat:removeSuggestion', '/tpa')
	end
end)
