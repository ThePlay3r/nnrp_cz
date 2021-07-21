local ESX = nil

TriggerEvent('esx:getShILovePizzaaredObjILovePizzaect', function(obj) ESX = obj end)

RegisterServerEvent('skutry:rentShark')
AddEventHandler('skutry:rentShark', function()
    local _source = source
    local xPlayer  = ESX.GetPlayerFromId(_source)
    local societyAccount = nil

    TriggerEvent('esx_addonaccount:getSharedAccount', 'society_galdin' , function(account)
        societyAccount = account
    end)

    societyAccount.addMoney(15000)
    xPlayer.removeAccountMoney('bank', 15000)
    Log(_source)
    TriggerClientEvent('esx:showNotification', _source, 'Zaplatil/a jsi 15 tisic za pronajmuti skutru')
end)

function Log (source)
    local time = os.date("%d/%m/%Y %X")
	local name = GetPlayerName(source)
	local identifier = GetPlayerIdentifiers(source)
	local msg = time .. ' : ' .. name .. ' - ' .. identifier[1] .. ' : ' .. 'si vypujcil skutr.'
	local url = "https://discordapp.com/api/webhooks/711603983491268638/7oYjaNjmgxTV6KkHuw809biSBAIZ0xFjnfr7JU9KejlzynjA5OMI7I7jZVSsznlTPTks"
	PerformHttpRequest(url, function(a,b,c)end, "POST", json.encode({content = msg}), {["Content-Type"]="application/json"})
end