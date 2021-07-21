local isChatVisible = true
local group = 'user'

RegisterNetEvent('nnadmin:setGroup')
AddEventHandler('nnadmin:setGroup', function(g)
	group = g
end)

RegisterNetEvent('sendMessageAdmin')
AddEventHandler('sendMessageAdmin', function(id, name, message)

	if isChatVisible == false then
		return
	end

	local myId = PlayerId()
	local pid = GetPlayerFromServerId(id)

	if pid == myId then
		TriggerEvent('chatMessage', "", {255, 0, 0}, " [A-CHAT] | " .. name .." [ID: " .. id .. "] "..":^0  " .. message)
	elseif group ~= 'user' and pid ~= myId then
		TriggerEvent('chatMessage', "", {255, 0, 0}, " [A-CHAT] | " .. name .." [ID: " .. id .. "] "..":^0  " .. message)
	end
end)


RegisterCommand('achaton', function(source, args)
	isChatVisible = true
	TriggerEvent('chatMessage', 'A-CHAT: ', {255, 0, 0}, "Zapnul sis viditelnost chatu.")
end)

RegisterCommand('achatoff', function(source, args)
	isChatVisible = false
	TriggerEvent('chatMessage', 'A-CHAT: ', {255, 0, 0}, "Vypnul sis viditelnost chatu.")
end)


Citizen.CreateThread(function()
	TriggerEvent('chat:addSuggestion', '/achaton',  'Zapnout admin chat')
	TriggerEvent('chat:addSuggestion', '/achatoff',  'Vypnout admin chat')
end)

AddEventHandler('onResourceStop', function(resource)
	if resource == GetCurrentResourceName() then
		TriggerEvent('chat:removeSuggestion', '/achaton')
		TriggerEvent('chat:removeSuggestion', '/achatoff')
	end
end)
