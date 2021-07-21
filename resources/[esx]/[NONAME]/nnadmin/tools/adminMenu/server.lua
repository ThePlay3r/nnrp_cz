TriggerEvent('es:addGroupCommand', 'nnmenu', 'helper', function(source, args, user)
    TriggerClientEvent('nnadmin:OpnMn', source)
end, function(source, args, user)
    TriggerClientEvent('chat:addMessage', source, { args = { '^1SYSTEM', 'Nedostatečné oprávnění!' } })
end)

-- PlayerData
local PlayerSources = {}

-- RegisterServerEvent('nnadmin:registerUserData')
-- AddEventHandler('nnadmin:registerUserData', function()
--     local playerId = source
--     PlayerSources[playerId] = playerId .. ' ' .. GetPlayerName(playerId)
--     TriggerClientEvent('nnadmin:receivePlayerSources', -1, PlayerSources)
-- end)


-- AddEventHandler('playerDropped', function()
-- 	local playerId = source

-- 	if playerId then
--         for k,v in pairs(PlayerSources) do
--             if k == playerId then
--                 table.remove(PlayerSources, k)
--             end
--         end
--         TriggerClientEvent('nnadmin:receivePlayerSources', -1, PlayerSources)
-- 	end
-- end)