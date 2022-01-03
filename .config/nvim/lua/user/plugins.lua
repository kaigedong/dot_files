local fn = vim.fn

-- Automatically install packer
-- 自动安装packer到该目录： ~/.local/share/nvim/site/pack/packer/start/packer.nvim
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
    PACKER_BOOTSTRAP = fn.system {"git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim",
                                  install_path}
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
            return require("packer.util").float {
                border = "rounded"
            }
        end
    }
}

-- Install your plugins here
return packer.startup(function(use)
    -- My plugins here
    -- 使用"user/repo"的格式来制定github插件仓库
    -- 在命令行执行 `:Packer + TAB` 可以查看Packer提供的命令
    use "wbthomason/packer.nvim" -- Have packer manage itself
    -- 大部分插件都依赖下面两个插件
    use "nvim-lua/popup.nvim" -- An implementation of the Popup API from vim in Neovim
    use "nvim-lua/plenary.nvim" -- Useful lua functions used ny lots of plugins
    use "windwp/nvim-autopairs" -- Autopairs, integrates with both cmp and treesitter
    use "numToStr/Comment.nvim" -- Easily comment stuff
    use "mg979/vim-visual-multi" -- 多光标插件
    use "tpope/vim-surround" -- surround 插件
    -- 含有自定义的hint
    use "simrat39/rust-tools.nvim"
    -- 显示行尾空格
    use "ntpeters/vim-better-whitespace"
    -- nvim 非常酷的状态栏目
    use {
      'nvim-lualine/lualine.nvim',
      requires = { 'kyazdani42/nvim-web-devicons', opt = true }
    }
    -- 可以选择打开文件放到哪里的好用的文件Tree
    use {
      'kyazdani42/nvim-tree.lua',
      requires = {
        'kyazdani42/nvim-web-devicons', -- optional, for file icon
      },
      config = function() require'nvim-tree'.setup {} end
    }
    -- undotree 可以通过命令触发：nnoremap <F5> :UndotreeToggle<CR>
    use {"mbbill/undotree"}
    -- 配合Telescope使用非常厉害
    use "junegunn/fzf.vim"

    -- dashboard，只是显示历史打开的文件
    -- use "mhinz/vim-startify"
    use "glepnir/dashboard-nvim"
    -- use { "liuchengxu/vim-clap", run='cargo build --release && cp target/release/maple bin/' }

    -- 通过回车键选中一段文字，可以和surround配合使用。
    -- gcmt/wildfire.vim
    use {
      "folke/which-key.nvim",
      config = function()
        require("which-key").setup {
          -- your configuration comes here
          -- or leave it empty to use the default settings
          -- refer to the configuration section below
        }
      end
    }


    -- Lazy loading:
    -- Load on specific commands
    -- 同时该插件也会下载到opt文件夹，而非start文件夹
    -- 惰加载，在执行特定命令下触发
    -- use {'tpope/vim-dispatch', opt = true, cmd = {'Dispatch', 'Make', 'Focus', 'Start'}}

    -- Plugins can have post-install/update hooks
    -- 在下载好之后，会执行这个run命令，进入插件文件夹执行一些命令

    use {
        'iamcco/markdown-preview.nvim',
        run = 'cd app && yarn install',
        cmd = 'MarkdownPreview'
    }

    -- 内置了大概6个主题，其中darkplus还不错
    -- use "lunarvim/colorschemes" -- A bunch of colorschemes you can try out
    use 'folke/tokyonight.nvim'

    -- use 'neovim/nvim-lspconfig'
    -- use 'hrsh7th/cmp-nvim-lsp'

    -- 使用nvim-cmp作为自动补全插件
    use 'hrsh7th/nvim-cmp'
    -- cmp source
    use 'hrsh7th/cmp-buffer'
    use 'hrsh7th/cmp-path'
    use 'hrsh7th/cmp-cmdline'
    use 'saadparwaiz1/cmp_luasnip'
    -- 在输入vim.之后，进行提示
    use "hrsh7th/cmp-nvim-lsp"
    use "hrsh7th/cmp-nvim-lua"
    -- cmp source: 显示crates是否是最新版，并lazy-loading
    use {
        'saecki/crates.nvim',
        event = {"BufRead Cargo.toml"},
        requires = {{'nvim-lua/plenary.nvim'}},
        config = function()
            require('crates').setup()
        end
    }

    -- git
    use "lewis6991/gitsigns.nvim"

    -- nvim-cmp还需要安装snippets插件
    use 'L3MON4D3/LuaSnip' -- snippet engine
    -- 支持很多snippets，有rust等.. package.json 中有写
    use 'rafamadriz/friendly-snippets' -- A bunch of snippets to use

    -- LSP
    use "neovim/nvim-lspconfig" -- enable LSP
    use "williamboman/nvim-lsp-installer" -- simple to use language server installer

    -- Telescope
    -- 执行命令: `:Telescope TAB`可以看到所有支持的命令
    -- :Telescope find_files
    -- :Telescope live_grep (查找文件内容)
    -- :Telescope lsp_<TAB> 显示lsp相关的内容，如lsp_definition; lsp_reference
    -- :Telescope find_files theme=ivy 可选theme:ivy, dropdown, cursor
    use "nvim-telescope/telescope.nvim"
    -- telescope 的插件，允许预览图片
    use 'nvim-telescope/telescope-media-files.nvim'
    use "nvim-telescope/telescope-file-browser.nvim"

    -- coc config
    use {'neoclide/coc.nvim', branch = 'release'}

    -- Treesitter
    use {
        "nvim-treesitter/nvim-treesitter",
        run = ":TSUpdate",
    }
    -- 依赖treesitter的彩虹括号
    use "p00f/nvim-ts-rainbow"
    -- 开发treesitter插件有用：直接查看语法树
    -- use "nvim-treesitter/playground"

    -- comment插件
    use 'JoosepAlviste/nvim-ts-context-commentstring'

    -- 有些插件可以在Event触发时执行。
    -- 查看Event可以使用 `:help autocmd`

    -- Automatically set up your configuration after cloning packer.nvim
    -- Put this at the end after all plugins
    if PACKER_BOOTSTRAP then
        require("packer").sync()
    end
end)
