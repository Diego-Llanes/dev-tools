local config = {
  'folke/todo-comments.nvim',
  'stevearc/aerial.nvim',
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
  require 'custom.plugins.barbar',
  require 'custom.plugins.catpuccin',
  require 'custom.plugins.dashboard',
  require 'custom.plugins.copilot',
  require 'custom.plugins.neorg',
  require 'custom.plugins.typst-preview',
  require 'custom.plugins.neoscroll',
  require 'custom.plugins.snacks',
}

for _, plugins in ipairs(custom_plugins) do
  vim.list_extend(config, plugins)
end

return config
