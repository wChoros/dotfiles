return {
   {
      "williamboman/mason.nvim",
      config = function()
         require("mason").setup()
      end
   },
   {
      "williamboman/mason-lspconfig.nvim",
      config = function()
         require("mason-lspconfig").setup({
            ensure_installed = {
               "lua_ls", "pyright", "vtsls", "prismals",
               "bashls", "cssls", "dockerls", "html",
               "jsonls", "marksman"
            },
         })
      end
   },
   {
      "neovim/nvim-lspconfig",
      config = function()
         local lspconfig = require("lspconfig")

         local servers = {
            "lua_ls", "pyright", "vtsls", "prismals",
            "bashls", "cssls", "dockerls", "html",
            "jsonls", "marksman"
         }

         for _, server in ipairs(servers) do
            lspconfig[server].setup({})
         end

         vim.keymap.set('n', "K", vim.lsp.buf.hover, {})
         vim.keymap.set('n', "<leader>ca", vim.lsp.buf.code_action, {})
      end
   },
}

