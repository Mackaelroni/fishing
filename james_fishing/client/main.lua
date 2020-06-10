
ESX = nil

cachedData = {
	
}

Citizen.CreateThread(function()
	while not ESX do
		--Fetching esx library, due to new to esx using this.

		TriggerEvent("esx:getSharedObject", function(library) 
			ESX = library 
		end)

		Citizen.Wait(0)
	end

	if Config.Debug then
		ESX.UI.Menu.CloseAll()

		RemoveLoadingPrompt()

		SetOverrideWeather("EXTRASUNNY")

		Citizen.Wait(2000)

		TriggerServerEvent("esx:useItem", Config.FishingItems["rod"]["name"])
	end
end)

RegisterNetEvent("esx:playerLoaded")
AddEventHandler("esx:playerLoaded", function(playerData)
	ESX.PlayerData = playerData
end)

RegisterNetEvent("esx:setJob")
AddEventHandler("esx:setJob", function(newJob)
	ESX.PlayerData["job"] = newJob
end)

RegisterNetEvent("james_fishing:tryToFish")
AddEventHandler("james_fishing:tryToFish", function()
	TryToFish()
end)

Citizen.CreateThread(function()
	Citizen.Wait(500) -- Init time.

	HandleStore()

	while true do
		local sleepThread = 500

		local ped = cachedData["ped"]
		
		if DoesEntityExist(cachedData["storeOwner"]) then
			local pedCoords = GetEntityCoords(ped)

			local dstCheck = #(pedCoords - GetEntityCoords(cachedData["storeOwner"]))

			if dstCheck < 3.0 then
				sleepThread = 5

				exports['mythic_notify']:PersistentAlert('start', 'sellFishAlert', 'inform', 'Press E to sell your fish')
	
				if IsControlJustPressed(0, 38) then
					SellFish()
				end

				exports['mythic_notify']:PersistentAlert('end', 'sellFishAlert')

			end
		end
		
		Citizen.Wait(sleepThread)
	end
end)

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(1500)

		local ped = PlayerPedId()

		if cachedData["ped"] ~= ped then
			cachedData["ped"] = ped
		end
	end
end)

Citizen.CreateThread(function()
    exports['NoLimits_Libs']:RegisterBlip({
        -- Blip Name
        name = 'La Spada Fish Restaurant',
        -- Coords :p
        coords = {
          x = -1037.824,
          y = -1397.13,
          z = 4.56552,
		},
        -- Sprite -> https://docs.fivem.net/docs/game-references/blips/
        sprite = 371,
        -- Color -> https://docs.fivem.net/docs/game-references/blips/
        color = 29,
        -- Scale (NOT REQUIRED), [Default Is 0.7]
        scale = 0.7
    })
end)

