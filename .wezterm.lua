local wezterm = require 'wezterm'
local config = {}

-- Setup PowerShell options
if wezterm.target_triple == 'x86_64-pc-windows-msvc' then
  -- Set Pwsh as the default on Windows
  config.default_prog = { 'pwsh.exe', '-NoLogo' }
end

-- Default config settings
config.color_scheme = 'AdventureTime'
config.font = wezterm.font "JetBrains Mono"
config.font_size = 15

-- and finally, return the configuration to wezterm
return config
