

HT = nil
TriggerEvent('HT_base:getBaseObjects', function(obj)
    HT = obj
end)


HT = nil

Citizen.CreateThread(function()
    while HT == nil do
        TriggerEvent('HT_base:getBaseObjects', function(obj) HT = obj end)
        Citizen.Wait(0)
    end
end)



Citizen.CreateThread(function()
    while true do
    local ped = PlayerPedId()
        Citizen.Wait(1)
                if GetDistanceBetweenCoords(GetEntityCoords(ped),442.0348815918,-1014.0873413086,28.634092330933, true) <= 2 then
                    DrawText3Ds(442.0348815918,-1014.0873413086,28.634092330933, "~r~[E]~w~ Åbn politi - garage") -- Jeg sætter altid z coords + 1 fordi så er den i rigtige højde
                    if IsControlJustReleased(0, 38) then
                        SetCam(true,450.37796020508,-1024.3536376953,33.607891082764, 200)
                        Wait(200)
                                opengarage()

                        end
                end
    end
end)

 -- 3D TEXT -- 
 function DrawText3Ds(x,y,z, text)
    local onScreen,_x,_y=World3dToScreen2d(x,y,z)
    local px,py,pz=table.unpack(GetGameplayCamCoords())
    SetTextScale(0.35, 0.35)
    SetTextFont(4)
    SetTextProportional(1)
    SetTextColour(255, 255, 255, 215)
    SetTextEntry("STRING")
    SetTextCentre(1)
    AddTextComponentString(text)
    DrawText(_x,_y)
    local factor = (string.len(text)) / 370
    DrawRect(_x,_y+0.0125, 0.015+ factor, 0.03, 20, 20, 20, 150)
end


--når man trykker e hvad der så kommer frem--
function opengarage()
    local elements = {
        { label = "Biler", value = "Biler"},
        { label = "civil", value = "civil"},
        { label = "Mortorcykler", value = "Motorcykler"},
        { label = "Luk", value = "luk"},
    }
    HT.UI.Menu.Open('default', GetCurrentResourceName(), "vrp_htmenu",
    {
        title    = "Politi-garage", -- Dette er navnet øverst i menuen
        align    = "right", -- Hvor den skal være henne, "top-left" "top-right" "buttom-left" "buttom-right".
        elements = elements -- Denne her går efter "local elements"
    },




    function(data, menu)
        menu = menu
        if(data.current.value == 'Biler') then -- Finder "value" som er "menupistoler" og hvis der er noget der hedder det og man klikker "Enter" på det så laver den det deri. Der må under ingen omstændigheder være "æ, ø, å"
            menu.close()
            Bilermenu()
            end
        if(data.current.value == 'civil') then -- Finder "value" som er "handvaaben" og hvis der er noget der hedder det og man klikker "Enter" på det så laver den det deri. Der må under ingen omstændigheder være "æ, ø, å"
            menu.close()
            civilmenu()
        end
        if(data.current.value == 'Motorcykler') then -- Finder "value" som er "handvaaben" og hvis der er noget der hedder det og man klikker "Enter" på det så laver den det deri. Der må under ingen omstændigheder være "æ, ø, å"
            menu.close()
            Motorcyklermenu()
        end
        if(data.current.value == 'luk') then -- Her siger den bare hvis man klikker "Luk" så lukker den.
            SetCam(false)
            menu.close()
        end
    end, function(data, menu)
        menu.close()
    end)
end



