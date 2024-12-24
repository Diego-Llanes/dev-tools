return {
  {
    'vhyrro/luarocks.nvim',
    priority = 1000, -- We'd like this plugin to load first out of the rest
    config = true, -- This automatically runs `require("luarocks-nvim").setup()`
  },
  {
    'nvim-neorg/neorg',
    build = ':neorg sync-parsers',
    dependencies = {
      { 'nvim-lua/plenary.nvim' },
      { 'nvim-neorg/neorg-telescope' },
      { 'luarocks.nvim' },
    },
    config = function()
      require('neorg').setup {
        load = {
          ['core.presenter'] = {
            config = {
              zen_mode = 'zen-mode',
            },
          }, -- loads default behaviour
          ['core.integrations.telescope'] = {},
          ['core.tempus'] = {},
          ['core.export'] = {},
          ['core.defaults'] = {},
          ['core.ui'] = {},
          ['core.ui.calendar'] = {}, -- loads default behaviour
          ['core.concealer'] = {
            config = {
              icon_preset = 'diamond',
            },
          }, -- adds pretty icons to your documents
          ['core.dirman'] = { -- manages neorg workspaces
            config = {
              workspaces = {
                notes = '~/notes',
              },
              default_workspace = 'notes',
            },
          },
        },
      }
    end,
  },
}
