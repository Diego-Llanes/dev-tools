-- [[ Configure Telescope ]]
-- See `:help telescope` and `:help telescope.setup()`
require('telescope').setup {
  defaults = {
    mappings = {
      i = {
        ['<C-u>'] = false,
        ['<C-d>'] = false,
      },
      -- n = {
      --   ['t'] = custom_actions.open_new_tab,
      -- },
    },
  },
}
