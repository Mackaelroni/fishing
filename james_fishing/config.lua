Config = {}

Config.Debug = false -- only in dev mode.

Config.MarkerData = {
    ["type"] = 6,
    ["size"] = vector3(0.0, 0.0, 0.0),
    ["color"] = vector3(0, 0, 0)
}

Config.FishingRestaurant = {
    ["name"] = "La Spada Fish Restaurant",
    ["blip"] = {
        ["sprite"] = 628,
        ["color"] = 3
    },
    ["ped"] = {
        ["model"] = 0xED0CE4C6,
        ["position"] = vector3(-1037.824, -1397.13, 4.56552),
        ["heading"] = 75.0
    }
}

Config.sellFish = 51 -- Key to sell fish. "E"
Config.CanBreakFishingRod = true -- If enabled there is a 5% that the rod would be destroyed upon use.

Config.FishingItems = {
    ["rod"] = {
        ["name"] = "fishingrod",
        ["label"] = "Fishing Rod",
        ["price"] = 100,
        ["limit"] = 5
    },
    ["bait"] = {
        ["name"] = "fishingbait",
        ["label"] = "Fishing Bait",
        ["price"] = 5,
        ["limit"] = 50
    },
    ["marlin"] = {
        ["name"] = "marlin",
        ["label"] = "Marlin",
        ["price"] = 15,
        ["limit"] = 3
    },
    ["tuna"] = {
        ["name"] = "tuna",
        ["label"] = "Tuna",
        ["price"] = 50,
        ["limit"] = 3
    },
    ["grouper"] = {
        ["name"] = "grouper",
        ["label"] = "Grouper",
        ["price"] = 25,
        ["limit"] = 5
    },
    ["shark"] = {
        ["name"] = "shark",
        ["label"] = "Shark",
        ["price"] = 100,
        ["limit"] = 1
    },
    ["flounder"] = {
        ["name"] = "flounder",
        ["label"] = "Flounder",
        ["price"] = 15,
        ["limit"] = 5
    },
    ["largemouth bass"] = {
        ["name"] = "largemouth_bass",
        ["label"] = "Largemouth Bass",
        ["price"] = 15,
        ["limit"] = 5
    },
    ["smallmouth bass"] = {
        ["name"] = "smallmouth_bass",
        ["label"] = "Smallmouth Bass",
        ["price"] = 15,
        ["limit"] = 5
    },
    ["catfish"] = {
        ["name"] = "catfish",
        ["label"] = "Catfish",
        ["price"] = 15,
        ["limit"] = 5
    },
    ["carp"] = {
        ["name"] = "carp",
        ["label"] = "Carp",
        ["price"] = 15,
        ["limit"] = 5
    },
    ["bluegil"] = {
        ["name"] = "bluegil",
        ["label"] = "Bluegil",
        ["price"] = 15,
        ["limit"] = 5
    },
    ["plastic"] = {
        ["name"] = "plastic",
        ["label"] = "Plastic",
        ["price"] = 1,
        ["limit"] = 25
    },
    ["beer bottle"] = {
        ["name"] = "beer_bottle",
        ["label"] = "Beer Bottle",
        ["price"] = 1,
        ["limit"] = 25
    },
    ["aluminum can"] = {
        ["name"] = "aluminum_can",
        ["label"] = "Coke Can",
        ["price"] = 1,
        ["limit"] = 25
    },
    ["sunglasses"] = {
        ["name"] = "sunglasses",
        ["label"] = "Sunglasses",
        ["price"] = 1,
        ["limit"] = 25
    },
    ["boot"] = {
        ["name"] = "boot",
        ["label"] = "Boot",
        ["price"] = 1,
        ["limit"] = 25
    },
    ["fishing hat"] = {
        ["name"] = "fishing_hat",
        ["label"] = "Fishing Hat",
        ["price"] = 1,
        ["limit"] = 25
    },
    ["Stacy's Wig"] = {
        ["name"] = "stacy_wig",
        ["label"] = "Stacy's Wig",
        ["price"] = 1,
        ["limit"] = 1
    },
    ["DB Briefcase"] = {
        ["name"] = "db_briefcase",
        ["label"] = "DB Briefcase",
        ["price"] = 1,
        ["limit"] = 25
    },
    ["stuffed animal"] = {
        ["name"] = "stuffed_animal",
        ["label"] = "Stuffed Animal",
        ["price"] = 1,
        ["limit"] = 25
    },
    ["romaine lettuce"] = {
        ["name"] = "romaine_lettuce",
        ["label"] = "Romaine Lettuce",
        ["price"] = 1,
        ["limit"] = 25
    },
    ["toilet seat"] = {
        ["name"] = "toilet_seat",
        ["label"] = "Toilet Seat",
        ["price"] = 1,
        ["limit"] = 25
    },
    ["ring"] = {
        ["name"] = "ring",
        ["label"] = "Ring",
        ["price"] = 1,
        ["limit"] = 25
    }
}

Config.FishableItemsCommon = {
    Config.FishingItems["largemouth bass"],
    Config.FishingItems["smallmouth bass"],
    Config.FishingItems["catfish"],
    Config.FishingItems["carp"],
    Config.FishingItems["bluegil"],
    Config.FishingItems["boot"],
    Config.FishingItems["toilet seat"],
    Config.FishingItems["romaine lettuce"],
    Config.FishingItems["stuffed animal"],
    Config.FishingItems["fishing hat"],
    Config.FishingItems["sunglasses"],
    Config.FishingItems["beer bottle"],
    Config.FishingItems["marlin"],
    Config.FishingItems["tuna"],
    Config.FishingItems["grouper"],
    Config.FishingItems["flounder"],
    Config.FishingItems["shark"],
    Config.FishingItems["aluminum can"]

}

Config.FishableItemsUncommon = {
    Config.FishingItems["ring"]
}

Config.FishableItemsRare = {
    Config.FishingItems["Stacy's Wig"],
    Config.FishingItems["DB Briefcase"]
}

Config.fishToSell = {
    Config.FishingItems["largemouth bass"],
    Config.FishingItems["smallmouth bass"],
    Config.FishingItems["catfish"],
    Config.FishingItems["carp"],
    Config.FishingItems["bluegil"],
    Config.FishingItems["marlin"],
    Config.FishingItems["tuna"],
    Config.FishingItems["grouper"],
    Config.FishingItems["shark"],
    Config.FishingItems["flounder"]
}

Config.Command = "none" -- if set to "" or "none" command will not work. otherwise item use will be used.

table.count = function(table)
    if not table then return end
    if not type(table) == "table" then return end

    local count = 0

    for k, v in pairs(table) do
        count = count + 1
    end

    return count
end

vectorzero = vector3(0.0, 0.0, 0.0)