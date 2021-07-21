local ESX = nil
local jobName = nil
TriggerEvent('esx:getShILovePizzaaredObjILovePizzaect', function(obj) ESX = obj end)

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
	jobName = xPlayer.job.name
end)

RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
    jobName = job.name
end)

local Notifications = {}
local Notification = nil
local NotificationsSettings = {}
for k,v in ipairs(Config.Society) do
    NotificationsSettings[v.label] = true
end
local isBeingShown = false

RegisterNetEvent('nnannounces:sendAnnounce')
AddEventHandler("nnannounces:sendAnnounce", function(label, text, color)
    if NotificationsSettings[label] then
        table.insert(Notifications, {
            text = text,
		    contact = label,
		    color = color,
        })
    end
end)

function getIndexOfItems (values)
	local index={}
	for k,v in pairs(values) do
	   index[v.key] = k
	end
	return index
end

function OpenSettingsMenu ()
    local elements = {}

    for k,v in pairs(NotificationsSettings) do
        local valueLabel = '<span style="color: rgb(0, 207, 10); font-weight: bold;">ON</span>'
        if not v then
            valueLabel = '<span style="color: rgb(181, 0, 0); font-weight: bold;">OFF</span>'
        end
        table.insert(elements, {value = v, label = k .. ': ' .. valueLabel, key = k})
    end

    table.sort(elements, function(a,b)
        return a.label < b.label
    end)

    ESX.UI.Menu.Open(
		'default', GetCurrentResourceName(), 'notificationsSettingsMenu',
		{
			title = 'Nastaveni oznameni',
			align = 'left',
			elements = elements,
		},
        function(data, menu)
            local index = getIndexOfItems(elements)[data.current.key]
            local valueLabel = '<span style="color: rgb(0, 207, 10); font-weight: bold;">ON</span>'
            if data.current.value then
                valueLabel = '<span style="color: rgb(181, 0, 0); font-weight: bold;">OFF</span>'
            end
            menu.setElement(index, 'label', data.current.key .. ': ' .. valueLabel)
            NotificationsSettings[data.current.key] = not data.current.value
            menu.setElement(index, 'value', not data.current.value)
            menu.refresh()
		end,
		function(data, menu)
			menu.close()
		end
	)
end

AddEventHandler("nnannounces:showMenu", function()
    ESX.UI.Menu.Open(
		'default', GetCurrentResourceName(), 'notificationsMenu',
		{
			title = 'Oznameni',
			align = 'left',
			elements = {
                {value = 'settings', label = 'Nastaveni oznameni'},
                {value = 'history', label = 'Historie oznameni'},
            },
		},
        function(data, menu)
            if data.current.value == 'settings' then
                OpenSettingsMenu()
            end
            if data.current.value == 'history' then
                ESX.TriggerServerCallback('nnannounces:getAnnouncesHistory', function(history)
                    local elements = {label = "Zadne oznameni"}
                    if #history > 0 then
                        elements = {}
                        for k, v in ipairs(history) do
                            local text = string.sub(v.text, 1, 60)
                            table.insert(elements, {label = v.label .. ' ' .. v.time .. ' - ' .. text, timestamp = v.timestamp})
                        end
                        table.sort(elements, function(a,b)
                            return a.timestamp < b.timestamp
                        end)
                    end

                    ESX.UI.Menu.Open(
                        'default', GetCurrentResourceName(), 'notificationsMenuHistory',
                        {
                            title = 'Oznameni historie',
                            align = 'left',
                            elements = elements
                        },
                        function(data2, menu2)
                            menu2.close()
                        end,
                        function(data2, menu2)
                            menu2.close()
                        end
                    )
                end)
            end
		end,
		function(data, menu)
			menu.close()
		end
	)
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)

        if Notification == nil and not isBeingShown and #Notifications > 0 then
            Notification = Notifications[1]
            table.remove(Notifications, 1)
        end

        if Notification ~= nil and not isBeingShown then
			isBeingShown = true
            SendNUIMessage({ type = "sendNotificaton", text = Notification.text, contact = Notification.contact, color = Notification.color})
            Citizen.Wait(10000)
            Notification = nil
            isBeingShown = false
            SendNUIMessage({ type = "clearNotification"})
            Citizen.Wait(1000)
        end
    end
end)

for k,v in ipairs(Config.Society) do
	RegisterCommand('*_' .. v.cmd, function(playerId, args, rawCommand)
		if jobName ~= v.job then
			ESX.ShowNotification('Nemas opravneni pouzit tuto notifikaci')
			return
		end

		args = table.concat(args, ' ')

        TriggerServerEvent('nnannounces:sendAnnounce', v.label, args, v.job, v.color)
	end, false)
end