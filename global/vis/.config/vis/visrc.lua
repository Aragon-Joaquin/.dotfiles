require("vis")

local plugin_vis_open = require('plugins/vis-fzf-open')
vis.events.subscribe(vis.events.INIT, function()
  -- Your global configuration options
  vis:command("set theme b16-ir-black")
  vis:map(vis.modes.NORMAL, "  ", ":fzf<Enter>")
end)

vis.events.subscribe(vis.events.WIN_OPEN,
  function(win) -- luacheck: no unused args vis:command("set shell /usr/bin/env sh")
    vis:command("set relativenumbers")

    vis:command("set number on")
    vis:command("set autoindent on")
    vis:command("set cursorline on")
    vis:command("set ignorecase on")
    vis:command("set tabwidth 4")
    vis:command("set expandtab on")
  end)

-- autoload everything!
require("plugins/vis-autoclose")

local colorizer = require("plugins/vis-colorizer")
colorizer.three = false
colorizer.six = true

local lspc = require("plugins/vis-lspc")
lspc.ls_map = {
  lua = {
    name = "lua-language-server",
    cmd = "lua-language-server",
    settings = {
      Lua = { diagnostics = { globals = { "vis" } }, telemetry = { enable = false } },
    },
    formatting_options = { tabSize = 2, insertSpaces = true },
  },
  zig = {
    name = "zls",
    cmd = "zls",
  }
}
