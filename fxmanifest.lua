fx_version 'bodacious'
game 'gta5'
lua54 'yes'

author 'BLOSSOM SCRIPTS'
description 'earthquake for fivem for better rp'
version '1.0.0'

files {
    'client/ui/index.html',
    'client/ui/sounds/earthquake.mp3'
}

ui_page 'client/ui/index.html'

shared_scripts {
    'config.lua'
}

client_scripts {
    'client/core.lua'
}

server_scripts {
    'server/core.lua'
}
