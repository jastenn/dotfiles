require("lazy").setup({
	{
		"ellisonleao/gruvbox.nvim",
		lazy = false,
	},

	{
		"nvim-treesitter/nvim-treesitter",
		event = "BufEnter",
        config = function ()
            require("nvim-treesitter.configs").setup({
                auto_install = true,
                highlight = {
                    enable = true,
                },
            })
        end
	},

	{
		"neovim/nvim-lspconfig",
		event = "BufEnter",
		config = function()
			require("jastenn.config.lsp")
		end,
	},
	{
		"williamboman/mason.nvim",
		dependencies = {
			"williamboman/mason-lspconfig.nvim",
		},
	},
	{
		"hrsh7th/nvim-cmp",
		event = "BufEnter",
		dependencies = {
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-calc",
			"hrsh7th/cmp-path",
			"hrsh7th/cmp-buffer",
			{
				"L3MON4D3/LuaSnip",
				dependencies = {
					"saadparwaiz1/cmp_luasnip"
				},
			}
		},
		config = function()
			require("jastenn.config.cmp")
		end,
	},

    {
        "nvim-telescope/telescope.nvim",
        dependencies = { "nvim-lua/plenary.nvim", "nvim-treesitter/nvim-treesitter", { "nvim-telescope/telescope-fzf-native.nvim", build = "make" } },
        cmd = "Telescope",
        init = function()
            local builtin = require("telescope.builtin")

            vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "find files" })
            vim.keymap.set("n", "<leader>fp", builtin.git_files, { desc = "find project files (git files)" })
            vim.keymap.set("n", "<leader>fw", builtin.live_grep, { desc = "find word" })

            vim.keymap.set("n", "<leader>lr", builtin.lsp_references, { desc = "list references" })
            vim.keymap.set("n", "<leader>ls", builtin.lsp_document_symbols, { desc = "list document symbols" })
            vim.keymap.set("n", "<leader>lS", builtin.lsp_workspace_symbols, { desc = "list workspace symbols" })

            vim.keymap.set("n", "<leader>lb", builtin.buffers, { desc = "list buffers" })
            vim.keymap.set("n", "<leader>lf", builtin.quickfix, { desc = "list quickfix"})
        end,
        config = function()
            require("jastenn.config.telescope")
        end,
    },

	{
        "lewis6991/gitsigns.nvim",
        event = "BufEnter",
        config = function ()
            require('gitsigns').setup({})
        end
    },
    {
        "mbbill/undotree",
        cmd = "UndotreeToggle",
        init = function ()
            vim.keymap.set("n", "<leader>h", vim.cmd.UndotreeToggle)
        end
    },

    {
        "nvim-tree/nvim-tree.lua",
        cmd = "NvimTreeToggle",
        init = function ()
            vim.g.loaded_netrw = 1
            vim.g.loaded_netrwPlugin = 1

            -- set termguicolors to enable highlight groups
            vim.opt.termguicolors = true

            vim.keymap.set("n", "<leader>e", vim.cmd.NvimTreeToggle)
        end,
        config = function ()
            require("nvim-tree").setup()            
        end
    },

    { "nvim-tree/nvim-web-devicons" },
})

