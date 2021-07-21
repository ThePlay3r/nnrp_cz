local function logWeaponEvent (embeds, source)
	local url = "https://discordapp.com/api/webhooks/734349241765593150/Gnnf-IYC2M9jcmI6HrUaa3wYRIpUUYNs-E1XS9SAbX0Z_F5CtARS7uT6afveJ9kQajaZ"
	PerformHttpRequest(url, function(a,b,c)end, "POST", json.encode({ embeds = embeds }), {["Content-Type"]="application/json"})
end

local EventData = {
    damageType = {
        [0] = "Neznamy",
        [1] = "Zadne poskozeni (flare, snehova koule, jerrycan)",
        [2] = "Na blizko",
        [3] = "Naboj",
        [4] = "Nuceny ragdoll pad",
        [5] = "exploze (RPG, Railgun, granat)",
        [6] = "Ohen (molotov)",
        [8] = "Pad (pad heli)",
        [10] = "Elektrina",
        [11] = "Ostnatý drát",
        [12] = "Hasicak",
        [13] = "Plyn",
        [14] = "Vodni delo",
    }
}

local Weapons = {
	{
		name = 'WEAPON_KNIFE',
					},

	{
		name = 'WEAPON_NIGHTSTICK',
					},

	{
		name = 'WEAPON_HAMMER',
					},

	{
		name = 'WEAPON_BAT',
					},

	{
		name = 'WEAPON_GOLFCLUB',
					},

	{
		name = 'WEAPON_CROWBAR',
					},

	{
		name = 'WEAPON_PISTOL',
	},

	{
		name = 'WEAPON_COMBATPISTOL',
	},

	{
		name = 'WEAPON_APPISTOL',
	},

	{
		name = 'WEAPON_PISTOL50',
	},

	{
		name = 'WEAPON_REVOLVER',
},

	{
		name = 'WEAPON_SNSPISTOL',
	},

	{
		name = 'WEAPON_HEAVYPISTOL',
	},

	{
		name = 'WEAPON_VINTAGEPISTOL',
	},

	{
		name = 'WEAPON_MICROSMG',
	},

	{
		name = 'WEAPON_SMG',
	},

	{
		name = 'WEAPON_ASSAULTSMG',
	},

	{
		name = 'WEAPON_MINISMG',
	},

	{
		name = 'WEAPON_MACHINEPISTOL',
	},

	{
		name = 'WEAPON_COMBATPDW',
	},
	
	{
		name = 'WEAPON_PUMPSHOTGUN',
	},

	{
		name = 'WEAPON_SAWNOFFSHOTGUN',
	},

	{
		name = 'WEAPON_ASSAULTSHOTGUN',
	},

	{
		name = 'WEAPON_BULLPUPSHOTGUN',
	},

	{
		name = 'WEAPON_HEAVYSHOTGUN',
	},

	{
		name = 'WEAPON_ASSAULTRIFLE',
	},

	{
		name = 'WEAPON_CARBINERIFLE',
	},

	{
		name = 'WEAPON_ADVANCEDRIFLE',
	},

	{
		name = 'WEAPON_SPECIALCARBINE',
	},

	{
		name = 'WEAPON_BULLPUPRIFLE',
	},

	{
		name = 'WEAPON_COMPACTRIFLE',
	},

	{
		name = 'WEAPON_MG',
	},

	{
		name = 'WEAPON_COMBATMG',
	},

	{
		name = 'WEAPON_GUSENBERG',
	},

	{
		name = 'WEAPON_SNIPERRIFLE',
	},

	{
		name = 'WEAPON_HEAVYSNIPER',
	},

	{
		name = 'WEAPON_MARKSMANRIFLE',
	},

	{
		name = 'WEAPON_GRENADELAUNCHER',
					},

	{
		name = 'WEAPON_RPG',
					},

	{
		name = 'WEAPON_STINGER',
					},

	{
		name = 'WEAPON_MINIGUN',
					},

	{
		name = 'WEAPON_GRENADE',
					},

	{
		name = 'WEAPON_STICKYBOMB',
					},

	{
		name = 'WEAPON_SMOKEGRENADE',
					},

	{
		name = 'WEAPON_BZGAS',
					},

	{
		name = 'WEAPON_MOLOTOV',
					},

	{
		name = 'WEAPON_FIREEXTINGUISHER',
					},

	{
		name = 'WEAPON_PETROLCAN',
					},

	{
		name = 'WEAPON_DIGISCANNER',
					},

	{
		name = 'WEAPON_BALL',
					},

	{
		name = 'WEAPON_BOTTLE',
					},

	{
		name = 'WEAPON_DAGGER',
					},

	{
		name = 'WEAPON_FIREWORK',
					},

	{
		name = 'WEAPON_MUSKET',
					},

	{
		name = 'WEAPON_STUNGUN',
					},

	{
		name = 'WEAPON_HOMINGLAUNCHER',
					},

	{
		name = 'WEAPON_PROXMINE',
					},

	{
		name = 'WEAPON_SNOWBALL',
					},

	{
		name = 'WEAPON_FLAREGUN',
					},

	{
		name = 'WEAPON_GARBAGEBAG',
					},

	{
		name = 'WEAPON_HANDCUFFS',
					},

	{
		name = 'WEAPON_MARKSMANPISTOL',
					},

	{
		name = 'WEAPON_KNUCKLE',
					},

	{
		name = 'WEAPON_HATCHET',
					},

	{
		name = 'WEAPON_RAILGUN',
					},

	{
		name = 'WEAPON_MACHETE',
					},

	{
		name = 'WEAPON_SWITCHBLADE',
					},

	{
		name = 'WEAPON_DBSHOTGUN',
					},

	{
		name = 'WEAPON_AUTOSHOTGUN',
					},

	{
		name = 'WEAPON_BATTLEAXE',
					},

	{
		name = 'WEAPON_COMPACTLAUNCHER',
					},

	{
		name = 'WEAPON_PIPEBOMB',
					},

	{
		name = 'WEAPON_POOLCUE',
					},

	{
		name = 'WEAPON_WRENCH',
					},

	{
		name = 'WEAPON_FLASHLIGHT',
					},

	{
		name = 'GADGET_NIGHTVISION',
					},

	{
		name = 'GADGET_PARACHUTE',
					},

	{
		name = 'WEAPON_FLARE',
					},

	{
		name = 'WEAPON_DOUBLEACTION',
					}
}


