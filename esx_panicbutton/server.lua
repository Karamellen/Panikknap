local Tunnel = module("vrp", "lib/Tunnel")
local Proxy = module("vrp", "lib/Proxy")

vRP = Proxy.getInterface("vRP")
vRPclient = Tunnel.getInterface("vRP","panikknap")

HT = nil
TriggerEvent('HT_base:getBaseObjects', function(obj)
    HT = obj
end)

TriggerEvent('esx:getSharedObject', function(obj) HT = obj end)

RegisterServerEvent('sendChatMessage')
AddEventHandler('sendChatMessage', function(message)
    TriggerClientEvent('chatMessage', -1, '', {255,255,255}, message)
end)

HT.RegisterServerCallback("GetJob", function(source, cb)
    local user_id = vRP.getUserId({source})

    if vRP.hasGroup({user_id, "Politi-Job"}) then 
        cb(true)
    end
end)