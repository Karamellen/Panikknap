vRP = Proxy.getInterface("vRP")
vRPclient = Tunnel.getInterface("vRP","panikknap")

HT = nil
Citizen.CreateThread(function()
    while HT == nil do
        TriggerEvent('HT_base:getBaseObjects', function(obj) HT = obj end)
        Citizen.Wait(0)
    end
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(1)
        if IsControlJustReleased(1, 57) and GetLastInputMethod( 0 ) then
            HT.TriggerServerCallback('GetJob', function(Job)
                if Job == true then
                    local ped = PlayerPedId()
                    local x,y,z = table.unpack(GetEntityCoords(ped, false))
                    local streetName, crossing = GetStreetNameAtCoord(x, y, z)
                    streetName = GetStreetNameFromHashKey(streetName)
                    local message = ""
                    if crossing ~= nil then
                        crossing = GetStreetNameFromHashKey(crossing)
                        message = "^4" .. GetPlayerName(PlayerId()) .. "^1 En kollega i nød ^3" .. streetName .. " ^og ^3" .. crossing .. "^1 Alle enheder skal reagere på denne nødknap!"
                    else
                        message = "^4" .. GetPlayerName(PlayerId()) .. "^1 En kollega i nød ^3" .. streetName .. "^1 Alle enheder skal reagere på denne nødknap!"
                    end
                    TriggerServerEvent('sendChatMessage', message)
                end
            end)
        end
    end
end)