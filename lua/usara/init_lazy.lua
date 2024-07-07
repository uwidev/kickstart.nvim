-- [[ Install `lazy.nvim` plugin manager ]]
--    See `:help lazy.nvim.txt` or https://github.com/folke/lazy.nvim for more info
local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
	local lazyrepo = 'https://github.com/folke/lazy.nvim.git'
	vim.fn.system { 'git', 'clone', '--filter=blob:none', '--branch=stable', lazyrepo, lazypath }
end ---@diagnostic disable-next-line: undefined-field
vim.opt.rtp:prepend(lazypath)

-- NOTE: Here is where you install your plugins.
require('lazy').setup({
	-- NOTE: Plugins can be added with a link (or for a github repo: 'owner/repo' link).
	-- 'tpope/vim-sleuth', -- Detect tabstop and shiftwidth automatically

	-- "gc" to comment visual regions/lines
	-- { 'numToStr/Comment.nvim', opts = {} },

	-- Highlight todo, notes, etc in comments
	{ 'folke/todo-comments.nvim', event = 'VimEnter', dependencies = { 'nvim-lua/plenary.nvim' }, opts = { signs = false } },

	-- NOTE: Next step on your Neovim journey: Add/Configure additional plugins for Kickstart
	--
	--  Here are some example plugins that I've included in the Kickstart repository.
	--  Uncomment any of the lines below to enable them (you will need to restart nvim).
	--
	-- require 'usara.lazy.debug',
	-- require 'usara.lazy.indent_line',
	-- require 'usara.lazy.lint',
	-- require 'usara.lazy.autopairs',
	-- require 'usara.lazy.neo-tree',
	-- require 'usara.lazy.gitsigns', -- adds gitsigns recommend keymaps

	-- Other minimal plugins

	-- Import plugins that require a bit more setup as to not clog this file
	{ import = 'usara.lazy' },
}, {
	ui = {
		-- If you are using a Nerd Font: set icons to an empty table which will use the
		-- default lazy.nvim defined Nerd Font icons, otherwise define a unicode icons table
		icons = vim.g.have_nerd_font and {} or {
			cmd = '⌘',
			config = '🛠',
			event = '📅',
			ft = '📂',
			init = '⚙',
			keys = '🗝',
			plugin = '🔌',
			runtime = '💻',
			require = '🌙',
			source = '📄',
			start = '🚀',
			task = '📌',
			lazy = '💤 ',
		},
	},
	spec = 'usara.lazy',
	change_detection = { notify = false },
})
