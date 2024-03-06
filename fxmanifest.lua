fx_version "cerulean"
game "gta5"

author "Dawsmo"
description "Report script to discord" 
version "1.0.0"

lua54 "yes"

ui_page 'src/index.html'

shared_scripts { 
    '@ox_lib/init.lua', 
    "@es_extended/imports.lua", 
} 
 
client_scripts { 
    "client/client.lua", 
} 
 
server_scripts { 
    "server/sv_config.lua", 
    "server/server.lua", 
} 
 
dependencies { 
    "es_extended", 
    "ox_lib", 
} 
 
files { 
    "locales/*.json",
    "src/index.html",
    "src/styles.css",
    "src/script.js",
    "src/img/*"
} 
