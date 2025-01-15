local config = {
  'nvim-tree/nvim-web-devicons',
  'ianding1/leetcode.vim',
  'jbyuki/nabla.nvim',
  'tpope/vim-surround',
  'imsnif/kdl.vim',
  'xiyaowong/transparent.nvim',
  'nvim-neo-tree/neo-tree.nvim',
  'norcalli/nvim-colorizer.lua',
}

local custom_plugins = {
  require 'custom.plugins.aerial',
  require 'custom.plugins.barbar',
  require 'custom.plugins.catpuccin',
  require 'custom.plugins.copilot',
  require 'custom.plugins.dashboard',
  require 'custom.plugins.kitty',
  require 'custom.plugins.neorg',
  require 'custom.plugins.neoscroll',
  require 'custom.plugins.nvim-notify',
  -- require 'custom.plugins.snacks', -- This plugin is kinda a lot, I'm not yet committed to it
  require 'custom.plugins.todo-comments',
  require 'custom.plugins.typst-preview',
  require 'custom.plugins.zen-mode',
}

for _, plugins in ipairs(custom_plugins) do
  vim.list_extend(config, plugins)
end

return config
