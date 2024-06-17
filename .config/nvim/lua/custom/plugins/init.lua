-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information

vim.opt.swapfile = false

vim.g.leetcode_browser = 'firefox'
vim.g.leetcode_solution_filetype = 'python3'

vim.g.calendar_google_calendar = 1
vim.g.calendar_google_task = 1

vim.cmd("source ~/.cache/calendar.vim/credentials.vim")

vim.cmd([[ let g:neo_tree_remove_legacy_commands = 1 ]])
vim.opt.wrap = false
vim.opt.cursorline = true
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.ignorecase = true
vim.opt.relativenumber = true
vim.opt.termguicolors = true


vim.g.copilot_no_tab_map = true
vim.api.nvim_set_keymap("i", "<C-J>", 'copilot#Accept("<CR>")', { silent = true, expr = true })

vim.g.copilot_filetypes = {
  ["*"] = false,
  ["javascript"] = true,
  ["typescript"] = true,
  ["lua"] = false,
  ["rust"] = true,
  ["c"] = true,
  ["c#"] = true,
  ["c++"] = true,
  ["go"] = true,
  ["python"] = true,
  ["make"] = true,
}

vim.api.nvim_create_augroup('NotesSettings', { clear = true })

vim.api.nvim_create_autocmd('FileType', {
    group = 'NotesSettings',
    pattern = {'norg', 'markdown', 'text'},
    callback = function()
        vim.wo.wrap = true                         -- Enable wrapping
        vim.wo.linebreak = true                    -- Wrap lines at word boundaries
        vim.wo.breakindent = true                  -- Indent wrapped lines
        vim.keymap.set('n', 'j', 'gj', {})         -- Move easily through soft wraps
        vim.keymap.set('n', 'k', 'gk', {})         -- Move easily through soft wraps
        vim.wo.spell = true                        -- Set spell
        vim.cmd "hi SpellBad gui=bold,undercurl guifg=LightRed"
        vim.keymap.set('n', '<C-s>', '1z=')        -- Replace current word with first autosuggestion
    end
})

vim.api.nvim_create_augroup('LaTeXSettings', { clear = true })

vim.api.nvim_create_autocmd('FileType', {
    group = 'LaTeXSettings',
    pattern = {'tex'},
    callback = function()
        vim.wo.wrap = true                         -- Enable wrapping
        vim.wo.linebreak = true                    -- Wrap lines at word boundaries
        vim.wo.breakindent = true                  -- Indent wrapped lines
        vim.keymap.set('n', 'j', 'gj', {})         -- Move easily through soft wraps
        vim.keymap.set('n', 'k', 'gk', {})         -- Move easily through soft wraps
        vim.keymap.set('c', 'W', 'w | make<Cr>',{desc = 'Run make in the shell'})
    end
})

local function map(mode, lhs, rhs, opts)
    local options = { noremap = true, silent = true }
    if opts then
        if opts.desc then
            opts.desc = opts.desc
        end
        options = vim.tbl_extend('force', options, opts)
    end
    vim.keymap.set(mode, lhs, rhs, options)
end

map('i', 'jj', '<Esc>', {desc = "Leave insert mode with a sensible map"})

map('n', 'o', 'o<Esc>', {desc = "Stay in normal mode when adding a line under"})
map('n', 'O', 'O<Esc>', {desc = "Stay in normal mode when adding a line above"})

map('n', 'H', '<Cmd>BufferPrevious<CR>')
map('n', 'L', '<Cmd>BufferNext<CR>')
map('n', '<C-c>', '<Cmd>BufferClose<CR>')
map('n', '<C-p>', '<Cmd>BufferPick<CR>')

-- This is dumb but it's nice for line wrapped text
map('n', 'j', 'gj')
map('n', 'j', 'gj')

-- Neotree Stuff
map('n', '<leader>t', ':Neotree toggle<CR>', {desc = 'Open Neotree'})

 -- Neorg Stuff
