local status, packer = pcall(require, "packer")
if not status then
	print("Packer is not installed")
	return
end

-- Reloads Neovim after whenever you save plugins.lua
vim.cmd([[
    augroup packer_user_config
      autocmd!
     autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup END
]])

packer.startup(function(use)
	-- Packer can manage itself
	use("wbthomason/packer.nvim")

	-- Dashboard is a nice start screen for nvim
	use({
		"glepnir/dashboard-nvim",
		event = "VimEnter",
		config = function()
			require("dashboard").setup({
				-- config
			})
		end,
		requires = { "nvim-tree/nvim-web-devicons" },
	})

	-- Telescope
	use({ "dhruvmanila/browser-bookmarks.nvim", tag = "*" })
	use("jvgrootveld/telescope-zoxide")
	use("nvim-telescope/telescope-github.nvim")
	use("nvim-lua/popup.nvim")
	use("nvim-lua/plenary.nvim")
	use({
		"AckslD/nvim-neoclip.lua",
		requires = {
			-- you'll need at least one of these
			-- {'nvim-telescope/telescope.nvim'},
			-- {'ibhagwan/fzf-lua'},
		},
		config = function()
			require("neoclip").setup()
		end,
	})
	use("cljoly/telescope-repo.nvim")
	use("kdheepak/lazygit.nvim") -- <Ctrl-G> to launch window, <space> to add files, lowercase c to commit, captial P to push, ? for help
	use({
		"nvim-telescope/telescope.nvim",
		config = function()
			require("telescope").setup({
				defaults = {},
			})
			-- require("telescope").load_extension("lazygit")
		end,
	})
	use({ "nvim-telescope/telescope-ui-select.nvim" })
	use({ "nvim-telescope/telescope-fzf-native.nvim", run = "make" })
	use("nvim-telescope/telescope-file-browser.nvim")
	use({ "LinArcX/telescope-command-palette.nvim" })
	-- use({
	-- 	"ibhagwan/fzf-lua",
	-- 	-- config = function()
	-- 	-- 	require("yq.config.fzf-lua")
	-- 	-- end
	-- })
	use("nvim-treesitter/nvim-treesitter") -- Treesitter Syntax Highlighting

	-- lsp :Mason to view installed formatter
	use({
		"williamboman/mason.nvim",
		config = function()
			require("mason").setup()
		end,
	})
	use("neovim/nvim-lspconfig")
	use({ "kkharji/lspsaga.nvim" })
	-- use({ "tami5/lspsaga.nvim" }) -- icons for LSP diagnostics
	use({ "vigoux/ltex-ls.nvim", requires = "neovim/nvim-lspconfig" })
	use("williamboman/mason-lspconfig.nvim")
	use("jose-elias-alvarez/null-ls.nvim")
	use("onsails/lspkind.nvim")
	-- use({ "neoclide/coc.nvim", branch = "release" }) -- key conflict with <leader>C resolved by disable it in coc/init.lua
	use({ "mhartington/formatter.nvim" })
	-- DAP
	-- use("mfussenegger/nvim-dap")

	-- Autocompletion
	use("hrsh7th/nvim-cmp")
	use("hrsh7th/cmp-buffer")
	use("hrsh7th/cmp-path")
	use("hrsh7th/cmp-cmdline")
	use("hrsh7th/cmp-nvim-lsp")
	use({ "roxma/vim-hug-neovim-rpc" })
	use({ "roxma/nvim-yarp" })
	use({ "ncm2/ncm2" })
	-- use("sirver/UltiSnips")
	use("ncm2/ncm2-ultisnips")

	-- Snippets
	use("saadparwaiz1/cmp_luasnip") -- Snippets source for nvim-cmp
	use({ "L3MON4D3/LuaSnip", dependencies = { "rafamadriz/friendly-snippets" } })
	use("onsails/lspkind-nvim")
	use("jiangmiao/auto-pairs")
	-- use("honza/vim-snippets")

	-- Nvim-R
	use("jalvesaq/cmp-nvim-r")
	use({
		"jalvesaq/Nvim-R",
		config = function()
			require("cmp_nvim_r").setup({
				filetypes = { "r", "rmd", "quarto" },
				doc_width = 20,
			})
		end,
	})
	-- quarto
	use({
		"quarto-dev/quarto-nvim",
	})
	use({ "jmbuhr/otter.nvim" })

	-- Bookmarks
	use({ "tom-anders/telescope-vim-bookmarks.nvim" })
	use("MattesGroeger/vim-bookmarks")
	-- vim-airline for status line
	use("vim-airline/vim-airline")

	-- Terminal
	use({ "akinsho/toggleterm.nvim", tag = "*" }) -- toggle terminal
	use({ "m00qek/baleia.nvim", tag = "v1.3.0" })

	-- Kitty
	use({
		"jghauser/kitty-runner.nvim",
		config = function()
			require("kitty-runner").setup()
		end,
	})

	-- Productivity
	use("vimwiki/vimwiki")
	use("jreybert/vimagit")
	use("tpope/vim-commentary") -- gc comment
	use("folke/which-key.nvim") -- Which Key
	-- use("nvim-lualine/lualine.nvim") -- A better statusline
	use("prettier/vim-prettier")

	-- Undo
	use("simnalamburt/vim-mundo")
	-- use("mbbill/undotree")
	-- use({
	-- 	"jiaoshijie/undotree",
	-- 	requires = {
	-- 		"nvim-lua/plenary.nvim",
	-- 	},
	-- })

	-- File management --
	use("vifm/vifm.vim")
	use("scrooloose/nerdtree")
	use("tiagofumo/vim-nerdtree-syntax-highlight")
	use("ryanoasis/vim-devicons")
	-- use("ptzz/lf.vim")
	-- use("voldikss/vim-floaterm")
	use({
		"lmburns/lf.nvim",
		config = function()
			-- This feature will not work if the plugin is lazy-loaded
			vim.g.lf_netrw = 1
		end,
		requires = { "plenary.nvim", "toggleterm.nvim" },
	})

	-- image preview
	use({ "edluffy/hologram.nvim" })

	-- Tim Pope Plugins --
	use("tpope/vim-surround")

	-- Syntax Highlighting and Colors --
	use("kovetskiy/sxhkd-vim")
	use("vim-python/python-syntax")
	use("ap/vim-css-color")
	use("nickeb96/fish.vim")

	-- Junegunn Choi Plugins --
	-- use("junegunn/goyo.vim")
	-- use("junegunn/limelight.vim")
	use("junegunn/vim-emoji")

	-- Colorschemes --
	use("RRethy/nvim-base16")
	use("kyazdani42/nvim-palenight.lua")

	-- Other stuff --
	use("frazrepo/vim-rainbow")

	if packer_bootstrap then
		packer.sync()
	end
end)
