local ESX = nil
local isAdminTagEnabled = false
local isBigIdsEnabled = false
local PlayerSources = {}

Citizen.CreateThread(function()
    while ESX == nil do
        TriggerEvent('esx:getShILovePizzaaredObjILovePizzaect', function(obj) ESX = obj end)
        Citizen.Wait(0)
    end
end)

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function()
	TriggerServerEvent('nnadmin:registerUserData')
end)

-- CONSTANTS

local DEFAULT_OPTIONS = {
    OFF = '<span style="color: rgb(181, 0, 0); font-weight: bold;">OFF</span>',
    ON = '<span style="color: rgb(0, 207, 10); font-weight: bold;">ON</span>',
}

-- EVENT HANDLERS
RegisterNetEvent('nnadmin:handleTagIdsChange')
AddEventHandler('nnadmin:handleTagIdsChange', function(type, value)
    if type == 'BigIds' then
        isBigIdsEnabled = value
    end
    if type == 'AdminTag' then
        isAdminTagEnabled = value
    end
end)

RegisterNetEvent('nnadmin:receivePlayerSources')
AddEventHandler('nnadmin:receivePlayerSources', function(sources)
    PlayerSources = sources
end)


-- MAIN MENU

function OpenMenu ()
    local MyName = GetPlayerName(PlayerId())
    local BigIdsValue = DEFAULT_OPTIONS.OFF
    local AdminTagValue = DEFAULT_OPTIONS.OFF
    if isBigIdsEnabled then
        BigIdsValue = DEFAULT_OPTIONS.ON
    end
    if isAdminTagEnabled then
        AdminTagValue = DEFAULT_OPTIONS.ON
    end
    local Elements = {
        {index = 1, label = 'Hraci'},
        {index = 2, label = 'Vyreseno'},
        {index = 3, label = 'TPA'},
        {index = 4, label = 'AdminTag ' .. AdminTagValue, key = 'AdminTag'},
        {index = 5, label = 'Bigids ' .. BigIdsValue, key = 'BigIds'},
    }

    ESX.UI.Menu.Open(
		'default', GetCurrentResourceName(), 'NNMenu',
		{
			title = MyName,
			align = 'left',
			elements = Elements,
		},
        function(data, menu)
            -- Hraci a Spectate
            if data.current.label == 'Hraci' then
                -- OpenSpectateMenu()
            end
            -- TPA
            if data.current.label == 'TPA' then
                OpenTPAMenu()
            end
            -- Vyreseno
            if data.current.label == 'Vyreseno' then
                TriggerServerEvent('nnadmin:callVyreseno')
            end
            -- AdminTag a BigIds
            if data.current.key then
                local newLabel = DEFAULT_OPTIONS.OFF
                if data.current.key == 'AdminTag' then
                    if isAdminTagEnabled then
                        newLabel = DEFAULT_OPTIONS.OFF
                        isAdminTagEnabled = false
                        TriggerServerEvent('relisoft_tag:turnTagOff', GetPlayerServerId(PlayerId()))
                    else
                        newLabel = DEFAULT_OPTIONS.ON
                        isAdminTagEnabled = true
                        TriggerServerEvent('relisoft_tag:turnTagOn', GetPlayerServerId(PlayerId()))
                    end
                end
                if data.current.key == 'BigIds' then
                    if isBigIdsEnabled then
                        newLabel = DEFAULT_OPTIONS.OFF
                        isBigIdsEnabled = false
                        TriggerEvent('idAboveHead:CallIdsOff')
                    else
                        newLabel = DEFAULT_OPTIONS.ON
                        isBigIdsEnabled = true
                        TriggerEvent('idAboveHead:CallIdsOn')
                    end
                end
                menu.setElement(data.current.index, 'label', data.current.key .. ' '.. newLabel)
                menu.refresh()
            end
		end,
		function(data, menu)
			menu.close()
		end
	)
end

RegisterNetEvent('nnadmin:OpnMn')
AddEventHandler('nnadmin:OpnMn', function()
    OpenMenu()
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)

        if IsControlJustReleased(0, 56)  then
            ExecuteCommand('nnmenu')
        end
    end
end)

-- ADMIN MENUs
function OpenTPAMenu ()
    local Elements = {}

    for k,v in pairs(Config.Teleports) do
        table.insert(Elements, {label = k, value = k})
    end

    table.sort(Elements, function(a,b)
        return a.label < b.label
    end)

    ESX.UI.Menu.Open(
		'default', GetCurrentResourceName(), 'NNMenuTPA',
		{
			title = 'NNRP',
			align = 'left',
			elements = Elements,
		},
        function(data, menu)
            TriggerEvent('nnadmin:tpa', data.current.value)
		end,
		function(data, menu)
			menu.close()
		end
	)
end

function OpenSpectateMenu ()
    local Elements = {
        {
            type = 'slider',
            label = 'Spectate',
            options = PlayerSources,
            max = 0,
            value = 0,
            name = "Spectate",
        },
        {value = 'endspectate', label = 'Zrusit Spectate'},
        {value = 'heal', label = 'Heal'},
        {value = 'revive', label = 'Revive'},
        {value = 'resit', label = 'Resit'},
        {value = 'vyreseno', label = 'Vyreseno'}
    }

    ESX.UI.Menu.Open(
		'default', GetCurrentResourceName(), 'NNMenuSpec',
		{
			title = 'NNRP',
			align = 'left',
			elements = Elements,
		},
        function(data, menu)
            if data.current.name == 'Spectate' then
                TriggerServerEvent('nnadmin:spectateCommand', data.current.value + 1)
            end
            if data.current.value == 'endspectate' then
                TriggerServerEvent('nnadmin:spectateCommand', nil)
            end
            if data.current.value == 'heal' then
                TriggerServerEvent('nnadmin:callHeal', data.elements[1].value + 1)
            end
            if data.current.value == 'revive' then
                TriggerServerEvent('nnadmin:callRevive', data.elements[1].value + 1)
            end
            if data.current.value == 'resit' then
                TriggerServerEvent('nnadmin:spectateCommand', nil)
                TriggerServerEvent('nnadmin:callResit', data.elements[1].value + 1)
            end
            if data.current.value == 'vyreseno' then
                TriggerServerEvent('nnadmin:spectateCommand', nil)
                TriggerServerEvent('nnadmin:callVyreseno')
            end
		end,
        function(data, menu)
			menu.close()
		end
	)
end