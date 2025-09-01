-- Pull in the wezterm API
local wezterm = require 'wezterm'

-- This table will hold the configuration.
local config = {}
config.color_scheme_dirs = { '~/.config/wezterm/' }

-- In newer versions of wezterm, use the config_builder which will
-- help provide clearer error messages
if wezterm.config_builder then
  config = wezterm.config_builder()
end
-- This is where you actually apply your config choices

-- For example, changing the color scheme:
-- config.color_scheme = 'Github (base16)'
-- config.color_scheme = 'Gogh (Gogh)'
-- config.color_scheme = 'nord'
-- config.color_scheme = 'Catppuccin Frappe'
-- config.color_scheme = 'Catppuccin Macchiato'

-- Set background to same color as neovim
config.colors = {}

config.font = wezterm.font_with_fallback {
  -- 'CaskaydiaMono Nerd Font Mono',
  -- 'Cascadia Mono',
  'CommitMono',
  -- 'Berkeley Mono Trial',
  'nonicons',
  -- 'JetBrains Mono',
}
-- Disable ligatures
config.harfbuzz_features = { 'calt=0', 'clig=0', 'liga=0' }
config.font_size = 18

-- config.enable_tab_bar = false
config.hide_tab_bar_if_only_one_tab = true
config.tab_bar_at_bottom = true
config.use_fancy_tab_bar = false

config.window_decorations = "RESIZE"
-- config.window_background_opacity = 0.1
config.macos_window_background_blur = 20

config.window_padding = {
  left = 4,
  right = 4,
  top = 4,
  bottom = 4,
}

config.freetype_load_target = "HorizontalLcd"
config.max_fps = 120

-- Define custom key bindings
config.keys = {
  -- Open WezTerm configuration file using Neovim.
  -- Doesn't work because of the vim stuff I have below
  {
    key = ',',
    mods = 'CMD',
    action = wezterm.action.SpawnCommandInNewTab {
      cwd = os.getenv('WEZTERM_CONFIG_DIR'),
      set_environment_variables = {
        TERM = 'screen-256color',
      },
      args = {
        '/opt/homebrew/bin/nvim',
        os.getenv('WEZTERM_CONFIG_FILE'),
      },
    },
  },
  {
    key = 'f',
    mods = 'CTRL',
    action = wezterm.action_callback(function(win, pane)
      pane:send_text('fuzzy_cd\n')
    end),
  },
  -- Key binding to open a new tab with powershell 7
  -- To open a cmd.exe right click in the + button in tab bar
  -- {
  --   key = "G",
  --   mods = "CTRL|SHIFT",
  --   -- action = wezterm.action.SpawnCommandInNewTab({}),
  --   action = wezterm.action.SpawnCommandInNewTab({
  --     args = { 'pwsh' },
  --     domain = { DomainName = 'local' },
  --   }),
  -- },
}

-- Below is from: https://github.com/wez/wezterm/issues/3731#issuecomment-1592198263
local function is_vim(pane)
  local is_vim_env = pane:get_user_vars().IS_NVIM == 'true'
  if is_vim_env == true then return true end
  -- This gsub is equivalent to POSIX basename(3)
  -- Given "/foo/bar" returns "bar"
  -- Given "c:\\foo\\bar" returns "bar"
  local process_name = string.gsub(pane:get_foreground_process_name(), '(.*[/\\])(.*)', '%2')
  return process_name == 'nvim' or process_name == 'vim'
end

--- cmd+keys that we want to send to neovim.
local super_vim_keys_map = {
  s = utf8.char(0xAA),
  x = utf8.char(0xAB),
  b = utf8.char(0xAC),
  ['.'] = utf8.char(0xAD),
  o = utf8.char(0xAE),
  p = utf8.char(0xAF),
}

local function bind_super_key_to_vim(key)
  return {
    key = key,
    mods = 'CMD',
    action = wezterm.action_callback(function(win, pane)
      local char = super_vim_keys_map[key]
      if char and is_vim(pane) then
        -- pass the keys through to vim/nvim
        win:perform_action({
          SendKey = { key = char, mods = nil },
        }, pane)
      else
        win:perform_action({
          SendKey = {
            key = key,
            mods = 'CMD'
          }
        }, pane)
      end
    end)
  }
end

--- in your wezterm keys config, use it like:
config.keys = {
  bind_super_key_to_vim('s'),
  bind_super_key_to_vim('.'),
  bind_super_key_to_vim('p'),
  --- others....
}

-- and finally, return the configuration to wezterm
return config
