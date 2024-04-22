require('telescope').setup({
	extensions = {
		ast_grep = {
			command = {
				"sg",
				"--json=stream",
			},
			grep_open_files = false;
			lang = nil,
		}
	}
})
require('telescope').load_extension('ast_grep')

local builtin = require('telescope.builtin')
local extensions = require('telescope').extensions

vim.keymap.set('n', '<leader>fast', extensions.ast_grep.ast_grep, {})
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
