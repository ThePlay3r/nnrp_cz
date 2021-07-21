local ESX = nil

TriggerEvent('esx:getShILovePizzaaredObjILovePizzaect', function(obj) ESX = obj end)

local function Sell(source)
    local xPlayer = ESX.GetPlayerFromId(source)
    local itemsSold = 0
    local totalCash = 0
    local itemsToSold = Config.Zones['Sell'].Items

    for k,v in ipairs(itemsToSold) do
        if xPlayer.getInventoryItem(v.item) and xPlayer.getInventoryItem(v.item).count > 0 then
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
        TriggerEvent('esx_addonaccount:getSharedAccount', 'society_galdin', function(account)
            societyAccount = account
        end)

        if societyAccount ~= nil then
            societyAccount.addMoney(totalCash * 0.50)
            xPlayer.addMoney(totalCash * 0.50)
            xPlayer.showNotification('Prodal/a jsi ' .. itemsSold .. ' vyrobku za ' .. totalCash * 0.50 .. ' pro sebe a ' .. totalCash * 0.50 .. ' pro Bar.')

            local msg = GetPlayerName(source) .. " prodal/a " .. itemsSold .. " vyrobku za " .. totalCash * 0.50 .. ' pro sebe a ' .. totalCash * 0.50 .. ' pro Bar.'
		    local url = "https://discordapp.com/api/webhooks/707174677658730496/TTJWEXj6yUgfaB-JHcqaQ099jaxI9Jk575QS3EQxWUVyjYgrNvNqE-0h9V95T3j5Jiqg"
            PerformHttpRequest(url, function(a,b,c)end, "POST", json.encode({content = msg}), {["Content-Type"]="application/json"})

            itemsSold = 0
            totalCash = 0
        end
    end
end

RegisterServerEvent('esx_galdinjob:startSell')
AddEventHandler('esx_galdinjob:startSell', function()
	local _source = source
    Sell(_source)
end)