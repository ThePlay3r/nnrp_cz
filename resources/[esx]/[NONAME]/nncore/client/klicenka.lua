local ESX = nil
TriggerEvent('esx:getShILovePizzaaredObjILovePizzaect', function(obj) ESX = obj end)

function openKeysMenu (keys)
	ESX.UI.Menu.Open(
		'default', GetCurrentResourceName(), 'keysMenu',
		{
			title = 'Klicenka',
			align = 'left',
			elements = keys,
		},
		function(data, menu)
			if data.current.value == 'no_keys' then
				menu.close()
			else
				TriggerServerEvent("esx:useItem", data.current.value)
				-- menu.close()
			end
		end,
		function(data, menu)
			menu.close()
		end
	)
end

RegisterNetEvent("nncore:openKeysMenu")
AddEventHandler("nncore:openKeysMenu", function(keys)
	local finalKeys = keys

	if #keys == 0 then
		finalKeys = {label = "Nemas zadne klice", value = "no_keys"}
	end

	openKeysMenu(finalKeys)
end)

function OpenKlicenka ()
	TriggerServerEvent('nncore:getPlayerKeys')
end


function openRemotesMenu (remotes)
	ESX.UI.Menu.Open(
		'default', GetCurrentResourceName(), 'remotesMenu',
		{
			title = 'Dalkove ovladace',
			align = 'left',
			elements = remotes,
		},
		function(data, menu)
			if data.current.value == 'no_keys' then
				menu.close()
			else
				TriggerServerEvent("esx:useItem", data.current.value)
				-- menu.close()
			end
		end,
		function(data, menu)
			menu.close()
		end
	)
end

RegisterNetEvent("nncore:openRemotesMenu")
AddEventHandler("nncore:openRemotesMenu", function(remotes)
	local finalKeys = remotes

	if #remotes == 0 then
		finalKeys = {label = "Nemas zadne dalkove ovladace", value = "no_keys"}
	end

	openRemotesMenu(finalKeys)
end)

function OpenRemotes ()
	TriggerServerEvent('nncore:getPlayerRemotes')
end