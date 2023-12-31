local wezterm = require 'wezterm'
local launch_menu = {}
local config = {}

-- Setup PowerShell options
if wezterm.target_triple == 'x86_64-pc-windows-msvc' then
  -- Grab the ver info for later use.
  local success, stdout, stderr = wezterm.run_child_process { 'cmd.exe', 'ver' }
  local major, minor, build, rev = stdout:match("Version ([0-9]+)%.([0-9]+)%.([0-9]+)%.([0-9]+)")
  local is_windows_11 = tonumber(build) >= 22000

  -- Make it look cool.
  if is_windows_11 then
    wezterm.log_info "We're running Windows 11!"
  end

  -- Set Pwsh as the default on Windows
  config.default_prog = { 'pwsh.exe', '-NoLogo' }
  table.insert(launch_menu, {
    label = 'Pwsh',
    args = { 'pwsh.exe', '-NoLogo' },
  })
  table.insert(launch_menu, {
    label = 'PowerShell',
    args = { 'powershell.exe', '-NoLogo' },
  })
  table.insert(launch_menu, {
    label = 'Pwsh No Profile',
    args = { 'pwsh.exe', '-NoLogo', '-NoProfile' },
  })
  table.insert(launch_menu, {
    label = 'PowerShell No Profile',
    args = { 'powershell.exe', '-NoLogo', '-NoProfile' },
  })
else
end

-- Default config settings
config.color_scheme = 'AdventureTime'
config.font = wezterm.font_with_fallback {
  {
    family = 'FiraCode Nerd Font'
  },
  {
    family = 'IosevkaTermSlab  Nerd Font'
  }
}
config.font_size = 15

-- and finally, return the configuration to wezterm
return config
