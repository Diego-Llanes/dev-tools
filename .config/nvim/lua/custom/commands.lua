vim.opt.swapfile = false

vim.g.leetcode_browser = "firefox"
vim.g.leetcode_solution_filetype = "python3"

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

function notes_settings()
	vim.wo.wrap = true
	vim.wo.linebreak = true
	vim.wo.breakindent = true
	vim.keymap.set("n", "j", "gj", {})
	vim.keymap.set("n", "k", "gk", {})
	vim.keymap.set("n", "<C-s>", "1z=") -- Replace current word with first autosuggestion
end

vim.api.nvim_create_augroup("NotesSettings", { clear = true })
vim.api.nvim_create_autocmd("FileType", {
	group = "NotesSettings",
	pattern = { "norg", "markdown", "text", "typst" },
	callback = function()
		notes_settings()
		vim.wo.spell = true
	end,
})

vim.api.nvim_create_augroup("LaTeXSettings", { clear = true })
vim.api.nvim_create_autocmd("FileType", {
	group = "LaTeXSettings",
	pattern = { "tex" },
	callback = notes_settings,
})

return {}
