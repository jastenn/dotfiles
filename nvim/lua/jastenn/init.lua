require("jastenn.remap")
require("jastenn.plugins")

vim.cmd([[colorscheme gruvbox]])

local opt  = vim.o

vim.wo.wrap = false

opt.background = "dark"

opt.expandtab = true
opt.shiftwidth = 4
opt.tabstop = 4

opt.number = true
opt.numberwidth = 5

local set_hl_for_floating_window = function()
	vim.api.nvim_set_hl(0, 'NormalFloat', {
		link = 'Normal',
	})

	vim.api.nvim_set_hl(0, 'FloatBorder', {
		bg = 'none',
	})
end

set_hl_for_floating_window()

vim.api.nvim_create_autocmd('ColorScheme', {
	pattern = '*',
	desc = 'Avoid overwritten by loading color schemes later',
	callback = set_hl_for_floating_window,
})


