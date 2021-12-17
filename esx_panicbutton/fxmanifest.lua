fx_version 'adamant'

game 'gta5'

description 'ESX Panic Button' -- Omkodet til vRP af Karamel#0004

dependency 'vrp'

client_scripts {
    'lib/Tunnel.lua',
    'lib/Proxy.lua',
    'client.lua',
}

server_scripts {
    '@vrp/lib/utils.lua',
    'server.lua',
}
