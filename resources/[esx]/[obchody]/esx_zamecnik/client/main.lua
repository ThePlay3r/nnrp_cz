local ESX = nil
TriggerEvent('esx:getShILovePizzaaredObjILovePizzaect', function(obj) ESX = obj end)

local isInZone = nil
local HasAlreadyEnteredMarker = false
local LastZone = nil

AddEventHandler('zamecnik:hasEnteredMarker', function()
    isInZone = true
end)

AddEventHandler('zamecnik:hasExitedMarker', function()
    isInZone = false
    ESX.UI.Menu.CloseAll()
end)


-- Display markers
Citizen.CreateThread(function()
	while true do
        Wait(0)
   
        local coords = GetEntityCoords(GetPlayerPed(-1))

        for k,v in pairs(Config.Places) do
            if(v.Type ~= -1 and GetDistanceBetweenCoords(coords, v.Pos.x, v.Pos.y, v.Pos.z, true) < Config.MarkersDrawDistance) then
                DrawMarker(v.Type, v.Pos.x, v.Pos.y, v.Pos.z, 0.0, 0.0, 0.0, 0, 0.0, 0.0, v.Size.x, v.Size.y, v.Size.z, v.Color.r, v.Color.g, v.Color.b, 100, false, false, 2, false, false, false, false)
            end
        end
    end
end)

-- Enter / Exit marker events
Citizen.CreateThread(function()
	while true do
		Wait(0)

        local coords = GetEntityCoords(GetPlayerPed(-1))
        local isInMarker = false
        local currentZone = nil

        for k, v in pairs(Config.Places) do
            if(GetDistanceBetweenCoords(coords, v.Pos.x, v.Pos.y, v.Pos.z, true) < v.Size.x) then
                isInMarker = true
                currentZone = k
            end
        end

        if (isInMarker and not HasAlreadyEnteredMarker) or (isInMarker and LastZone ~= currentZone) then
            HasAlreadyEnteredMarker = true
            LastZone = currentZone
            TriggerEvent('zamecnik:hasEnteredMarker')
        end

        if not isInMarker and HasAlreadyEnteredMarker then
            HasAlreadyEnteredMarker = false
            TriggerEvent('zamecnik:hasExitedMarker')
        end
	end
end)

function OpenItemsMenu(items, title)
    ESX.UI.Menu.CloseAll()
	ESX.UI.Menu.Open(
		'default', GetCurrentResourceName(), 'fourActionsMenu',
		{
			title = title,
			align = 'left',
			elements = items,
		},
		function(data, menu)
			if data.current.value == 'no_keys' then
				menu.close()
            else
				TriggerServerEvent("zamecnik:copyItem", data.current.value)
				menu.close()
			end
		end,
		function(data, menu)
			menu.close()
		end
	)
end

RegisterNetEvent("zamecnik:openItemsMenu")
AddEventHandler("zamecnik:openItemsMenu", function(items, title)
	local finalKeys = items

	if #items == 0 then
		finalKeys = {label = "Nemas nic k namnozeni", value = "no_keys"}
	end

	OpenItemsMenu(finalKeys, title)
end)

function OpenMenu()
    ESX.UI.Menu.CloseAll()
	ESX.UI.Menu.Open(
		'default', GetCurrentResourceName(), 'fourActionsMenu',
		{
			title = 'Zamecnik Pete',
			align = 'left',
			elements = {
                {value = "keys", label = "Klíče"},
                {value = "remotes", label = "Dálkové ovladače"},
            },
		},
		function(data, menu)
			if data.current.value == 'keys' then
				TriggerServerEvent('zamecnik:getPlayerKeys')
            end
            if data.current.value == 'remotes' then
				TriggerServerEvent('zamecnik:getPlayerRemotes')
            end
		end,
		function(data, menu)
			menu.close()
		end
	)
end

-- Key Controls
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)

        if isInZone then
            SetTextComponentFormat('STRING')
            AddTextComponentString("Stiskni ~INPUT_CONTEXT~ pro nabidku zamecnika")
			DisplayHelpTextFromStringLabel(0, 0, 1, -1)

            if IsControlJustReleased(0,  Config.Keys['E']) then
                OpenMenu()
            end
		end
	end
end)