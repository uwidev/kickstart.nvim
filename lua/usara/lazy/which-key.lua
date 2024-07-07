return { -- Useful plugin to show you pending keybinds.
	'folke/which-key.nvim',
	event = 'VimEnter', -- Sets the loading event to 'VimEnter'
	config = function() -- This is the function that runs, AFTER loading
		require('which-key').setup()

		-- Document existing key chains
		require('which-key').register {
			['<leader>c'] = { name = '[c]ode', _ = 'which_key_ignore' },
			['<leader>d'] = { name = '[d]ocument', _ = 'which_key_ignore' },
			['<leader>r'] = { name = '[r]ename', _ = 'which_key_ignore' },
			['<leader>s'] = { name = '[s]earch', _ = 'which_key_ignore' },
			['<leader>w'] = { name = '[w]orkspace', _ = 'which_key_ignore' },
			['<leader>t'] = { name = '[t]oggle', _ = 'which_key_ignore' },
			['<leader>h'] = { name = 'Git [h]unk', _ = 'which_key_ignore' },
			['<leader>q'] = { name = '[q]uick command execute', _ = 'which_key_ignore' },
		}
		-- visual mode
		require('which-key').register({
			['<leader>h'] = { 'Git [h]unk' },
			['<leader>m'] = { '[m]ove visual' },
			['<leader>g'] = { '[g]it' },
		}, { mode = 'v' })
	end,
}
