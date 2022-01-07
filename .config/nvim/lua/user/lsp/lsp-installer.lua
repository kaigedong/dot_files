local status_ok, lsp_installer = pcall(require, "nvim-lsp-installer")
if not status_ok then
	return
end

-- Register a handler that will be called for all installed servers.
-- Alternatively, you may also register handlers on specific server instances instead (see example below).
lsp_installer.on_server_ready(function(server)
	local opts = {
		on_attach = require("user.lsp.handlers").on_attach,
		capabilities = require("user.lsp.handlers").capabilities,
	}

    -- 如果 server_name 匹配时，加载一些配置
    -- 如配置中，出现packages.json(JS项目)时，可以智能提示可用的字段
	 if server.name == "jsonls" then
	 	local jsonls_opts = require("user.lsp.settings.jsonls")
	 	opts = vim.tbl_deep_extend("force", jsonls_opts, opts)
	 end

	 if server.name == "sumneko_lua" then
	 	local sumneko_opts = require("user.lsp.settings.sumneko_lua")
	 	opts = vim.tbl_deep_extend("force", sumneko_opts, opts)
	 end

	 if server.name == "pyright" then
	 	local pyright_opts = require("user.lsp.settings.pyright")
	 	opts = vim.tbl_deep_extend("force", pyright_opts, opts)
	 end

    -- 使用rust-tools可以使用自定义的hint, 如可以将下面命令map到按键
    -- `:lua require("rust-tools.inlay_hints").toggle_inlay_hints()`
    if server.name == "rust_analyzer" then
      -- Initialize the LSP via rust-tools instead
      require("rust-tools").setup {

        -- The "server" property provided in rust-tools setup function are the
        -- settings rust-tools will provide to lspconfig during init.
        -- We merge the necessary settings from nvim-lsp-installer (server:get_default_options())
        -- with the user's own settings (opts).
        server = vim.tbl_deep_extend("force", server:get_default_options(), opts),
      }
      server:attach_buffers()
    end

    -- LSP config 可以到 neovim/nvim-lspconfig/server_configurations.md去查看
	-- This setup() function is exactly the same as lspconfig's setup function.
	-- Refer to https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
	server:setup(opts)
end)

