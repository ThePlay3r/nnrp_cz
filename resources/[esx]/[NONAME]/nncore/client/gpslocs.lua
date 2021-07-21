local ESX = nil
local CustomLocations = nil
TriggerEvent('esx:getShILovePizzaaredObjILovePizzaect', function(obj) ESX = obj end)

local Locations = {
	['Hlavni garaz'] = vector3(220.03, -814.61, 30.97),
	['<span style="font-weight:bold; text-transform: uppercase;">Nemocnice</span>'] = vector3(299.58, -581.8, 43.26),
	['<span style="font-weight:bold; text-transform: uppercase;">Policejni stanice</span>'] = vector3(431.29, -985.18, 30.71),
	-- ['<span style="font-weight:bold; text-transform: uppercase;">Sheriffove Paleto</span>'] = vector3(-438.14, 6018.11, 31.49),
	-- ['Sheriffove Sandy'] = vector3(1860.92, 3681.79, 33.77),
	['<span style="font-weight:bold; text-transform: uppercase;">Hasici</span>'] = vector3(-1672.95, 80.79, 65.2),
	['<span style="font-weight:bold; text-transform: uppercase;">Vlada</span>'] = vector3(-538.84, -231.07, 37.03),
	['Bennys'] = vector3(-202.53, -1307.98, 31.29), 
	['Ammu-nation'] = vector3(17.97, -1119.65, 28.9), 
	['Vinice'] = vector3(-1898.12, 2039.63, 141.85), 	
	['Vanilla'] = vector3(135.35, -1304.9, 29.15),
	['Galdin'] = vector3(-2074.64, -494.4, 12.29),
	['Zensai'] = vector3(113.12, -1036.32, 29.34),
	['Urad prace'] = vector3(-261.11, -977.31, 31.22),
	-- ['Casino'] = vector3(925.66, 52.0, 81.11),
	['Autosalon PDM'] = vector3(-61.52, -1100.66, 26.35),
	['GYM'] = vector3(-1207.48, -1570.4, 4.54),
	['Autobazar Mosley'] = vector3(2129.29, 3882.52, 33.18),
	['Steakhouse'] = vector3(-702.22, 5805.73, 17.29),
	['Zamecnik'] = vector3(174.55, -1798.02, 29.09),
	['Lovecka oblast'] = vector3(-810.58, 5409.83, 34.13),
	['Yellow Jack'] = vector3(1995.22, 3056.64, 47.05),
	['Vrakoviste'] = vector3(1366.13, -2083.65, 52.0),
	['Kostel'] = vector3(-1680.02, -295.02, 51.81),
	['Farma ONeill'] = vector3(2470.41, 4954.37, 45.11),
	['Pivovar'] = vector3(843.98, -1949.94, 29.0),
	['Ranch'] = vector3(1392.89, 1116.81, 114.84),
	['Medusa klub'] = vector3(761.48, -553.82, 32.79),
	['Hotel'] = vector3(-853.52, -1278.43, 5.15),
	['Kavarna'] = vector3(-630.44, 240.47, 81.9),
	['Atomic'] = vector3(482.42, -1890.06, 26.09),
	['Autobazar Benefactor'] = vector3(-91.69, 77.82, 71.51),
	['Dovoz importovanych aut'] = vector3(-915.98, -235.07, 39.67),
	['EasyWay Delivery'] = vector3(484.07, -3050.74, 6.23),
}

function openBasicGPSLocsMenu ()
	local elements = {}

	for k, v in pairs(Locations) do
		table.insert(elements, {value = {x = v.x, y = v.y, z = v.z}, label = k})
	end

	table.sort(elements, function(a,b)
		return a.label < b.label
	end)

	ESX.UI.Menu.Open(
		'default', GetCurrentResourceName(), 'gpsLocsMenu',
		{
			title = 'GPS Lokace',
			align = 'left',
			elements = elements,
		},
		function(data, menu)
			ESX.ShowNotification('Nastavena GPS pozice na ' .. data.current.label)
			SetNewWaypoint(data.current.value.x, data.current.value.y)
		end,
		function(data, menu)
			menu.close()
		end
	)
