local ESX = nil
TriggerEvent('esx:getShILovePizzaaredObjILovePizzaect', function(obj) ESX = obj end)

local function logEntityCreating(embeds, source)
    local url = 'https://discordapp.com/api/webhooks/734380077545947166/TFrn_Qp6IOAAns9hL2_FrYeS3HPaBy68PNhS-K08SJMoPfeiwa5JjQweCz37Nnsqvu0r'
	PerformHttpRequest(url, function(a,b,c)end, "POST", json.encode({embeds = embeds}), {["Content-Type"]="application/json"})
end

local Entities = {
    Type = {
        [0] = 'Nic',
        [1] = 'Ped',
        [2] = 'Vozidlo',
        [3] = 'Objekt'
    }
}

local TrackedEntity = {
    "hei_prop_carrier_radar_1_l1",
    "v_res_mexball",
    "prop_rock_1_a",
    "prop_rock_1_b",
    "stt_prop_stunt_jump45",
    "stt_prop_stunt_jump15",
    "sr_prop_spec_tube_xxs_01a",
    "stt_prop_stunt_jump30",
    "stt_prop_stunt_jump_l",
    "ar_prop_ar_stunt_block_01a",
    "stt_prop_stunt_track_bumps",
    "stt_prop_stunt_jump_lb",
    "stt_prop_stunt_jump_loop",
    "stt_prop_stunt_jump_m",
    "stt_prop_stunt_jump_mb",
    "stt_prop_stunt_jump_s",
    "stt_prop_stunt_jump_sb",
    "stt_prop_ramp_adj_flip_m",
    "prop_contnr_pile_01a",
    "ce_xr_ctr2",
    "hei_prop_carrier_jet",
    "stt_prop_stunt_track_start",
    "prop_parking_hut_2",
    "db_apart_03_",
    "db_apart_09_",
    "stt_prop_stunt_tube_l",
    "stt_prop_stunt_track_dwuturn",
    "stt_prop_ramp_adj_flip_mb",
    "stt_prop_ramp_adj_flip_s",
    "stt_prop_ramp_adj_flip_sb",
    "stt_prop_ramp_adj_hloop",
    "stt_prop_ramp_adj_loop",
    "stt_prop_ramp_jump_l",
    "stt_prop_ramp_jump_m",
    "stt_prop_ramp_jump_s",
    "stt_prop_ramp_jump_xl",
    "stt_prop_ramp_jump_xs",
    "stt_prop_ramp_jump_xxl",
    "stt_prop_ramp_multi_loop_rb",
    "stt_prop_ramp_spiral_l",
    "stt_prop_ramp_spiral_l_l",
    "stt_prop_ramp_spiral_l_m",
    "stt_prop_ramp_spiral_l_s",
    "stt_prop_ramp_spiral_l_xxl",
    "stt_prop_ramp_spiral_m",
    "stt_prop_ramp_spiral_s",
    "stt_prop_ramp_spiral_xxl",
    "prop_fnclink_05crnr1",
    "xs_prop_hamburgher_wl",
    "xs_prop_plastic_bottle_wl",
    "prop_windmill_01",
    "prop_beach_fire",
    "p_spinning_anus_s"
}

local EntityHashes = {}

for k,v in ipairs(TrackedEntity) do
    EntityHashes[GetHashKey(v)] = v
end

AddEventHandler('entityCreated', function(entity)
    if not DoesEntityExist(entity) then
        return
    end

    local _entity = entity
    local model = GetEntityModel(_entity)
    if not EntityHashes[model] then
        return
    end

    local _source = NetworkGetEntityOwner(_entity)
    local xPlayer = ESX.GetPlayerFromId(_source)
    local time = os.date("%d.%m.%Y %X")
    local name = GetPlayerName(_source)
    local identifier = GetPlayerIdentifiers(_source)[1]
    local entityType = GetEntityType(_entity)
    local coords = GetEntityCoords(_entity)
    local playerCoords = GetEntityCoords(GetPlayerPed(_source))

    local info = {
        Cas = time,
        Jmeno = name,
        Hex = identifier,
        ['Nazev entity'] = EntityHashes[model],
        ['Typ entity'] = Entities.Type[entityType],
        ['Souradnice hrace'] = "\nX: " .. playerCoords.x .. '\nY: ' .. playerCoords.y .. '\nZ: ' .. playerCoords.z .. '',
        ['Souradnice entity'] = "\nX: " .. coords.x .. '\nY: ' .. coords.y .. '\nZ: ' .. coords.z .. '',
    }
    
    local message = ''
    for k,v in pairs(info) do
        message = message .. '\n**' .. k .. '**: ' .. tostring(v)
    end
    local embeds = {
        {
            ["title"] = Entities.Type[entityType] .. ' - ' .. name,
            ["description"] = message,
            ["type"] = "rich",
            ["color"] = 65280,
        }
    }
    logEntityCreating(embeds, _source)
end)