map('n', '<leader>ni', '<cmd>Neorg index<cr>', {desc = 'Jump to Neorg index'})
map('n', '<leader>nj', '<cmd>Neorg journal<cr>', {desc = 'Jump to Neorg journal'})
map('n', '<leader>nt', '<cmd>Neorg toc<cr>', {desc = 'Open Neorg Table of Contents'})
map('n', '<leader>nr', '<cmd>Neorg return<cr>', {desc = 'Close all Neorg buffers and go back'})
map('n', '<leader>nv', '<cmd>lua require("nabla").toggle_virt()<cr>', {desc = 'Render math lines'})
-- map('n', '<C-s>', '<cmd>Telescope neorg find_linkable<cr>', {desc = 'fzf all norg files'})

 -- Leetcode Stuff
map('n', '<leader>ll', '<cmd>LeetCodeList<cr>', {desc = 'List leetcode questions'})
map('n', '<leader>lt', '<cmd>LeetCodeTest<cr>', {desc = 'Test your leetcode question'})
map('n', '<leader>ls', '<cmd>LeetCodeSubmit<cr>', {desc = 'Submit your leetcode solution'})
map('n', '<leader>li', '<cmd>LeetCodeSignIn<cr>', {desc = 'Sign into LeetCode'})

 -- Calendar
map('n', '<leader>c', '<cmd>Calendar<cr>', {desc = 'Open up the calendar'})


-- Float Term
map('n', '<C-h>', '<cmd>FloatermToggle<cr>', {desc = 'Toggle the current floaterm'})
map('t', '<C-h>', '<cmd>FloatermToggle<cr>', {desc = 'Toggle the current floaterm'})


return {
  "alec-gibson/nvim-tetris",
  "imsnif/kdl.vim",
  "xiyaowong/transparent.nvim",
  "MunifTanjim/nui.nvim",
  "nvim-neo-tree/neo-tree.nvim",
  "github/copilot.vim",
  "dhruvasagar/vim-table-mode",
  "itchyny/calendar.vim",
  "voldikss/vim-floaterm",
  version = "*",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
    "MunifTanjim/nui.nvim",
  },
  'norcalli/nvim-colorizer.lua',
  config = function ()
    require('neo-tree').setup {}
      -- If you want icons for diagnostic errors, you'll need to define them somewhere:
      vim.fn.sign_define("DiagnosticSignError",
        {text = " ", texthl = "DiagnosticSignError"})
      vim.fn.sign_define("DiagnosticSignWarn",
        {text = " ", texthl = "DiagnosticSignWarn"})
      vim.fn.sign_define("DiagnosticSignInfo",
        {text = " ", texthl = "DiagnosticSignInfo"})
      vim.fn.sign_define("DiagnosticSignHint",
        {text = "", texthl = "DiagnosticSignHint"})
  end,
  {
    "vhyrro/luarocks.nvim",
    priority = 1000, -- We'd like this plugin to load first out of the rest
    config = true, -- This automatically runs `require("luarocks-nvim").setup()`
  },
  {
    "nvim-neorg/neorg",
    -- build = ":Neorg sync-parsers",
    dependencies = {
        { "nvim-lua/plenary.nvim" },
        { "nvim-neorg/neorg-telescope" },
        { "luarocks.nvim" },
    },
    config = function()
      require("neorg").setup {
        load = {
          ["core.presenter"] = {
            config = {
              zen_mode='zen-mode'
            }
          }, -- Loads default behaviour
          ["core.integrations.telescope"] = {},
          ["core.tempus"] = {}, -- Loads default behaviour
          ["core.export"] = {}, -- Loads default behaviour
          ["core.defaults"] = {}, -- Loads default behaviour
          ["core.ui"] = {}, -- Loads default behaviour
          ["core.ui.calendar"] = {}, -- Loads default behaviour
          ["core.concealer"] = {
            config = {
              icon_preset = 'diamond',
            }
          }, -- Adds pretty icons to your documents
          ["core.dirman"] = { -- Manages Neorg workspaces
            config = {
              workspaces = {
                notes = "~/notes",
              },
              default_workspace = "notes"
            },
          },
        },
      }
    end,
  },
}
