local clients_lsp = function()
  local clients = vim.lsp.get_clients()

  local c = {}
  for _, client in pairs(clients) do
    if client.name ~= "copilot" and client.name ~= "null-ls" then
      table.insert(c, client.name)
    end
  end
  local next = next -- More efficient because of local instead of global lookup?
  if next(c) == nil then
    return ""
  end

  return " " .. table.concat(c, "|")
end

local options = {
  options = {
    theme = "catppuccin",
    -- theme = 'ayu',
    -- theme = 'kanagawa',
    component_separators = "",
    section_separators = "",
  },
  sections = {
    lualine_a = {
      { "mode", },
    },
    lualine_b = {
      {
        "branch",
        icon = "",
      },
    },
    lualine_c = {
      {
        "filetype",
        icon_only = true,
        padding = { left = 1, right = 0 },
      },
      {
        "filename",
        newfile_status = false,
        -- path = 3
      },
    },
    lualine_x = {
      {
        "copilot",
        show_colors = true,
        "diagnostics",
        symbols = { error = " ", warn = " ", info = " " },
        update_in_insert = true,
      },
    },
    lualine_y = { clients_lsp },
    lualine_z = {
      { "location", icon = "" },
    },
  },
  inactive_sections = {
    lualine_a = { "filename" },
    lualine_b = {},
    lualine_c = {},
    lualine_x = {},
    lualine_y = {},
    lualine_z = { "location" },
  },
}

require("lualine").setup(options)
