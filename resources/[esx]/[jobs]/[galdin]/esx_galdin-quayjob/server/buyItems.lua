local ESX = nil

TriggerEvent('esx:getShILovePizzaaredObjILovePizzaect', function(obj) ESX = obj end)

RegisterServerEvent('esx_galdinjob:buyItem')
AddEventHandler('esx_galdinjob:buyItem', function(itemName, price, itemLabel)
    local itemMultiply = 25
    local _source = source
    local xPlayer  = ESX.GetPlayerFromId(_source)
    local limit = xPlayer.getInventoryItem(itemName).limit
    local qtty = xPlayer.getInventoryItem(itemName).count
    local societyAccount = nil

    TriggerEvent('esx_addonaccount:getSharedAccount', 'society_galdin', function(account)
        societyAccount = account
    end)

    if societyAccount ~= nil and societyAccount.money >= price * itemMultiply then
        if qtty < limit then
            societyAccount.removeMoney(price * itemMultiply)
            xPlayer.addInventoryItem(itemName, itemMultiply)
            discordLogBuy("koupil **25x " .. itemLabel .. "**", _source)
            TriggerClientEvent('esx:showNotification', _source, _U('bought') .. itemLabel)
        else
            TriggerClientEvent('esx:showNotification', _source, _U('max_item'))
        end
    else
        TriggerClientEvent('esx:showNotification', _source, _U('pasassezargent'))
    end

end)

function discordLogBuy(text, source)
	local time = os.date("%d.%m.%Y %X")
	local name = GetPlayerName(source)
	local identifier = GetPlayerIdentifiers(source)
	local msg = time .. ' : ' .. name .. ' - ' .. identifier[1] .. ' : ' .. text
	local url = "https://discordapp.com/api/webhooks/720582297178603581/B-xR0Vid5I-Nd_5vzQs2kmBQBWWbpYxVY3c_NBGv3mSKijk2-eN4l9Uh1xeA4A5wc387"
	PerformHttpRequest(url, function(a,b,c)end, "POST", json.encode({content = msg}), {["Content-Type"]="application/json"})
end