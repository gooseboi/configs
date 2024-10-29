return {
	"neovim/nvim-lspconfig",
	dependencies = {
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
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

			bufmap('gr', require('telescope.builtin').lsp_references)
			bufmap('<leader>s', require('telescope.builtin').lsp_document_symbols)
			bufmap('<leader>S', require('telescope.builtin').lsp_dynamic_workspace_symbols)

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

		require("mason").setup()
		require("mason-lspconfig").setup({
			ensure_installed = {
				"lua_ls",
				"rust_analyzer",
				"gopls",
				"nil_ls",
				"bashls",
				"pylsp",
				"clangd"
			},

			handlers = {
				function(server_name)
					require("lspconfig")[server_name].setup {
						on_attach = on_attach,
						capabilities = capabilities
					}
				end,

				["lua_ls"] = function()
					require('neodev').setup()
					require('lspconfig').lua_ls.setup {
						on_attach = on_attach,
						capabilities = capabilities,
						settings = {
							Lua = {
								workspace = { checkThirdParty = false },
								telemetry = { enable = false },
							},
						}
					}
				end,

				["rust_analyzer"] = function()
					require('lspconfig').rust_analyzer.setup {
						on_attach = on_attach,
						capabilities = capabilities,
						settings = {
							["rust-analyzer"] = {
								cargo = { allFeatures = true, },
								imports = { group = { enable = false, }, },
								completion = { postfix = { enable = false, }, },
								check = { command = "clippy" }
							}
						}
					}
				end,
			}
		})
	end
}
