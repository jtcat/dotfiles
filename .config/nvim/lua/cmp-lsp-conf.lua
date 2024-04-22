local cmp = require "cmp"
local luasnip = require "luasnip"

cmp.setup({
    snippet = {
        expand = function(args)
            luasnip.lsp_expand(args.body)
        end,
    },
	window = {
		completion = cmp.config.window.bordered(),
		documentation = cmp.config.window.bordered(),
	},
    mapping = cmp.mapping.preset.insert({
        ['<C-d>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<CR>'] = cmp.mapping(function(fallback)
			if cmp.visible() then
--				if luasnip.expandable() then
--					luasnip.expand()
					cmp.confirm({ select = true, })
				else
					fallback()
				--end
			end
		end),

        ['<Tab>'] = cmp.mapping(function(fallback)
            if cmp.visible() then
				if not cmp.complete_common_string() then
					cmp.select_next_item({behavior = require('cmp.types.cmp').SelectBehavior.Select})
				end
            elseif luasnip.locally_jumpable(1) then
                luasnip.jump(1)
            else
                fallback()
            end
        end, { 'i', 's' }),
        ['<S-Tab>'] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_prev_item()
            elseif luasnip.locally_jumpable(-1) then
                luasnip.jump(-1)
            else
                fallback()
            end
        end, { 'i', 's' }),
    }),
    sources = {
        { name = 'nvim_lsp' },
        { name = 'luasnip' },
		{ name = 'path'},
		{ name = 'buffer'},
    },

})
