require 'core.keymaps'
require 'core.options'

local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = 'https://github.com/folke/lazy.nvim.git'
  local out = vim.fn.system { 'git', 'clone', '--filter=blob:none', '--branch=stable', lazyrepo, lazypath }
  if vim.v.shell_error ~= 0 then
    error('Error cloning lazy.nvim:\n' .. out)
  end
end

---@type vim.Option
local rtp = vim.opt.rtp
rtp:prepend(lazypath)

require('lazy').setup({
	require 'plugins.alpha',
	require 'plugins.neotree', --explorer
	require 'plugins.theme', --colorscheme
	require 'plugins.lualine', --statusline
	require 'plugins.telescope', --search file
	--require 'plugins.bufferline', --bufferline
	--require 'plugins.lsp' --language server protocols
	require 'plugins.indent-blankline',
	require 'plugins.autocompletion',
	--require 'plugins.none-ls',
	require 'plugins.treesitter',
	require 'plugins.misc',
	--require 'plugins.code-runner'
	
})
