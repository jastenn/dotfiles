require("plugin")
require("remap")

local o = vim.o
local g = vim.g

vim.o.background = 'dark'

vim.cmd [[colorscheme gruvbox]]

o.scrolloff = 8
g.nowrap = true

o.number = true
o.numberwidth = 4

local tabsize = 4
g.noexpandtab = true
o.shiftwidth = tabsize
o.softtabstop = tabsize