function Bilermenu()
    local elements = {
        { label = "Mercedes C250", value = "MercedesC250" },
        { label = "Volkswagen Touran", value = "VolkswagenTouran" },
        { label = "2020 Passat", value = "2020Passat" },
        { label = "Ford Mondeo ", value = "FordMondeoHund" },
        { label = "Oracle", value = "Oracle" },
        { label = "T6 Kta", value = "T6 Kta Vogn" },
        { label = "Arteon", value = "Arteon2021"},
        { label = "Luk", value = "Luk" },
    }
    HT.UI.Menu.Open('default', GetCurrentResourceName(), "vrp_htmenu",
    {
        title    = "Garage-politi", -- Dette er navnet øverst i menuen
        align    = "top-left", -- Hvor den skal være henne, "top-left" "top-right" "buttom-left" "buttom-right".
        elements = elements -- Denne her går efter "local elements"
    },

    function(data, menu)
        menu = menu
        if(data.current.value == 'MercedesC250') then
            TriggerEvent('MercedesC250')
            SetCam(false)
            menu.close()
    end
    
    
    if(data.current.value == 'VolkswagenTouran') then
        TriggerEvent('VolkswagenTouran')
        SetCam(false)
        menu.close()
    end
    
    
    if(data.current.value == '2020Passat') then
        TriggerEvent('2020Passat')
        SetCam(false)
        menu.close()
    end
    
    if(data.current.value == 'Oracle') then
        TriggerEvent('Oracle')
        SetCam(false)
        menu.close()
    end

    if(data.current.value == 'T6KtaVogn') then
        TriggerEvent('T6KtaVogn')
        SetCam(false)
        menu.close()
    end


    if(data.current.value == 'Arteon2021') then
        TriggerEvent('Arteon2021')
        SetCam(false)
        menu.close()
    end


    if(data.current.value == 'Luk') then -- Her siger den bare hvis man klikker "Luk" så lukker den.
        menu.close()
        SetCam(false)
        end
    end, function(data, menu)
        menu.close()
    end)
end


function civilmenu()
    local elements = {
        { label = "Schafter ", value = "Schafter" },
        { label = "Volkswagen T6", value = "VolkswagenT6" },
        { label = "Prado ", value = "Prado" },
        { label = "Ocelot ", value = "Ocelot" },
        { label = "Sentinel ", value = "Sentinel " },
        { label = "Luk", value = "Luk"}
    }
    HT.UI.Menu.Open('default', GetCurrentResourceName(), "vrp_htmenu",
    {
        title    = "Politi-Civil", -- Dette er navnet øverst i menuen
        align    = "top-left", -- Hvor den skal være henne, "top-left" "top-right" "buttom-left" "buttom-right".
        elements = elements -- Denne her går efter "local elements"
    },


    
    function(data, menu)
        menu = menu
        if(data.current.value == 'Schafter ') then
            TriggerEvent('Schafter')
            SetCam(false)
            menu.close()
    end
    
    
    if(data.current.value == 'VolkswagenT6') then
        TriggerEvent('VolkswagenT6')
        SetCam(false)
        menu.close()
    end
    
        
    if(data.current.value == 'Prado') then
        TriggerEvent('Prado')
        SetCam(false)
        menu.close()
    end

    
    if(data.current.value == 'Ocelot') then
        TriggerEvent('Ocelot')
        SetCam(false)
        menu.close()
    end
    
    
    if(data.current.value == 'tailgater') then
        TriggerEvent('tailgater')
        SetCam(false)
        menu.close()
    end
    
    if(data.current.value == 'Sentinel') then
        TriggerEvent('Sentinel')
        menu.close()
    end

    if(data.current.value == 'Luk') then
        SetCam(false)
        menu.close()
        end
    end, function(data, menu)
        menu.close()
    end)
end


function Specialstyrken()
    local elements = {
        { lavel = "XLS Romeovogn", value = "XLSRomeovogn"},
        { label = "Volkswagen Indsatsleder", value = "VolkswagenIndsatsleder" },
        { lavel = "Mercedes ", value = "MercedesGruppevogn"},
        { lavel = "Luk", value = "luk"},
        },
        HT.UI.Menu.Open('default', GetCurrentResourceName(), "vrp_htmenu",
        {
            title    = "Politi-Specail-styrke", -- Dette er navnet øverst i menuen
            align    = "top-left", -- Hvor den skal være henne, "top-left" "top-right" "buttom-left" "buttom-right".
            elements = elements -- Denne her går efter "local elements"
        },


        function(data, menu)
            menu = menu
            if(data.current.value == 'XLSRomeovogn') then
                TriggerEvent('XLSRomeovogn')
                SetCam(false)
                menuclose()
        end

        if(data.current.value == 'VolkswagenIndsatsleder') then
            TriggerEvent('VolkswagenIndsatsleder')
            SetCam(false)
            menu.close()
        end

        if(data.current.value == 'MercedesGruppevogn') then
            TriggerEvent('MercedesGruppevogn')
            SetCam(false)
            menu.close()
        end

        if(data.current.value == 'Luk') then
            SetCam(false)
            menu.close()
        end
        end, function(data, menu)
            menu.close()
        end)
    end





