local cmp = require('cmp')

local icons = {
	Class = "󰠱 ",
	Color = " ",
	Constant = "󰏿 ",
	Constructor = "󰙅 ",
	Enum = " ",
	EnumMember = " ",
	Field = "󰜢 ",
	File = "󰈙 ",
	Folder = "󰉋 ",
	Function = "󰊕 ",
	Interface = "󰋁 ",
	Keyword = "󰌋 ",
	Method = "󰆧 ",
	Module = "󰖙 ",
	Property = "󰜢 ",
	Snippet = "󰏘 ",
	Struct = " ",
	Text = "󰉿 ",
	Unit = "󰑭 ",
	Value = "󰎠 ",
	Variable = "󰀫 ",
}

cmp.setup({
	sources = {
		{name = 'nvim_lsp'},
		{name = 'calc'},
		{name = 'buffer'},
		{name = 'path'},
		{name = 'luasnip'},
	},
	window = {
		      completion = cmp.config.window.bordered(),
		      documentation = cmp.config.window.bordered(),
	},
	formatting = {
		format = function(_, vim_item)  
			vim_item.kind = (icons[vim_item.kind] or vim_item.kind)
			return vim_item
		end,
	},
	mapping = cmp.mapping.preset.insert({
		-- Enter key confirms completion item
		['<CR>'] = cmp.mapping.confirm(),
		['<C-n>'] = cmp.mapping.select_next_item(),
		['<C-p>'] = cmp.mapping.select_prev_item(),
	      	['<C-b>'] = cmp.mapping.scroll_docs(-4),
		['<C-f>'] = cmp.mapping.scroll_docs(4),
	    	-- Ctrl + space triggers completion menu
		['<C-Space>'] = cmp.mapping.complete(),
	}),
	snippet = {
		expand = function(args)
			require('luasnip').lsp_expand(args.body)
		end,
	},
})
