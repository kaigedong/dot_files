local fn = vim.fn

-- Automatically install packer
-- 自动安装packer到该目录： ~/.local/share/nvim/site/pack/packer/start/packer.nvim
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system {
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  }
  print "Installing packer close and reopen Neovim..."
  vim.cmd [[packadd packer.nvim]]
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
-- autocmd 自动执行：当plugins.lua改变时，执行 PackerSync
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]]

-- Use a protected call so we don't error out on first use
-- 下面几行，等价于： locak packer = require("packer")
-- 但是上面的代码，如果不存在将会继续执行，并且报错
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

-- Have packer use a popup window
-- 下面设置packer用float window显示窗口，并且有rounded类型的border
packer.init {
  display = {
    open_fn = function()
      return require("packer.util").float { border = "rounded" }
    end,
  },
}

-- Install your plugins here
return packer.startup(function(use)
  -- My plugins here
  --
  --
  -- 使用"user/repo"的格式来制定github插件仓库
  -- 在命令行执行 `:Packer + TAB` 可以查看Packer提供的命令
  use "wbthomason/packer.nvim" -- Have packer manage itself
  -- 大部分插件都依赖下面两个插件
  use "nvim-lua/popup.nvim" -- An implementation of the Popup API from vim in Neovim
  use "nvim-lua/plenary.nvim" -- Useful lua functions used ny lots of plugins

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)
