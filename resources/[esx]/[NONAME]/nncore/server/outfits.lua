local ESX = nil
local PlayerOutfits = {}
local SaveOnlyPlayers = {}

TriggerEvent('esx:getShILovePizzaaredObjILovePizzaect', function(obj) ESX = obj end)

function tablelength(T)
	local count = 0
	for _ in pairs(T) do count = count + 1 end
	return count
end


TriggerEvent('es:addGroupCommand', 'clearoutfits', 'helper', function(source, args, user)
    if not args[1] then
        TriggerClientEvent('chat:addMessage', source, { args = { '^1SYSTEM', 'Musis zadat ID!' } })
    else
		local target = tonumber(args[1])
		local identifier = GetPlayerIdentifiers(target)[1]
		if PlayerOutfits[identifier] then
			PlayerOutfits[identifier] = nil
		end
    end
end, function(source, args, user)
	TriggerClientEvent('chat:addMessage', source, { args = { '^1SYSTEM', 'Insufficient Permissions.' } })
end, {help = 'Vycisti cache outfitu hrace', params = {
    {name = 'ID'},
}})

ESX.RegisterServerCallback('nncore:getPlayerOutfits', function(source, cb)
	local identifier = GetPlayerIdentifiers(source)[1]

	if PlayerOutfits[identifier] and not SaveOnlyPlayers[identifier] then
		cb(PlayerOutfits[identifier])
		return
	end

	MySQL.Async.fetchAll('SELECT * FROM outfits WHERE identifier = @identifier', {
		['@identifier'] = identifier,
	}, function(results)
		for k, item in ipairs(results) do
			if not PlayerOutfits[identifier] then
				PlayerOutfits[identifier] = {}
			end

			PlayerOutfits[identifier][item.label] = {
				label = item.label,
				outfit = json.decode(item.outfit)
			}
		end
		SaveOnlyPlayers[identifier] = nil
		cb(PlayerOutfits[identifier])
	end)
end)

ESX.RegisterServerCallback('nncore:saveNewOutfit', function(source, cb, outfitLabel, skin)
	local identifier = GetPlayerIdentifiers(source)[1]
	if not PlayerOutfits[identifier] then
		PlayerOutfits[identifier] = {}
		SaveOnlyPlayers[identifier] = true
	end
	
	if PlayerOutfits[identifier][outfitLabel] or tablelength(PlayerOutfits[identifier]) >= 25 then
		cb(false)
		return
	end

	local skinTemplate = {
		tshirt_1 = skin.tshirt_1,  tshirt_2 = skin.tshirt_2,
        torso_1 = skin.torso_1,   torso_2 = skin.torso_2,
        decals_1 = skin.decals_1,   decals_2 = skin.decals_2,
        arms = skin.arms, arms_2 = skin.arms_2,
        pants_1 = skin.pants_1,   pants_2 = skin.pants_2,
        shoes_1 = skin.shoes_1,   shoes_2 = skin.shoes_2,
        helmet_1 = skin.helmet_1,  helmet_2 = skin.helmet_2,
        chain_1 = skin.chain_1,    chain_2 = skin.chain_2,
        bproof_1 = skin.bproof_1,  bproof_2 = skin.bproof_2,
        mask_1 = skin.mask_1,     mask_2 = skin.mask_2,
        ears_1 = skin.ears_1,     ears_2 = skin.ears_2,
        glasses_1 = skin.glasses_1,  glasses_2 = skin.glasses_2,
        bracelets_1 = skin.bracelets_1, bracelets_2 = skin.bracelets_2,
		watches_1 = skin.watches_1, watches_2 = skin.watches_2,
		bags_1 = skin.bags_1, bags_2 = skin.bags_2,
	}

	MySQL.Async.execute(
        "INSERT INTO outfits (identifier, label, outfit) VALUES(@identifier, @label, @outfit)",
        {
			["@identifier"] = identifier,
			["@label"] = outfitLabel,
			["@outfit"] = json.encode(skinTemplate),
		}, function(rowsChanged)
			if rowsChanged > 0 then
				PlayerOutfits[identifier][outfitLabel] = {
					label = outfitLabel,
					outfit = skinTemplate,
				}
				cb(true)
			else
				cb(false)
			end
		end
    )
end)

ESX.RegisterServerCallback('nncore:deleteOutfit', function(source, cb, label)
	local identifier = GetPlayerIdentifiers(source)[1]
	MySQL.Async.execute('DELETE FROM outfits WHERE identifier = @identifier AND label = @label', {
		['@identifier'] = identifier,
		['@label'] = label,
	}, function(rowsChanged)
		if rowsChanged > 0 then
			local savedOutfits = PlayerOutfits[identifier]
			PlayerOutfits[identifier] = {}
			for k,v in pairs(savedOutfits) do
				if k ~= label then
					PlayerOutfits[identifier][k] = v
				end
			end
			cb(true)
		else
			cb(false)
		end
	end)
end)