-- local SocietyPassiveInfos = {}
-- local JobsCount = {}
-- local Messages = {}
-- local AtLeastOnePay = false

-- local ESX = nil
-- TriggerEvent('esx:getShILovePizzaaredObjILovePizzaect', function(obj) ESX = obj end)

-- local function loadData ()
-- 	MySQL.Async.fetchAll('SELECT * FROM addon_account_data WHERE passive_pay > 0', {}, function(result)
-- 		for i=1, #result, 1 do
-- 			table.insert(SocietyPassiveInfos, {
-- 				accountName = result[i].account_name,
-- 				money = result[i].money,
-- 				passivePay = result[i].passive_pay,
-- 			})
-- 		end
-- 	end)
-- end

-- MySQL.ready(function()
-- 	loadData()
-- end)

-- local function logPay(embeds, source)
--     local url = 'https://discordapp.com/api/webhooks/734656112166567977/3Nnc6fXIE5Epsmdy3hgdKIdYuGSb97NbQoRC5uyu7rK3f0HGoyvXb0RWn30mgs2le2Wx'
-- 	PerformHttpRequest(url, function(a,b,c)end, "POST", json.encode({embeds = embeds}), {["Content-Type"]="application/json"})
-- end

-- local function startPayTimer()
--     local oneCycleTime = 1000 * 60 * 10
-- 	SetTimeout(oneCycleTime, function()
-- 		TriggerEvent('jobscount:getJobs', function(savedJobs)
-- 			for k,v in pairs(savedJobs) do
-- 				if not JobsCount['society_' .. v] then
-- 					JobsCount['society_' .. v] = 0
-- 				end
-- 				JobsCount['society_' .. v] = JobsCount['society_' .. v] + 1
-- 			end
-- 			PayPassiveMoneyToFractions()
-- 			startPayTimer()
-- 		end)
--     end)
-- end
-- startPayTimer()

-- function PayPassiveMoneyToFractions ()
-- 	for k,v in ipairs(SocietyPassiveInfos) do
-- 		local societyJobCount = JobsCount[v.accountName]

-- 		if not JobsCount[v.accountName] or societyJobCount == 0 then
-- 			table.insert(Messages, "Frakce " .. v.accountName .. " nemela nikoho ve sluzbe.")
-- 		else
-- 			AtLeastOnePay = true
-- 			local societyAccount = nil

-- 			TriggerEvent('esx_addonaccount:getSharedAccount', v.accountName , function(account)
-- 				societyAccount = account
-- 			end)

-- 			table.insert(Messages, "Frakce " .. v.accountName .. " dostala **" .. v.passivePay .. "**. Predtim meli **" .. v.money .. "** a nyni maji **" .. v.money + v.passivePay .. "**")
-- 			societyAccount.addMoney(v.passivePay)
-- 			SocietyPassiveInfos[k].money = v.money + v.passivePay
-- 		end
-- 	end

-- 	local message = ''
--     for k,v in pairs(Messages) do
--         message = message .. '\n' .. v
--     end
--     local embeds = {
--         {
--             ["title"] = "Vyplaty - " .. os.date("%d.%m.%Y %X"),
--             ["description"] = message,
--             ["type"] = "rich",
--             ["color"] = 65280,
--         }
-- 	}
-- 	if AtLeastOnePay then
-- 		logPay(embeds)
-- 	end
-- 	JobsCount = {}
-- 	Messages = {}
-- 	AtLeastOnePay = false
-- end

-- TriggerEvent('es:addGroupCommand', 'reloadfp', 'superadmin', function (source, args, user)
-- 	SocietyPassiveInfos = {}
-- 	loadData()
-- end, true)
-- TriggerEvent('es:addGroupCommand', 'debugfp', 'superadmin', function (source, args, user)
-- 	print(ESX.DumpTable(SocietyPassiveInfos))
-- end, true)