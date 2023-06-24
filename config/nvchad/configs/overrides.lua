local M = {}

M.treesitter = {
  ensure_installed = {
    "vim",
    "lua",
    "html",
    "css",
    "javascript",
    "typescript",
    "tsx",
    "c",
    "markdown",
    "markdown_inline",

    "rust",
  },
  indent = {
    enable = true,
    -- disable = {
    --   "python"
    -- },
  },

  -- foldmethod = "expr",
  -- foldexpr = "nvim_treesitter#foldexpr()",
  -- foldenable = false, -- Disable folding at startup.

  -- fold = {
  --   method = "expr", -- 折叠方法
  --   foldexpr = "nvim_treesitter#foldexpr()",
  --   enable = true, -- 启用折叠
  -- },

  -- fold = {
  --   enable = true, -- 启用折叠
  --   indent_levels = 4, -- 折叠级别
  --   indent_guide = true, -- 显示缩进指示线
  --   method = "expr", -- 折叠方法
  --   -- 在这里添加您的自定义设置
  --   custom_foldtext = function(tree, node)
  --     -- 自定义折叠文本的显示方式
  --     -- 可以根据需要进行修改
  --     return vim.fn.trim(vim.fn.substitute(vim.fn.getline(node.start), "\\s*\\[.*\\]", "", ""))
  --   end,
  -- },
}

M.mason = {
  ensure_installed = {
    -- lua stuff
    "lua-language-server",
    "stylua",

    -- web dev stuff
    "css-lsp",
    "html-lsp",
    "typescript-language-server",
    "deno",
    "prettier",

    -- c/cpp stuff
    "clangd",
    "clang-format",

    "rust-analyzer",
    "taplo",
  },
}

-- git support in nvimtree
M.nvimtree = {
  git = {
    enable = true,
  },

  renderer = {
    highlight_git = true,
    icons = {
      show = {
        git = true,
      },
    },
  },
}

return M
