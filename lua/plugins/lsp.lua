return {
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup() -- initializes Mason
    end
  },
  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = { "williamboman/mason.nvim", "neovim/nvim-lspconfig" },
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = { "lua_ls" }, -- install lua_ls automatically
        automatic_installation = true,
      })
    end,
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      local capabilities = require("cmp_nvim_lsp").default_capabilities()
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
    end,
  },
}

