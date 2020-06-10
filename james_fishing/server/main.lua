ESX = nil

local cachedData = {}

TriggerEvent("esx:getSharedObject", function(library) 
	ESX = library 
end)

local sendNotification = function(player, notification)
	TriggerClientEvent("esx:showNotification", player["source"], notification)
end

ESX.RegisterUsableItem(Config.FishingItems["rod"]["name"], function(source)
	TriggerClientEvent("james_fishing:tryToFish", source)
end)

ESX.RegisterServerCallback("james_fishing:receiveItem", function(source, callback)
	local player = ESX.GetPlayerFromId(source)

	if not player then return callback(false) end

	math.randomseed(os.time() * math.random())


	local common = Config.FishableItemsCommon
	local uncommon = Config.FishableItemsUncommon
	local rare = Config.FishableItemsRare
	local fishCaughtCommon = common[math.random(#common)]
	local fishCaughtUncommon = uncommon[math.random(#uncommon)]
	local fishCaughtRare = rare[math.random(#rare)]
	local itemCaught = math.random(1000)

	if itemCaught > 400 and itemCaught <= 1000 then
		player.addInventoryItem(fishCaughtCommon["name"], 1)
		player.removeInventoryItem(Config.FishingItems["bait"]["name"], 1)

	elseif itemCaught > 2 and itemCaught <= 302 then
		TriggerClientEvent('mythic_notify:client:SendAlert', source, {type = 'inform', text = 'The fish took your bait!', 2500})
		player.removeInventoryItem(Config.FishingItems["bait"]["name"], 1)

	elseif itemCaught > 302 and itemCaught <= 400 then
		player.addInventoryItem(fishCaughtUncommon["name"], 1)
		player.removeInventoryItem(Config.FishingItems["bait"]["name"], 1)

	elseif itemCaught <=2 then
		player.addInventoryItem(fishCaughtRare["name"], 1)
		player.removeInventoryItem(Config.FishingItems["bait"]["name"], 1)
	end

	

	if Config.CanBreakFishingRod then
		local breakIndex = math.random(100)

		if breakIndex <= 5 then
			player.removeInventoryItem(Config.FishingItems["rod"]["name"], 1)

			return callback(true, true)
		end
	end
	
	callback(true)
end)

ESX.RegisterServerCallback("james_fishing:sellFish", function(source, callback)
    local player = ESX.GetPlayerFromId(source)

    if not player then return callback(false) end
	local total = 0
	local totalFish = 0
	for k,v in ipairs(Config.fishToSell) do
		
        local fishPrice = v["price"]
		local fishCount = player.getInventoryItem(v.name).count

		totalFish = totalFish + fishCount

        if fishCount > 0 then
          player.addMoney(fishCount * fishPrice)
		  player.removeInventoryItem(v["name"], fishCount)
		end

	  total = total + (fishCount * fishPrice)

	end

	callback(total, totalFish)

end)
