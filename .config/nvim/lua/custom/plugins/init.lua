-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information

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

-- Function to format the entire buffer
local function format_buffer()
    vim.api.nvim_exec([[
        let save_cursor = getpos(".")
        normal! ggVGgq
        call setpos('.', save_cursor)
    ]], false)
end

-- Register the function for global use
_G.format_buffer = format_buffer

-- Auto-command group for .norg files to set text width and format options
vim.cmd [[
augroup NorgSettings
    autocmd!
    autocmd BufRead,BufNewFile *.norg setlocal formatoptions+=t textwidth=80
augroup END
]]

-- Auto-command group for .norg files to define key binding for formatting
vim.cmd [[
augroup NorgFormat
    autocmd!
    autocmd FileType norg nnoremap <buffer> <Leader>f :lua _G.format_buffer()<CR>
augroup END
]]

-- Define :Fmt command
vim.cmd [[
command! Fmt lua _G.format_buffer()
]]

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
map('n', '<C-s>', '<cmd>Telescope neorg find_linkable<cr>', {desc = 'fzf all norg files'})

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

}
