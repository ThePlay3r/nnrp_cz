local ESX = nil

TriggerEvent('esx:getShILovePizzaaredObjILovePizzaect', function(obj) ESX = obj end)

local function Sell(source)
    local xPlayer = ESX.GetPlayerFromId(source)
    local itemsSold = 0
    local totalCash = 0
    local itemsToSold = Config.Zones['Sell'].Items

	for k,v in ipairs(itemsToSold) do
        if xPlayer.getInventoryItem(v.item).count > 0 then
            local playerCount = xPlayer.getInventoryItem(v.item).count
            itemsSold = itemsSold + playerCount
            totalCash = totalCash + (playerCount * v.price)
            xPlayer.removeInventoryItem(v.item, playerCount)
        end
    end

    if itemsSold == 0 then
        xPlayer.showNotification('Nemas nic na prodej.')
    else
        local societyAccount = nil
        TriggerEvent('esx_addonaccount:getSharedAccount', 'society_unicorn', function(account)
            societyAccount = account
        end)

        if societyAccount ~= nil then
            societyAccount.addMoney(totalCash * 0.60)
            xPlayer.addMoney(totalCash * 0.40)
            xPlayer.showNotification('Prodal/a jsi ' .. itemsSold .. ' vyrobku za ' .. math.floor(totalCash * 0.40) .. '$ pro sebe a ' .. math.floor(totalCash * 0.60) .. '$ pro firmu.')

            local msg = GetPlayerName(source) .. " prodal/a " .. itemsSold .. " vyrobku za " .. math.floor(totalCash * 0.40) .. '$ pro sebe a ' .. math.floor(totalCash * 0.60) .. '$ pro firmu.'
		    local url = "https://discord.com/api/webhooks/737739020674531399/wiS8G7gvDfhxT3-WJEPwlaoYrLTA9O-JjzmoGnFGa0iPQWeaJMBGjLWSP1qtaZbWv0iA"
            PerformHttpRequest(url, function(a,b,c)end, "POST", json.encode({content = msg}), {["Content-Type"]="application/json"})

            itemsSold = 0
            totalCash = 0
        end
    end
end

RegisterServerEvent('esx_unicorn2:startSell')
AddEventHandler('esx_unicorn2:startSell', function()
	local _source = source
    Sell(_source)
end)


-- FARMING
local FarmingPlayers = {}

RegisterServerEvent('esx_unicorn2:startFarming')
AddEventHandler('esx_unicorn2:startFarming', function(item)
    local _source = source
    
    if not FarmingPlayers[_source] then
        local timeHash = os.time()
        FarmingPlayers[_source] = timeHash

        local xPlayer = ESX.GetPlayerFromId(_source)
        harvest(_source, xPlayer, item, timeHash)
    end
end)


function harvest (source, xPlayer, item, timeHash)
    if FarmingPlayers[source] then
        local itemQuantity = xPlayer.getInventoryItem(item).count
        if itemQuantity >= xPlayer.getInventoryItem(item).limit then
            xPlayer.showNotification(_U('not_enough_place'))
            return
        else
            SetTimeout(Config.HarvestTime, function()
                if FarmingPlayers[source] == timeHash then
                    xPlayer.addInventoryItem(item, 1)
                    harvest(source, xPlayer, item, timeHash)
                end
            end)
        end
	end
end

RegisterServerEvent('esx_unicorn2:stopFarming')
AddEventHandler('esx_unicorn2:stopFarming', function()
    local _source = source
    FarmingPlayers[_source] = false
end)

local TransformingPlayers = {}

RegisterServerEvent('esx_unicorn2:startTransform')
AddEventHandler('esx_unicorn2:startTransform', function()
    local _source = source
    
    if not TransformingPlayers[_source] then
        local timeHash = os.time()
        TransformingPlayers[_source] = timeHash

        local xPlayer = ESX.GetPlayerFromId(_source)
        transform(_source, xPlayer, timeHash)
    end
end)


function transform (source, xPlayer, timeHash)
    if TransformingPlayers[source] then
        local photoQ = xPlayer.getInventoryItem('vanilla_photos').count
		local magaL = xPlayer.getInventoryItem('vanilla_magazines').limit
		local magaQ = xPlayer.getInventoryItem('vanilla_magazines').count
        
        if magaQ + 1 <= magaL then
            if photoQ >= Config.PhotosReq then
                SetTimeout(Config.CraftTime, function()
                    if TransformingPlayers[source] == timeHash then
                        xPlayer.removeInventoryItem('vanilla_photos', Config.PhotosReq)
                        xPlayer.addInventoryItem('vanilla_magazines', 1)
                        transform(source, xPlayer, timeHash)
                    end
                end)
            else
                xPlayer.showNotification('Nemas dostatek fotek')
                return
            end
        else
            xPlayer.showNotification('Nemas dostatek mista v inventari')
            return
        end
	end
end

RegisterServerEvent('esx_unicorn2:stopTransform')
AddEventHandler('esx_unicorn2:stopTransform', function()
    local _source = source
    TransformingPlayers[_source] = false
end)