-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information

return {
	{ -- Official lua package manager, required for neorg
		'vhyrro/luarocks.nvim',
		priority = 1000,
		config = true,
		opts = {
			rocks = { 'inspect' },
		},
	},
	{ -- neorg support, better notes
		'nvim-neorg/neorg',
		dependencies = { 'luarocks.nvim' },
		lazy = false,
		version = '*',
		config = function()
			require('neorg').setup {
				load = {
					['core.defaults'] = {},
					['core.concealer'] = {},
					['core.dirman'] = {
						config = {
							workspaces = {
								notes = '~/notes',
							},
						},
					},
					['core.journal'] = {
						config = {
							strategy = 'flat',
							workspace = 'notes',
						},
					},
					['core.completion'] = {
						config = {
							engine = 'nvim-cmp',
						},
					},
					['core.integrations.nvim-cmp'] = {},
					['core.keybinds'] = {
						config = {
							hook = function(keybinds)
								keybinds.remap(
									'norg',
									'x',
									'<leader>mf',
									':<C-u>lua require("usara.move_visual_new_file").simple_refactor(vim.api.nvim_get_mode().mode)<CR>',
									{ noremap = true, silent = true, desc = '(m)ove visual to (f)ile' }
								)
							end,
						},
					},
				},
			}
		end,
	},
	{ -- Autosaving
		'https://git.sr.ht/~alowain/auto-save.nvim',
		event = { 'BufReadPre' },
		opts = {
			events = { 'InsertLeave', 'BufLeave' },
			silent = false,
			include_ft = { 'norg' }, -- Whitelist only for .neorg files
			exclude_ft = {},
		},
		-- This plugin does not seem to have a toggle feature.
		-- See the following repo if you want to consider extending existing
		-- autosave plugins with toggles.
		-- https://github.com/pocco81/auto-save.nvim
		--
		-- You can alternatively ditch plugins all together and jerry-rig your own
		-- auto commands and functions to toggle the autocommand. Do note that
		-- auto commands do not inheritly support toggle, so it's the callback
		-- that will need to handle checking if some global variable is set or not.
	},
	-- { -- Automatically enter closing brackets, quotes, etc
	--   'm4xshen/autoclose.nvim',
	--   config = true,
	-- },
}