function Motorcyklermenu()
    local elements = {
        { label = "Kommer mere", value = "Motor" },
        { label = "Luk", value = "Luk"},
    }
    HT.UI.Menu.Open('default', GetCurrentResourceName(), "vrp_htmenu",
    {
        title    = "Politi-Civil", -- Dette er navnet øverst i menuen
        align    = "top-left", -- Hvor den skal være henne, "top-left" "top-right" "buttom-left" "buttom-right".
        elements = elements -- Denne her går efter "local elements"
    },


    
    function(data, menu)
        menu = menu
        if(data.current.value == 'Motor') then
            TriggerEvent('Motor')
            SetCam(false)
    end

    if(data.current.value == 'Luk') then
        SetCam(false)
        menu.close()
    end
    end, function(data, menu)
        menu.close()
    end)
end


-------------------------------------------------------


--normale biller                                    ---

-------------------------------------------------------

--202passat spawn--
RegisterNetEvent('MercedesC250')
AddEventHandler('MercedesC250', function()
    print(1)
    HT.Game.SpawnVehicle("devo10", vector3(454.6, -1017.4, 28.4), 100.0, function(vehicle)
       DoScreenFadeOut(1000)
       Citizen.Wait(2000)
       DoScreenFadeIn(1000)
       SetEntityVisible(spiller, true, false)
       print(2)
       SetEntityAsMissionEntity(vehicle, true, true)
       SetPedIntoVehicle(PlayerPedId(),vehicle,-1)
       FreezeEntityPosition(PlayerPedId(), false)
    end)
end)

RegisterNetEvent('VolkswagenTouran')
AddEventHandler('VolkswagenTouran', function()
    print(1)
    HT.Game.SpawnVehicle("devo3", vector3(454.6, -1017.4, 28.4), 100.0, function(vehicle)
        DoScreenFadeOut(1000)
        Citizen.Wait(2000)
        DoScreenFadeIn(1000)
       print(2)
       SetEntityAsMissionEntity(vehicle, true, true)
       SetPedIntoVehicle(PlayerPedId(),vehicle,-1)
       FreezeEntityPosition(PlayerPedId(), false)
    end)
end)



RegisterNetEvent('VolkswagenIndsatsleder')
AddEventHandler('VolkswagenIndsatsleder', function()
    print(1)
    HT.Game.SpawnVehicle("devo7", vector3(454.6, -1017.4, 28.4), 100.0, function(vehicle)
        DoScreenFadeOut(1000)
        Citizen.Wait(2000)
        DoScreenFadeIn(1000)
       print(2)
       SetEntityAsMissionEntity(vehicle, true, true)
       SetPedIntoVehicle(PlayerPedId(),vehicle,-1)
       FreezeEntityPosition(PlayerPedId(), false)
    end)
end)

RegisterNetEvent('2020Passat')
AddEventHandler('2020Passat', function()
    print(1)
    HT.Game.SpawnVehicle("devo6", vector3(454.6, -1017.4, 28.4), 100.0, function(vehicle)
        DoScreenFadeOut(1000)
        Citizen.Wait(2000)
        DoScreenFadeIn(1000)
       print(2)
       SetEntityAsMissionEntity(vehicle, true, true)
       SetPedIntoVehicle(PlayerPedId(),vehicle,-1)
       FreezeEntityPosition(PlayerPedId(), false)
    end)
end)

