return {
    "neovim/nvim-lspconfig",
    dependencies = {
        -- Easy LSP installation
        { "mason-org/mason.nvim" },
        { "mason-org/mason-lspconfig.nvim" },
        { "WhoIsSethDaniel/mason-tool-installer.nvim" },
        {
            "saghen/blink.cmp",
            version = "1.*",
            -- Snippets
            dependencies = { "L3MON4D3/LuaSnip", version = "v2.*" },

            opts = {
                keymap = {
                    preset = "default",
                    ["<CR>"] = { "accept", "fallback" },
                    -- Need to set c-k to fallback to be able to use it during insert mode...
                    ["<C-k>"] = { "fallback", "show_signature", "hide_signature" },
                },

                snippets = { preset = "luasnip" },

                appearance = {
                    nerd_font_variant = "mono",
                },

                completion = {
                    documentation = { auto_show = true },
                    list = { selection = { preselect = false, auto_insert = false } },
                    menu = {
                        border = "rounded",
                        draw = {
                            gap = 2,
                            columns = { { "label", "label_description", gap = 1 }, { "kind_icon", "kind", gap = 1 } },
                        },
                    },
                },

                sources = {
                    default = { "lsp", "path", "snippets", "buffer" },
                },

                fuzzy = { implementation = "prefer_rust_with_warning" },

                -- Shows a signature help window while you type arguments for a function
                signature = { enabled = true },
            },
            opts_extend = { "sources.default" },
        },
    },
    config = function()
        -- Easy LSP installation
        require("mason").setup()
        require("mason-lspconfig").setup()
        require("mason-tool-installer").setup(
            {
                ensure_installed = {
                    "lua_ls",
                    "pylsp",
                }
            }
        )

        -- Custom LSP servers configuration
        -- Enable diagnostics information next to the error/warning
        vim.diagnostic.config({
            virtual_text = true,
        })

        vim.lsp.config("lua_ls", {
            settings = {
                Lua = {
                    runtime = {
                        version = 'LuaJIT',
                    },
                    diagnostics = {
                        globals = {
                            'vim',
                            'require'
                        },
                    },
                    workspace = {
                        library = vim.api.nvim_get_runtime_file("", true),
                    },
                    telemetry = {
                        enable = false,
                    },
                },
            },
        })

        -- Enable LSP servers, manually
        -- It should be done automatically by mason-lspconfig
        -- vim.lsp.enable({})

        -- Custom LSP Keybinds
        vim.keymap.set("n", "gd", function()
            vim.lsp.buf.definition()
        end)
        vim.keymap.set("n", "K", function()
            vim.lsp.buf.hover()
        end)
        vim.keymap.set("n", "<leader>vd", function()
            vim.diagnostic.open_float()
        end)
        vim.keymap.set("n", "<leader>ca", function()
            vim.lsp.buf.code_action()
        end)
        -- Currently using telescope to find references
        -- vim.keymap.set("n", "<leader>vvr", function()
        --     vim.lsp.buf.references()
        -- end)
        vim.keymap.set("n", "<leader>vrn", function()
            vim.lsp.buf.rename()
        end)
        vim.keymap.set("n", "<leader>ff", vim.lsp.buf.format)

        -- LuaSnip config
        local ls = require("luasnip")
        local types = require("luasnip.util.types")

        ls.config.set_config({
            -- This tells LuaSnip to remember to keep around the last snippet.
            -- You can jump back into it even if you move outside of the selection
            history = true,

            -- This one is cool cause if you have dynamic snippets, it updates as you type!
            updateevents = "TextChanged,TextChangedI",

            -- Autosnippets:
            enable_autosnippets = false,

            ext_opts = {
                [types.choiceNode] = {
                    active = {
                        virt_text = { { " « ", "NonTest" } },
                    },
                },
            },
        })

        vim.keymap.set({ "i", "s" }, "<c-k>", function()
            if ls.expand_or_jumpable() then
                ls.expand_or_jump()
            end
        end, { silent = true })
        vim.keymap.set({"i", "s"}, "<c-j>", function() ls.jump(-1) end, {silent = true})

        -- Snippets
        local react_shared_snippets = {
            ls.parser.parse_snippet("lv", "console.log('${1}', ${2});\n${0}"),
            ls.parser.parse_snippet("dv", "<div>${1}</div>\n"),
        }

        ls.add_snippets("javascript", react_shared_snippets)
        ls.add_snippets("typescript", react_shared_snippets)
        ls.add_snippets("javascriptreact", react_shared_snippets)
        ls.add_snippets("typescriptreact", react_shared_snippets)

        local go_error_snippet = ls.parser.parse_snippet("err", "if err != nil {\n\t${1}\n}\n${0}")
        ls.add_snippets("go", { go_error_snippet })
    end,
}
