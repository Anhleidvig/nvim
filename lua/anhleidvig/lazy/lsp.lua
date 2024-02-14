return {
    {
        "neovim/nvim-lspconfig",
        dependencies = {
            "williamboman/mason.nvim",
            "williamboman/mason-lspconfig.nvim",
            "hrsh7th/cmp-nvim-lsp",
            "hrsh7th/cmp-buffer",
            "hrsh7th/cmp-path",
            "hrsh7th/cmp-cmdline",
            "hrsh7th/nvim-cmp",
            "L3MON4D3/LuaSnip",
            "saadparwaiz1/cmp_luasnip",
            "j-hui/fidget.nvim",
        },

        config = function()
            local cmp = require('cmp')
            local cmp_lsp = require("cmp_nvim_lsp")
            local capabilities = vim.tbl_deep_extend(
                "force",
                {},
                vim.lsp.protocol.make_client_capabilities(),
                cmp_lsp.default_capabilities()
            )

            require("fidget").setup({})
            require("mason").setup()
            require("mason-lspconfig").setup({
                ensure_installed = {
                    "lua_ls",
                    "tsserver",
                    "jsonls",
                    "html",
                    "cssls",
                    "yamlls",
                    "bashls",
                    "dockerls",
                    "tailwindcss",
                    "eslint",
                    "phpactor",
                    "intelephense",
                    "psalm",
                    "phpcs",
                },
                handlers = {
                    function(server_name) -- default handler (optional)
                        require("lspconfig")[server_name].setup { capabilities = capabilities }
                    end,

                    ["lua_ls"] = function()
                        local lspconfig = require("lspconfig")
                        lspconfig.lua_ls.setup {
                            capabilities = capabilities,
                            settings = {
                                Lua = {
                                    diagnostics = {
                                        globals = { "vim", "it", "describe", "before_each", "after_each" },
                                    }
                                }
                            }
                        }
                    end,
                }
            })

            local cmp_select = { behavior = cmp.SelectBehavior.Select }

            cmp.setup({
                snippet = {
                    expand = function(args)
                        require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
                    end,
                },
                mapping = cmp.mapping.preset.insert({
                    ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
                    ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
                    ['<C-y>'] = cmp.mapping.confirm({ select = true }),
                    ["<C-Space>"] = cmp.mapping.complete(),
                }),
                sources = cmp.config.sources({
                    { name = 'nvim_lsp' },
                    { name = 'luasnip' }, -- For luasnip users.
                    { name = 'buffer' },
                    { name = 'path' },
                    { name = 'cmdline' },
                    { name = 'mason' },
                }, {
                    { name = 'buffer' },
                })
            })

            vim.diagnostic.config({
                signs = true,
                underline = true,
                severity_sort = true,
                update_in_insert = true,
                float = {
                    focusable = false,
                    style = "minimal",
                    border = "rounded",
                    source = "always",
                    header = "",
                    prefix = "",
                },
            })
        end
    },
    {
        "stevearc/conform.nvim",
        keys = {
            {
                -- Customize or remove this keymap to your liking
                "<leader>f",
                function()
                    require("conform").format({ async = true, lsp_fallback = true })
                end,
                mode = "n",
                desc = "Format buffer",
            },
        },
        -- Everything in opts will be passed to setup()
        opts = {
            -- configure lsp code actions for importing missing modules
            import_on_completion = {
                enable = true,
            },
            -- Define your formatters
            formatters_by_ft = {
                lua = { "stylua", "lua-format", "luafmt", "lua", "luaformatter" },
                javascript = { "prettierd", "prettier", "eslint", "eslint_d", "eslint_d_stdin", "eslint_d --stdin", "eslint_d --stdin --fix-to-stdout" },
                javascriptreact = { "prettierd", "prettier", "eslint", "eslint_d", "eslint_d_stdin", "eslint_d --stdin", "eslint_d --stdin --fix-to-stdout" },
                typescript = { "prettierd", "prettier", "eslint", "eslint_d", "eslint_d_stdin", "eslint_d --stdin", "eslint_d --stdin --fix-to-stdout" },
                typescriptreact = { "prettierd", "prettier", "eslint", "eslint_d", "eslint_d_stdin", "eslint_d --stdin", "eslint_d --stdin --fix-to-stdout" },
                sh = { "shfmt", },
                markdown = { "prettierd", "prettier", "markdownlint" },
                json = { "prettierd", "prettier", "jsonlint", "jsonlint_d" },
                yaml = { "prettierd", "prettier", "yamllint", "yamllint_d" },
                html = { "prettierd", "prettier", "htmlhint", "htmlhint_d" },
                css = { "prettierd", "prettier", "stylelint", "stylelint_d", "stylelint_d_scss", "stylelint_d_less", "stylelint_d_css", "stylelint_d_stdin"},
                scss = { "prettierd", "prettier", "stylelint", "stylelint_d", "stylelint_d_scss", "stylelint_d_less", "stylelint_d_css", "stylelint_d_stdin"},
                less = { "prettierd", "prettier", "stylelint", "stylelint_d", "stylelint_d_scss", "stylelint_d_less", "stylelint_d_css", "stylelint_d_stdin" },
                php = { "prettierd", "phpcbf", "phpcs", "php-cs-fixer", "phpfmt" },
            },
        },
        init = function()
            -- If you want the formatexpr, here is the place to set it
            vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"
        end,
    },
}