RegisterNetEvent('Oracle')
AddEventHandler('Oracle', function()
    print(1)
    HT.Game.SpawnVehicle("fbi", vector3(454.6, -1017.4, 28.4), 100.0, function(vehicle)
        DoScreenFadeOut(1000)
        Citizen.Wait(2000)
        DoScreenFadeIn(1000)
       print(2)
       SetEntityAsMissionEntity(vehicle, true, true)
       SetPedIntoVehicle(PlayerPedId(),vehicle,-1)
       FreezeEntityPosition(PlayerPedId(), false)
    end)
end)


RegisterNetEvent('T6KtaVogn')
AddEventHandler('T6KtaVogn', function()
    print(1)
    HT.Game.SpawnVehicle("devo17", vector3(454.6, -1017.4, 28.4), 100.0, function(vehicle)
        DoScreenFadeOut(1000)
        Citizen.Wait(2000)
        DoScreenFadeIn(1000)
       print(2)
       SetEntityAsMissionEntity(vehicle, true, true)
       SetPedIntoVehicle(PlayerPedId(),vehicle,-1)
       FreezeEntityPosition(PlayerPedId(), false)
    end)
end)

RegisterNetEvent('Arteon2021')
AddEventHandler('Arteon2021', function()
    print(1)
    HT.Game.SpawnVehicle("devo5", vector3(454.6, -1017.4, 28.4), 100.0, function(vehicle)
        DoScreenFadeOut(1000)
        Citizen.Wait(2000)
        DoScreenFadeIn(1000)
       print(2)
       SetEntityAsMissionEntity(vehicle, true, true)
       SetPedIntoVehicle(PlayerPedId(),vehicle,-1)
       FreezeEntityPosition(PlayerPedId(), false)
    end)
end)

------------------------------------------------------
--                                                  --
--                    civil                         --
--                                                  --
------------------------------------------------------















-----------------------civil------------------------------


RegisterNetEvent('MercedesGruppevogn')
AddEventHandler('MercedesGruppevogn', function()
    print(1)
    HT.Game.SpawnVehicle("devo12", vector3(454.6, -1017.4, 28.4), 100.0, function(vehicle)
       print(2)
       SetEntityAsMissionEntity(vehicle, true, true)
       SetPedIntoVehicle(PlayerPedId(),vehicle,-1)
       FreezeEntityPosition(PlayerPedId(), false)
    end)
end)





















--aks styrken
RegisterNetEvent('MercedesGruppevogn')
AddEventHandler('MercedesGruppevogn', function()
    print(1)
    HT.Game.SpawnVehicle("devo12", vector3(454.6, -1017.4, 28.4), 100.0, function(vehicle)
       print(2)
       SetEntityAsMissionEntity(vehicle, true, true)
       SetPedIntoVehicle(PlayerPedId(),vehicle,-1)
       FreezeEntityPosition(PlayerPedId(), false)
    end)
end)




--SetCam funktion
function SetCam(onoff, CamX, CamY, CamZ, CamH)
    if onoff == true then
        if CurrentCam ~= 0 then 
            DestroyCam(CurrentCam)
        end
        CurrentCam = CreateCam("DEFAULT_SCRIPTED_CAMERA", true)
        SetCamCoord(CurrentCam, CamX, CamY, CamZ, CamH)
        SetCamRot(CurrentCam, -21.637795701623, 0.0, CamH)
        SetCamActive(CurrentCam, true)
        RenderScriptCams(1, 1, 750, 1, 1)
    else
        SetCamActive(CurrentCam, false)
        DestroyCam(CurrentCam)
        DetachCam(CurrentCam)
        RenderScriptCams(false, true, 2000, true, true)
    end
end

--Brug function
--SetCam(true,cfg.setcam1[1],cfg.setcam1[2],cfg.setcam1[3],cfg.setcam1[4])


--Slå den fra
--SetCam(false)
