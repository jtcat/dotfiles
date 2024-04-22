local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end

vim.opt.rtp:prepend(lazypath)

local opts = {
	dev = {
		path = "~/repos"
	}
}

local plugins = {
	{
		"sonph/onehalf",
		config = function(plugin)
			vim.opt.rtp:append(plugin.dir .. "/vim")
		end
	},
	"sainnhe/gruvbox-material",
	{
		"42Paris/42header",
		config = function()
			vim.api.nvim_set_keymap('n', '<F1>', ':Stdheader<cr>', {})
		end,
	},
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate"
	},
	"williamboman/mason.nvim",
	"williamboman/mason-lspconfig.nvim",
	"neovim/nvim-lspconfig",
	"mfussenegger/nvim-dap",
	"hrsh7th/cmp-nvim-lsp",
	"hrsh7th/cmp-buffer",
	"hrsh7th/cmp-path",
	"hrsh7th/cmp-cmdline",
	"hrsh7th/nvim-cmp",
	"saadparwaiz1/cmp_luasnip",
	{
		"nvim-telescope/telescope.nvim",
		branch = "0.1.x",
		dependencies = "nvim-lua/plenary.nvim"
	},
	{
		"Marskey/telescope-sg",
		dependencies = "nvim-telescope/telescope.nvim",
	},
	{
		"L3MON4D3/LuaSnip",
		version = "v2.3",
		build = "make install_jsregexp"
	},
	"rafamadriz/friendly-snippets",
}

require("lazy").setup(plugins, opts)
require "core"
require "plugins-setup"
