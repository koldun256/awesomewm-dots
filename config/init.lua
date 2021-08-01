modkey = 'Mod4'
terminal = 'kitty'
launcher = 'rofi -show'
screenshot = 'flameshot gui'
tags = { '1', '2', '3', '4', '5', '6' }

helpers.config {
  clientkeys = require('config.clientkeys'),
  globalkeys = require('config.globalkeys'),
  wallpapers = require('config.wallpapers'),
  layouts = { 
    awful.layout.suit.tile.right,
    awful.layout.suit.tile.bottom,
    awful.layout.suit.spiral
  },
  topbar = require('config.topbar'),
  theme = 'nord',
  tags = tags,
  signals = require('config.signals')
}
