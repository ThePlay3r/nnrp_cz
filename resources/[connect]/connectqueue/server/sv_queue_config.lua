Config = {}

-- priority list can be any identifier. (hex steamid, steamid32, ip) Integer = power over other people with priority
-- a lot of the steamid converting websites are broken rn and give you the wrong steamid. I use https://steamid.xyz/ with no problems.
-- you can also give priority through the API, read the examples/readme.
Config.Priority = {
	["steam:11000010517d3db"] = 100, -- dralons
	["steam:110000104791abd"] = 100, -- zeihi
	["steam:1100001000e838e"] = 100, -- westrider
	["steam:110000118c46f97"] = 100, -- dk
	["steam:1100001128eb77f"] = 80, -- knowie
	["steam:110000135679f43"] = 80, -- ann.fairy
	["steam:11000011afca7d9"] = 80, -- fewii
	["steam:11000010b068700"] = 80, -- askelo
	["steam:110000105aa5eec"] = 70, -- JaHeslo
	["steam:1100001056de7eb"] = 70, -- MustangCZ
	["steam:1100001136b577d"] = 70, -- Kloky
	["steam:11000013f697143"] = 70, -- papucky
	["steam:11000010d3a84f6"] = 70, -- snowkey
	["steam:11000010721615d"] = 60, -- twinki
	["steam:11000010efbcb97"] = 60, -- horac
	["steam:1100001025cb42b"] = 60, -- arnold
	["steam:11000010ecc3b49"] = 60, -- darthVader
	-- GOLD
	["steam:1100001097b8f7a"] = 40, -- NagoDragonov
	["steam:110000115e4868a"] = 40, -- Andrejkm
	["steam:110000111ef2265"] = 40, -- reys
	["steam:110000115e5de9d"] = 40, -- kenewhik
	["steam:11000010743687a"] = 40, -- ohny
	["steam:11000011cc702b4"] = 40, -- lety32cz
	["steam:110000105eaa7d7"] = 40, -- MaRa
	["steam:1100001061f9e6f"] = 40, -- Eddie
	["steam:11000011b08a6cf"] = 45, -- KargoCZ
	["steam:1100001053785b0"] = 40, -- Faestos
	["steam:110000105bd0c45"] = 40, -- CAPPY
	["steam:1100001041ad9d0"] = 40, -- Hast0n
	["steam:11000010a4d4dea"] = 40, -- nezdarka
	["steam:1100001177b9c41"] = 40, -- Dragolord9
	["steam:11000011a75b718"] = 40, -- Sophia22
	["steam:1100001097fd165"] = 40, -- ThePoik
	["steam:11000010c855ab5"] = 40, -- Patrik0504
	["steam:110000133f3938b"] = 40, -- Vapper
	["steam:110000106d20c99"] = 40, -- SpliceeCZ
	["steam:1100001152720cb"] = 40, -- rajsmi
	["steam:11000010b57ef61"] = 40, -- FOXTER-BOI
	["steam:11000010978f62a"] = 40, -- Kakashi
	["steam:11000013de424b8"] = 40, -- Kafermanky
	["steam:11000013493a43b"] = 40, -- Cizinkaa
	["steam:1100001097264b4"] = 40, -- DanielBorales
	["steam:11000010ab1b65a"] = 40, -- Images
	["steam:11000010aaae7d9"] = 40, -- Bemk0
	["steam:110000105818f22"] = 40, -- Prcek
	-- SILVER
	["steam:11000011b1ce2ca"] = 25, -- Brainy
	["steam:11000011763877b"] = 25, -- Dirato105
	-- BRONZE
	["steam:11000011580e29b"] = 15, -- FranklinBob
}

-- require people to run steam
Config.RequireSteam = true

-- "whitelist" only server
Config.PriorityOnly = false

-- disables hardcap, should keep this true
Config.DisableHardCap = true

-- will remove players from connecting if they don't load within: __ seconds; May need to increase this if you have a lot of downloads.
-- i have yet to find an easy way to determine whether they are still connecting and downloading content or are hanging in the loadscreen.
-- This may cause session provider errors if it is too low because the removed player may still be connecting, and will let the next person through...
-- even if the server is full. 10 minutes should be enough
Config.ConnectTimeOut = 600

-- will remove players from queue if the server doesn't recieve a message from them within: __ seconds
Config.QueueTimeOut = 90

-- will give players temporary priority when they disconnect and when they start loading in
Config.EnableGrace = true

-- how much priority power grace time will give
Config.GracePower = 35

-- how long grace time lasts in seconds
Config.GraceTime = 480

-- on resource start, players can join the queue but will not let them join for __ milliseconds
-- this will let the queue settle and lets other resources finish initializing
Config.JoinDelay = 3000

-- will show how many people have temporary priority in the connection message
Config.ShowTemp = false

-- simple localization
Config.Language = {
    joining = "\xF0\x9F\x8E\x89Pripojovani...",
    connecting = "\xE2\x8F\xB3Pripojovani...",
    idrr = "\xE2\x9D\x97[QUEUE] Error: Nebylo mozne ziskat tvoje udaje. Zkus prosim restart.",
    err = "\xE2\x9D\x97[QUEUE] Vyskytl se error",
    pos = "\xF0\x9F\x90\x8CJsi %d/%d ve frontě \xF0\x9F\x95\x9C%s",
    connectingerr = "\xE2\x9D\x97[QUEUE] Nastala chyba pri pridavani do fronty",
    timedout = "\xE2\x9D\x97[QUEUE] Pripojeni vyprselo",
    wlonly = "\xE2\x9D\x97[QUEUE] Pro hrani na tomto serveru musis mit udelany whitelist.",
    steam = "\xE2\x9D\x97 [QUEUE] Musis mit zapnuty steam."
}