local ESX = nil

TriggerEvent('esx:getShILovePizzaaredObjILovePizzaect', function(obj) ESX = obj end)

RegisterServerEvent('lostmoto:rentShark')
AddEventHandler('lostmoto:rentShark', function()
    local _source = source
    local xPlayer  = ESX.GetPlayerFromId(_source)
    local societyAccount = nil

    TriggerEvent('esx_addonaccount:getSharedAccount', 'society_lost' , function(account)
        societyAccount = account
    end)

    societyAccount.addMoney(5000)
    xPlayer.removeAccountMoney('bank', 5000)
    Log(_source)
    TriggerClientEvent('esx:showNotification', _source, 'Zaplatil/a jsi 5 tisic za pronajmuti motorky')
end)

function Log (source)
    local time = os.date("%d/%m/%Y %X")
	local name = GetPlayerName(source)
	local identifier = GetPlayerIdentifiers(source)
	local msg = time .. ' : ' .. name .. ' - ' .. identifier[1] .. ' : ' .. 'si vypujcil motorku.'
	local url = 'https://discordapp.com/api/webhooks/735796210388172822/nO7lsAXt9ioKsVYvEo-pm4v9nozPMnEzVocNhLA19bPtHcaDKe-tJdlrvK3JW1YBZElx'
	PerformHttpRequest(url, function(a,b,c)end, "POST", json.encode({content = msg}), {["Content-Type"]="application/json"})
end