local Messages = {}
local ESX = nil
TriggerEvent('esx:getShILovePizzaaredObjILovePizzaect', function(obj) ESX = obj end)

TriggerEvent('es:addGroupCommand', 'pm', "helper", function(source, args, user)
	local arguments = args
	local target = args[1]
	table.remove(arguments, 1)
	local text = table.concat(arguments, " ")
	local msg = "^1PM Admin " .. GetPlayerName(source) .. ": " .. text
	
	TriggerClientEvent('chat:addMessage', source, {args = {'^1PM Admin: Zprava odeslana'}})
	discordPeEmLog(msg, target, source)

	if source ~= target then
		Messages[GetPlayerName(target)] = {
			msg = msg,
			admin = source,
		}
		TriggerClientEvent('chat:addMessage', target, {args = {msg}})
		TriggerClientEvent('chat:addMessage', target, {args = {'^1PM Admin: ^0Pro odpoved muzes pouzit ^3/opm TEXT^0'}})
	end
end, {help = "Odeslat nekomu PM", params = {
  {name = "ID", help = "ID hrace"},
  {name = "text", help = "text"},
}})

TriggerEvent('es:addGroupCommand', 'opm', "user", function(source, args, user)
  	local arguments = args
	local text = table.concat(arguments, " ")
	local playerName = GetPlayerName(source)
	local msg = "^1PM Odpoved " .. playerName .. ": " .. text

	  if Messages[playerName] then
		discordPeEmLog(msg, source, Messages[playerName].admin)
		TriggerClientEvent('chat:addMessage', source, {args = {'^1PM: Odpoved odeslana'}})
		TriggerClientEvent('chat:addMessage', Messages[playerName].admin, {args = {msg}})
		Messages[playerName] = nil
	else
		TriggerClientEvent('chat:addMessage', source, {args = {'^1PM: Nemas na co odpovedet'}})
  	end
end, {help = "Odpovedet na posledni PM", params = {
	{name = "text", help = "text"},
}})

function discordPeEmLog(text, target, source)
	local time = os.date("%d/%m/%Y %X")
	local name = GetPlayerName(source)
	local targeter = GetPlayerName(target) .. ' ' .. target
	local identifier = GetPlayerIdentifiers(source)
	local msg = time .. ' : ' .. name .. ' - ' .. identifier[1] .. ' [ ' .. targeter .. ' ] : ' .. text
	local url = "https://discordapp.com/api/webhooks/732332445600579645/WKRnLXLoYWxewa0KYyU7z4VymWU9C5Cg8IElxqTieH15Ul8kcsHRXApM_J8nFn9nSInA"
	PerformHttpRequest(url, function(a,b,c)end, "POST", json.encode({content = msg}), {["Content-Type"]="application/json"})
end