vim.cmd [[packadd packer.nvim]]

return require("packer").startup(function(use)
	use "wbthomason/packer.nvim"

	use {
		"nvim-telescope/telescope.nvim", tag = "0.1.2",
		requires = {"nvim-lua/plenary.nvim"},
	}

	use {
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
		"neovim/nvim-lspconfig",
        {
            "hrsh7th/nvim-cmp",
            requires = { 
                "saadparwaiz1/cmp_luasnip",
                "hrsh7th/cmp-nvim-lsp",
                { "L3MON4D3/LuaSnip",
                    requires = { "rafamadriz/friendly-snippets" },
                    config = function()
                        require("luasnip.loaders.from_vscode").lazy_load()
                    end,
                },I
            },
        },
	}

    use {
        "lewis6991/gitsigns.nvim", requires = { "nvim-lua/plenary.nvim" },
        config = function() require("gitsigns").setup() end
    }

    use {
        "nvim-treesitter/nvim-treesitter",
        run = ":TSUpdate",
        config = function ()
            require'nvim-treesitter.configs'.setup({
                highlight = {
                    enable = true,
                }
            })
        end
    }
    use {
        "nvim-treesitter/nvim-treesitter-context",
        config = function() 
            require("treesitter-context").setup({})
        end
    }

    use { "ellisonleao/gruvbox.nvim" }
end)

