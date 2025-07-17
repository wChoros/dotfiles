return {
   "nvim-treesitter/nvim-treesitter",
   build = ":TSUpdate",
   config = function()
      local configs = require("nvim-treesitter.configs")
      configs.setup({
         ensure_installed = {
            "c", "cpp", "bash", "gitignore", "json", "sql",
            "python", "javascript", "typescript", "lua", "html", "css", "scss"
         },
         highlight = { enable = true },
         indent = { enable = true },
      })
   end
}

