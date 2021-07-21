---------------------------------------------------------------------
                --[[SCRIPT MADE BY : ALEXMIHAI04]]--
               --[[DO NOT SELL OR COPY THIS SCRIPT]]--
                   --[[github.com/ItsAlexYTB]]--
        --[[ENJOY THE SCRIPT , DO NOT MAKE 1000 NPCS :))))) ]]
---------------------------------------------------------------------

--[[EXPLANATION [EN]: 

-1,2,3 : Coordonates
-4 : Name for the drawtext
-5 : Ped heading
-6 : Ped hash
-7: Ped model

]]--

--[[DO NOT TOUCH IF YOU DON'T KNOW WHAT YOU DO]]--

--[[EXPLANATION [RO]
-1,2,3 : sunt coordonatele de la npc
-4 : Numele care apare deasupra npc-ului
-5 : Heading (partea in care sta orientat)
-6 : Hash de la ped , se poate lua de pe net
-7 : Modelul de la ped , asemenea , il gasiti pe net


]]--

local sitAnimation = {dist = 'timetable@amanda@drunk@base', anim = 'base'}
local crossArms = {dist = "anim@amb@nightclub@peds@", anim = 'rcmme_amanda1_stand_loop_cop'}
local wait = {dist = 'random@shop_tattoo', anim = '_idle_a'}
local lean = {dist = 'amb@world_human_leaning@female@wall@back@holding_elbow@idle_a', anim = 'idle_a'}
local sit6 = {dist = "timetable@jimmy@mics3_ig_15@", anim = "idle_a_jimmy"}

local coordonate = {
    {1374.72,-701.82,65.95,"",258.93,0x917ED459,"mp_m_weed_01"},
	{1809.35,3913.38,36.17,"",37.17,0x696BE0A9,"a_m_y_methhead_01"},
	{298.73,-1777.75,27.06,"",37.17,0xA28E71D7,"csb_g"},
	{210.35,-94.72,72.19,"",171.48,0x681BD012,"a_m_m_og_boss_01"},
	{206.91,-95.63,72.24,"",246.2,0x98C7404F,"a_m_y_stbla_02"},
    {124.95,-1182.88,28.5,"",211.56,0xE497BBEF,"s_m_y_dealer_01"},
    
   {1469.62, 1138.09, 113.32,"",96.95,0xFCFA9E1E,"a_c_cow", true},
   {1461.38, 1138.21, 113.32,"",83.62,0xFCFA9E1E,"a_c_cow", true},

   -- BALLAS
   {113.49, -1950.85, 19.75,"",40.58,0x231AF63F,"g_m_y_ballaorig_01", true, crossArms},
   {103.97, -1921.72, 19.74,"",149.56,0x23B88069,"g_m_y_ballasout_01", true, crossArms},
   {118.23, -1928.27, 19.74,"",149.56,0x23B88069,"g_m_y_ballasout_01", true, sitAnimation},
   {80.15, -1935.8, 19.78,"",350.65,0xABEF0004,"csb_ballasog", true, sitAnimation},
   {118.45, -1940.74, 19.69,"",86.79,0x231AF63F,"g_m_y_ballaorig_01", true, wait},
   {104.73, -1959.34, 19.81,"",163.79,0x231AF63F,"g_m_y_ballaorig_01", true, wait},

   -- BLOODS
   {1305.06, -1727.56, 53.18,"",25.32,0x9D0087A8,"ig_claypain", true, lean},
   {1292.63, -1720.1, 53.03,"",205.6,0x9D0087A8,"ig_claypain", true, sit6},
   {1286.12, -1735.78, 51.86,"",294.11,0x9D0087A8,"ig_claypain", true, lean},
   {1250.99, -1756.7, 48.26,"",81.11,0x9D0087A8,"ig_claypain", true, crossArms},
   {1320.61, -1720.82, 53.93,"",304.25,0x9D0087A8,"ig_claypain", true, crossArms},
   {1302.85, -1736.85, 52.88,"",37.86,0x9D0087A8,"ig_claypain", true, wait},

   -- POLICIE
   {433.57, -978.36, 29.71,"",88.16,0x5E3DA4A4,"s_m_y_cop_01", true, wait},
   {419.4, -985.27, 28.41,"",85.13,0x5E3DA4A4,"s_m_y_cop_01", true, crossArms},
   {414.17, -1029.0, 28.55,"",15.5,0x5E3DA4A4,"s_m_y_cop_01", true, crossArms},
   {465.7, -1021.16, 31.98,"",268.22,0x5E3DA4A4,"s_m_y_cop_01", true, crossArms},

   -- EMS
  -- {299.28, -587.21, 42.28,"",263.28,0xDA2C984E,"mp_m_securoguard_01", true, crossArms},
  -- {326.92, -591.07, 42.28,"",102.06,0xDA2C984E,"mp_m_securoguard_01", true, crossArms},
  -- {309.63, -593.87, 42.28,"",23.66,0xD47303AC,"s_m_m_doctor_01", true},
--    GALDIN SECURITY
--    {-2195.47, -625.76, 11.71,"",280.56,0xDA2C984E,"mp_m_securoguard_01"},
--    {-2195.43, -621.0, 11.71,"",248.47,0xDA2C984E,"mp_m_securoguard_01"},
--    {-2253.34, -628.93, 13.83,"",0.15,0xDA2C984E,"mp_m_securoguard_01"},
--    {-2284.65, -621.07, 9.29,"",166.26,0xDA2C984E,"mp_m_securoguard_01"},
--    {-2321.09, -645.19, 8.73,"",352.39,0xDA2C984E,"mp_m_securoguard_01"},
}

Citizen.CreateThread(function()

    for _,v in pairs(coordonate) do
      RequestModel(GetHashKey(v[7]))
      while not HasModelLoaded(GetHashKey(v[7])) do
        Wait(1)
      end
  
      if not v[8] then 
        RequestAnimDict("mini@strip_club@idles@bouncer@base")
        while not HasAnimDictLoaded("mini@strip_club@idles@bouncer@base") do
            Wait(1)
        end
      end

      if v[9] then
        RequestAnimDict(v[9].dist)
        while not HasAnimDictLoaded(v[9].dist) do
            Wait(1)
        end
      end

      ped =  CreatePed(4, v[6],v[1],v[2],v[3], 3374176, false, true)
      SetEntityHeading(ped, v[5])
      FreezeEntityPosition(ped, true)
      SetEntityInvincible(ped, true)
      SetBlockingOfNonTemporaryEvents(ped, true)
      if not v[8] then
        TaskPlayAnim(ped,"mini@strip_club@idles@bouncer@base","base", 8.0, 0.0, -1, 1, 0, 0, 0, 0)
      end
      if v[9] then
        TaskPlayAnim(ped,v[9].dist,v[9].anim, 8.0, 0.0, -1, 1, 0, 0, 0, 0)
      end
    end
end)

-- Citizen.CreateThread(function()
--     while true do
--         local pos = GetEntityCoords(GetPlayerPed(-1), true)
--         Citizen.Wait(0)
--         for _,v in pairs(coordonate) do
--             x = v[1]
--             y = v[2]
--             z = v[3]
--             if(Vdist(pos.x, pos.y, pos.z, x, y, z) < 20.0)then
--                 DrawText3D(x,y,z+2.10, "~g~"..v[4], 1.2, 1)
--                 DrawText3D(x,y,z+1.95, "~w~", 1.0, 1)
--             end
--         end
--     end
-- end)


-- function DrawText3D(x,y,z, text, scl, font) 

--     local onScreen,_x,_y=World3dToScreen2d(x,y,z)
--     local px,py,pz=table.unpack(GetGameplayCamCoords())
--     local dist = GetDistanceBetweenCoords(px,py,pz, x,y,z, 1)
 
--     local scale = (1/dist)*scl
--     local fov = (1/GetGameplayCamFov())*100
--     local scale = scale*fov
   
--     if onScreen then
--         SetTextScale(0.0*scale, 1.1*scale)
--         SetTextFont(font)
--         SetTextProportional(1)
--         SetTextColour(255, 255, 255, 255)
--         SetTextDropshadow(0, 0, 0, 0, 255)
--         SetTextEdge(2, 0, 0, 0, 150)
--         SetTextDropShadow()
--         SetTextOutline()
--         SetTextEntry("STRING")
--         SetTextCentre(1)
--         AddTextComponentString(text)
--         DrawText(_x,_y)
--     end
-- end

-- --[[ENJOY]]--