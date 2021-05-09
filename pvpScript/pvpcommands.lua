local tplocation = vector3(219.8, -2547.01, 6.21) -- redzone
local tplocation2 = vector3(-1109.05, -2855.05, 13.96) -- airport

print("Jorgees pvpScript")

RegisterCommand("a", function()
    Citizen.Wait(1000)
    local playerPed = GetPlayerPed(-1)
    AddArmourToPed(playerPed, 100)
	SetPedArmour(playerPed, 100)
    BeginTextCommandThefeedPost("STRING")
    AddTextComponentSubstringPlayerName("~h~ ~b~ Armored")
    EndTextCommandThefeedPostTicker(true, true)
end)

RegisterCommand("h", function()
    Citizen.Wait(1000)
    local playerPed = GetPlayerPed(-1)
    local health = GetEntityHealth(playerPed)
	local maxHealth = GetEntityMaxHealth(playerPed)
	local newHealth = math.min(maxHealth, math.floor(health + maxHealth / 1)) 
    SetEntityHealth(playerPed, newHealth)
    BeginTextCommandThefeedPost("STRING")
    AddTextComponentSubstringPlayerName("~h~ ~g~ Healed")
    EndTextCommandThefeedPostTicker(true, true)
end)

RegisterCommand("ap", function()
    Citizen.Wait(1000)
    GiveWeaponToPed(PlayerPedId(), "WEAPON_APPISTOL", 250, true, true)
    BeginTextCommandThefeedPost("STRING")
    AddTextComponentSubstringPlayerName("~h~ ~r~ You were given an APPistol")
    EndTextCommandThefeedPostTicker(true, true)
end)

local cars = {"divo", "g500", "rs615", "nh2r", "yz450"}
RegisterCommand("spawncar", function()
    local car = (cars[math.random(#cars)])
    spawnCar(car)
end)

function spawnCar(car)
    local car = GetHashKey(car)

    RequestModel(car)
    while not HasModelLoaded(car) do 
        RequestModel(car)
        Citizen.Wait(0)
    end

    local x, y, z = table.unpack(GetEntityCoords(GetPlayerPed(-1), false))
    local vehicle = CreateVehicle(car, x + 2, y + 2, z + 1, 0.0, true, false)
    SetEntityAsMissionEntity(vehicle, true, true)
    Citizen.Wait(500)
    BeginTextCommandThefeedPost("STRING")
    AddTextComponentSubstringPlayerName("~h~ ~w~ Car Spawned")
    EndTextCommandThefeedPostTicker(true, true)
end

RegisterCommand("redzone", function()
    local playerPed = GetPlayerPed(-1)
    local ped = PlayerPedId()
    SetEntityCoords(ped, tplocation.x, tplocation.y, tplocation.z, false, false, false, true) -- Native that teleports you 
    BeginTextCommandThefeedPost("STRING")
    AddTextComponentSubstringPlayerName("~b~ Teleported To Redzone")
    EndTextCommandThefeedPostTicker(true, true)
end)

RegisterCommand("airport", function()
    local playerPed = GetPlayerPed(-1)
    local ped = PlayerPedId()
    SetEntityCoords(ped, tplocation2.x, tplocation2.y, tplocation2.z, false, false, false, true) -- Native that teleports you 
    BeginTextCommandThefeedPost("STRING")
    AddTextComponentSubstringPlayerName("~b~ Teleported To Airport")
    EndTextCommandThefeedPostTicker(true, true)
end)

Citizen.CreateThread(function()
    Wait(50)
    while true do
        miid2(0.657, 1.435, 1.0,1.0,0.50, "~r~ Discord.gg/MU4AZGz")
        Citizen.Wait(0)
    end
end)

function miid2(x,y ,width,height,scale, text, r,g,b,a, outline)
    SetTextFont(4)
    SetTextProportional(0)
    SetTextScale(scale, scale)
	SetTextColour( 0,0,0, 255 )
    SetTextDropShadow(0, 0, 0, 0,255)
    SetTextEdge(1, 0, 0, 0, 255)
    SetTextDropShadow()
	SetTextOutline()
    SetTextEntry("STRING")
    AddTextComponentString(text)
    DrawText(x - width/2, y - height/2 + 0.030)
end

-- ID Script was made by https://github.com/FranLopezZ/ShowOwnID
Citizen.CreateThread(function()
    Wait(50)
    while true do
        miid(0.660, 1.435, 1.0,1.0,0.50, "~r~ID:~r~  ".. GetPlayerServerId(NetworkGetEntityOwner(GetPlayerPed(-1))) .. '', 255, 255, 255, 255)
        Citizen.Wait(1)
    end
end)

function miid(x,y ,width,height,scale, text, r,g,b,a, outline)
    SetTextFont(4)
    SetTextProportional(0)
    SetTextScale(scale, scale)
	SetTextColour( 0,0,0, 255 )
    SetTextDropShadow(0, 0, 0, 0,255)
    SetTextEdge(1, 0, 0, 0, 255)
    SetTextDropShadow()
	SetTextOutline()
    SetTextEntry("STRING")
    AddTextComponentString(text)
    DrawText(x - width/2, y - height/2 + 0.002)
end
-- End of ID Script  

Citizen.CreateThread(function()
    for k,v in pairs(Config.Zones) do
        local blip = AddBlipForRadius(v.x, v.y, v.z , 175.0) 
        --you can use a higher number for a bigger zone
    
            SetBlipHighDetail(blip, true)
            SetBlipColour(blip, 1)
            SetBlipAlpha (blip, 128)
            local blip = AddBlipForCoord(v.x, v.y, v.z)
    
            SetBlipSprite (blip, v.sprite)
            SetBlipDisplay(blip, 4)
            SetBlipScale  (blip, 1.5)
            SetBlipColour (blip, v.color)
            SetBlipAsShortRange(blip, true)
    
            BeginTextCommandSetBlipName("STRING")
            AddTextComponentString(v.name)
            EndTextCommandSetBlipName(blip)
        end
    end)  

    
Citizen.CreateThread(function()
    for k,v in pairs(Config.Zones2) do
        local blip = AddBlipForRadius(v.x, v.y, v.z , 175.0) 
        --you can use a higher number for a bigger zone
    
            SetBlipHighDetail(blip, true)
            SetBlipColour(blip,2)
            SetBlipAlpha (blip, 128)
            local blip = AddBlipForCoord(v.x, v.y, v.z)
    
            SetBlipSprite (blip, v.sprite)
            SetBlipDisplay(blip, 4)
            SetBlipScale  (blip, 1.5)
            SetBlipColour (blip, v.color)
            SetBlipAsShortRange(blip, true)
    
            BeginTextCommandSetBlipName("STRING")
            AddTextComponentString(v.name)
            EndTextCommandSetBlipName(blip)
        end
    end)  