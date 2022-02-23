local status_ok, configs = pcall(require, "nvim-treesitter.configs")
if not status_ok then
  return
end

configs.setup {
  ensure_installed = "maintained", -- one of "all", "maintained" (parsers with maintainers), or a list of languages
  sync_install = false, -- install languages synchronously (only applied to `ensure_installed`)
  -- 如果安装python的treesitter，配置： ignore_install = { "python" }
  ignore_install = { "" }, -- List of parsers to ignore installing

  -- autopairs的配置
  autopairs = {
    enable = true,
  },

  highlight = {
    enable = true, -- false will disable the whole extension
    disable = { "" }, -- list of language that will be disabled
    additional_vim_regex_highlighting = true,
  },
  -- 比如按o时，自动在前面空合适的空格，可能yaml支持不是很好，因此被禁用了
  indent = { enable = true, disable = { "yaml" } },

  -- rainbow 的配置
  rainbow = {
    enable = true,
    -- disable = { "jsx", "cpp" }, list of languages you want to disable the plugin for
    extended_mode = true, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
    max_file_lines = nil, -- Do not enable for files with more than n lines, int
    -- colors = {}, -- table of hex strings
    -- termcolors = {} -- table of colour name strings
  },

  -- comments的配置
  context_commentstring = {
    enable = true,
    enable_autocmd = false,
  }
}
