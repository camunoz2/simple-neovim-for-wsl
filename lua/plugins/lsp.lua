return {
  {
    "neovim/nvim-lspconfig",
    config = function()
      local capabilities = require("cmp_nvim_lsp").default_capabilities()
      -- Lua Setup
      require("lspconfig").lua_ls.setup({
        capabilities = capabilities,  -- Attach nvim-cmp capabilities
        settings = {
          Lua = {
            diagnostics = {
              globals = { "vim" }, -- to avoid diagnostics errors for 'vim'
            },
          },
        },
      })

      -- TsSetup
      require('lspconfig').ts_ls.setup {
        cmd = { "typescript-language-server", "--stdio" },
        on_attach = function(client, bufnr)
          vim.keymap.set('n', 'gd', function()
            vim.lsp.buf.definition()
          end, { noremap = true, silent = true, desc = "Go to definition and center line" })
        end,
        settings = {},
      }
    end,
  },
}

