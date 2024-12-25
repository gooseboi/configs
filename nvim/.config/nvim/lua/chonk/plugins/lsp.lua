return {
	"neovim/nvim-lspconfig",
	dependencies = {
		"williamboman/mason.nvim",
		{
			"WhoIsSethDaniel/mason-tool-installer.nvim",
			dependencies = { "williamboman/mason-lspconfig.nvim", },
		},
		"folke/neodev.nvim",
	},

	config = function()
		--- @param bufnr integer
		local on_attach = function(_, bufnr)
			--- @param keys string
			--- @param func function
			local bufmap = function(keys, func)
				vim.keymap.set('n', keys, func, { buffer = bufnr })
			end

			bufmap('<leader>rn', vim.lsp.buf.rename)
			bufmap('<leader>.', vim.lsp.buf.code_action)

			bufmap('gd', vim.lsp.buf.definition)
			bufmap('gD', vim.lsp.buf.declaration)
			bufmap('gI', vim.lsp.buf.implementation)
			bufmap('<leader>D', vim.lsp.buf.type_definition)

			local telescope = require('telescope.builtin')
			bufmap('gu', telescope.lsp_references)
			bufmap('gs', telescope.lsp_document_symbols)
			bufmap('gS', telescope.lsp_dynamic_workspace_symbols)

			bufmap("[d", vim.diagnostic.goto_prev)
			bufmap("]d", vim.diagnostic.goto_next)

			bufmap('K', vim.lsp.buf.hover)

			vim.api.nvim_create_autocmd('BufWritePre', {
				buffer = bufnr,
				callback = function(_)
					vim.lsp.buf.format()
				end
			})
		end

		local capabilities = vim.lsp.protocol.make_client_capabilities()
		capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

		require("neodev").setup()

		local servers = {
			lua_ls = {
				Lua = {
					workspace = { checkThirdParty = false },
					telemetry = { enable = false },
				},
			},

			rust_analyzer = {
				["rust-analyzer"] = {
					cargo = { allFeatures = true, },
					imports = { group = { enable = false, }, },
					completion = { postfix = { enable = false, }, },
					check = { command = "clippy" }
				}
			},

			gopls = {},

			nixd = {
				ensure_installed = false,
				settings = {
					nixd = {
						formatting = {
							command = { "alejandra" },
						},
					}
				},
			},

			bashls = {},

			pylsp = {},

			clangd = {},

			zls = {
				settings = {},

				on_attach = function(...)
					vim.g.zig_fmt_autosave = false
				end,
			},

			ols = {
				init_options = {
					checker_args = "-strict-style",
				},
			},
		}

		local ensure_installed = vim.tbl_filter(function(key)
			local t = servers[key]
			if t.ensure_installed == false then
				return false
			else
				return true
			end
		end, vim.tbl_keys(servers))

		require("mason-tool-installer").setup({ ensure_installed = ensure_installed })

		require("mason").setup()
		local lspconfig = require("lspconfig")
		for name, config in pairs(servers) do
			if config.settings == nil then
				config = { settings = config }
			end

			config = vim.tbl_deep_extend("force", {}, {
				capabilities = capabilities,
			}, config)

			lspconfig[name].setup(config)
		end

		vim.api.nvim_create_autocmd("LspAttach", {
			callback = on_attach,
		})
	end
}