end

function openCustomGPSLocsMenu (isEdit)
	if not CustomLocations then
		ESX.TriggerServerCallback('gpslocs:getCustomLocations', function(locations)
			CustomLocations = locations
			openCustomGPSLocsMenuFinal(isEdit)
		end)
	else
		openCustomGPSLocsMenuFinal(isEdit)
	end
end

function openCustomGPSLocsMenuFinal (isEdit)
	local elements = {}

	for k, v in pairs(CustomLocations) do
		local position = json.decode(v.location)
		table.insert(elements, {value = position, label = v.label, id = v.id})
	end

	if #CustomLocations < 1 then
		elements = {value = 'none', label = 'Nemas zadnou vlastni lokaci nastavenou'}
	else
		table.sort(elements, function(a,b)
			return a.label < b.label
		end)
	end

	local title = 'GPS Vlastni Lokace'
	if isEdit then
		title = 'GPS Vlastni Lokace - mazani'
	end

	ESX.UI.Menu.Open(
		'default', GetCurrentResourceName(), 'gpsLocsMenu',
		{
			title = title,
			align = 'left',
			elements = elements,
		},
		function(data, menu)
			if data.current.value ~= 'none' then
				if isEdit then
					ESX.TriggerServerCallback('gpslocs:deleteCustomLocation', function(saved)
						if saved then
							ESX.ShowNotification('Smazana GPS pozice ' .. data.current.label)
							CustomLocations = nil
							openCustomGPSLocsMenu(isEdit)
						else
							ESX.ShowNotification('GPS pozici se nepodarilo smazat')
						end
					end, data.current.id)				
				else
					ESX.ShowNotification('Nastavena GPS pozice na ' .. data.current.label)
					SetNewWaypoint(data.current.value.x, data.current.value.y)
				end
			end
		end,
		function(data, menu)
			menu.close()
		end
	)
end

function handleSaveGPSLocs()
	local WaypointHandle = GetFirstBlipInfoId(8)

	if DoesBlipExist(WaypointHandle) then
		local waypointCoords = GetBlipInfoIdCoord(WaypointHandle)
		ESX.UI.Menu.Open(
			'dialog', GetCurrentResourceName(), 'GPSLokaceNazev',
			{
			  title = 'Vlastni GPS Lokace - Nazev'
			},
			function(data, menu)
				if data.value then
					local label = data.value
					menu.close()
					ESX.TriggerServerCallback('gpslocs:saveCustomLocation', function(saved)
						if saved then
							CustomLocations = nil
							ESX.ShowNotification('Nova GPS pozice ulozena')
						else
							ESX.ShowNotification('Novou GPS pozici se nepodarilo ulozit')
						end
					end, label, json.encode({x = waypointCoords.x, y = waypointCoords.y}))
				end
			end,
			function(data, menu)
				menu.close()
			end
		)
	else
		ESX.ShowNotification('Musis nejdriv umistit waypoint na mapu.')
	end
end

function OpenGPSLocsMenu ()
	ESX.UI.Menu.Open(
		'default', GetCurrentResourceName(), 'gpsLocsMenuMain',
		{
			title = 'GPS Lokace',
			align = 'left',
			elements = {
				{value = 'basic', label = 'Zakladni lokace'},
				{value = 'custom', label = 'Vlastni lokace'},
				{value = 'clear', label = 'Zrusit aktualni waypoint'},
				{value = 'save', label = 'Vytvorit vlastni lokaci'},
				{value = 'edit', label = 'Mazani vlastnich lokaci'},
			},
		},
		function(data, menu)
			if data.current.value == 'basic' then
				openBasicGPSLocsMenu()
			end
			if data.current.value == 'custom' then
				openCustomGPSLocsMenu(false)
			end
			if data.current.value == 'clear' then
				ESX.ShowNotification('Aktualni waypoint zrusen')
				SetWaypointOff()
			end
			if data.current.value == 'save' then
				handleSaveGPSLocs()
			end
			if data.current.value == 'edit' then
				openCustomGPSLocsMenu(true)
			end
		end,
		function(data, menu)
			menu.close()
		end
	)
end