AddEventHandler("weaponDamageEvent", function(sender, event)
    local time = os.date("%d.%m.%Y %X")
	local name = GetPlayerName(sender)
    local identifier = GetPlayerIdentifiers(sender)[1]
    local weaponLabel = event.weaponType

    for k, v in ipairs(Weapons) do
        if GetHashKey(v.name)== event.weaponType then
            weaponLabel = v.name
        end
    end
    local info = {
        Cas = time,
        Jmeno = name,
        Hex = identifier,
        ['Typ poskozeni'] = EventData.damageType[event.damageType],
        ['Typ zbrane'] = weaponLabel,
        ['Presah defaultniho poskozeni'] = event.overrideDefaultDamage,
        ['Ma cil zbran'] = event.hitEntityWeapon,
        ['Ma cil vylepseni zbrane'] = event.hitWeaponAmmoAttachment,
        ['Ma zbran tlumic'] = event.silenced,
        ['Flags poskozeni'] = event.damageFlags,
        ['Poskozeni zbrane'] = event.weaponDamage,
        ['Cas poskozeni'] = event.damageTime,
        ['Je poskozeni smrtici'] = event.willKill,
        ['Byl utocnik v aute?'] = event.hasVehicleData,
    }
    
    local message = ''
    for k,v in pairs(info) do
        message = message .. '\n**' .. k .. '**: ' .. tostring(v)
    end
    local embeds = {
        {
            ["title"] = GetPlayerName(sender),
            ["description"] = message,
            ["type"] = "rich",
            ["color"] = 65280,
        }
    }
    logWeaponEvent(embeds, sender)
end)