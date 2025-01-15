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

map('i', 'jj', '<Esc>', { desc = 'Leave insert mode with a sensible map' })

map('n', 'o', 'o<Esc>', { desc = 'Stay in normal mode when adding a line under' })
map('n', 'O', 'O<Esc>', { desc = 'Stay in normal mode when adding a line above' })

map('n', 'H', '<Cmd>BufferPrevious<CR>')
map('n', 'L', '<Cmd>BufferNext<CR>')
map('n', '<C-c>', '<Cmd>BufferClose<CR>')
map('n', '<C-p>', '<Cmd>BufferPick<CR>')

-- This is dumb but it's nice for line wrapped text
map('n', 'j', 'gj')
map('n', 'j', 'gj')

-- Tree Stuff
map('n', '<leader>t', ':lua MiniFiles.open()<CR>', { desc = 'Open mini.files' })
map('n', '<leader>T', ':Neotree toggle<CR>', { desc = 'Open Neotree' })

-- Neorg Stuff
map('n', '<leader>ni', '<cmd>Neorg index<cr>', { desc = 'Jump to Neorg index' })
map('n', '<leader>nj', '<cmd>Neorg journal<cr>', { desc = 'Jump to Neorg journal' })
map('n', '<leader>nt', '<cmd>Neorg toc<cr>', { desc = 'Open Neorg Table of Contents' })
map('n', '<leader>nr', '<cmd>Neorg return<cr>', { desc = 'Close all Neorg buffers and go back' })
map('n', '<leader>nv', '<cmd>lua require("nabla").toggle_virt()<cr>', { desc = 'Render math lines' })

-- Aerial
map('n', '<leader>a', '<cmd>AerialToggle<CR>', { desc = 'Open Aerial' })

return {}
