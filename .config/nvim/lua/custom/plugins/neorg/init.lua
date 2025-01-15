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
    init = function()
      local neorg_callbacks = require 'neorg.core.callbacks'

      neorg_callbacks.on_event('core.keybinds.events.enable_keybinds', function(_, keybinds)
        -- Map all the below keybinds only when the "norg" mode is active
        keybinds.map_event_to_mode('norg', {
          i = { -- Bind in insert mode
            { '<C-l>', 'core.integrations.telescope.insert_link' },
          },
        }, {
          silent = true,
          noremap = true,
        })
      end)
    end,
  },
}
