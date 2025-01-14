return {
  {
    'nvimdev/dashboard-nvim',
    event = 'VimEnter',
    config = function()
      require('dashboard').setup {
        theme = 'doom',
        preview = {
          command = 'lolcat --seed=42 --freq=0.15 --spread=2 -a --speed=20 --duration 5',
          file_path = '~/.config/nvim/lua/custom/plugins/dashboard/sunjon.txt',
          file_height = 17,
          file_width = 70,
        },
        config = {
          center = {
            {
              icon = '  ',
              -- icon_hl = 'Title',
              desc = 'Find Git Files',
              -- desc_hl = 'String',
              key = 'g',
              -- keymap = 'SPC f d',
              -- key_format = ' %s', -- remove default surrounding `[]`
              action = 'lua require"telescope.builtin".git_files(require("telescope.themes").get_dropdown({}))',
            },
            {
              icon = '  ',
              -- icon_hl = 'Title',
              desc = 'Find Files in CWD',
              -- desc_hl = 'String',
              key = 'f',
              -- keymap = 'SPC f d',
              -- key_format = ' %s', -- remove default surrounding `[]`
              action = 'lua require"telescope.builtin".find_files(require("telescope.themes").get_dropdown({}))',
            },
            {
              icon = '  ',
              -- icon_hl = 'Title',
              desc = 'Search Old Files',
              -- desc_hl = 'String',
              key = 'o',
              -- keymap = 'SPC f d',
              -- key_format = ' %s', -- remove default surrounding `[]`
              action = 'lua require"telescope.builtin".oldfiles(require("telescope.themes").get_dropdown({}))',
            },
            {
              icon = '  ',
              -- icon_hl = 'Title',
              desc = 'Find Git Commits',
              -- desc_hl = 'String',
              key = 'c',
              -- keymap = 'SPC f d',
              -- key_format = ' %s', -- remove default surrounding `[]`
              action = 'lua require"telescope.builtin".git_commits(require("telescope.themes").get_dropdown({}))',
            },
            {
              icon = '  ',
              -- icon_hl = 'Title',
              desc = 'Find Git Branches',
              -- desc_hl = 'String',
              key = 'b',
              -- keymap = 'SPC f d',
              -- key_format = ' %s', -- remove default surrounding `[]`
              action = 'lua require"telescope.builtin".git_branches(require("telescope.themes").get_dropdown({}))',
            },
          },
          footer = {
            '',
            '',
            'Sometimes it is the people no one can imagine anything of',
            'who do the things no one can imagine.',
            '',
          },
        },
      }
    end,
    dependencies = { { 'nvim-tree/nvim-web-devicons' } },
  },
}
