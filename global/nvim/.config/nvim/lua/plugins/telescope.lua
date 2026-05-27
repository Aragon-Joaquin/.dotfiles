return {
  {
    "nvim-telescope/telescope.nvim",
    version = "*",
    dependencies = {
      "nvim-lua/plenary.nvim",
      { "nvim-tree/nvim-web-devicons", opts = {} },
      { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    },

    keys = function()
      local builtin = require("telescope.builtin")

      vim.keymap.set("n", "<leader>sf", builtin.find_files, { desc = "Telescope find files" })
      vim.keymap.set("n", "<leader>sg", builtin.live_grep, { desc = "Telescope live grep" })
      vim.keymap.set("n", "<leader>sb", builtin.buffers, { desc = "Telescope buffers" })
      vim.keymap.set("n", "<leader>sh", builtin.help_tags, { desc = "Telescope help tags" })

      vim.keymap.set("n", "<leader>sm", "<cmd>Telescope man_pages<cr>", { desc = "Telescope help tags" })

      vim.keymap.set("n", "<leader>sn", function()
        builtin.find_files({ cwd = "~/.config/nvim" })
      end, { desc = "Telescope nvim .files" })

      -- This runs on LSP attach per buffer (see main LSP attach function in 'neovim/nvim-lspconfig' config for more info,
      vim.api.nvim_create_autocmd("LspAttach", {
        group = vim.api.nvim_create_augroup("telescope-lsp-attach", { clear = true }),
        callback = function(event)
          local buf = event.buf

          vim.keymap.set("n", "grr", builtin.lsp_references, { buffer = buf, desc = "[G]oto [R]eferences" })

          vim.keymap.set("n", "gri", builtin.lsp_implementations, { buffer = buf, desc = "[G]oto [I]mplementation" })

          vim.keymap.set("n", "grd", builtin.lsp_definitions, { buffer = buf, desc = "[G]oto [D]efinition" })

          vim.keymap.set("n", "grO", builtin.lsp_document_symbols, { buffer = buf, desc = "Open Document Symbols" })

          vim.keymap.set(
            "n",
            "gW",
            builtin.lsp_dynamic_workspace_symbols,
            { buffer = buf, desc = "Open Workspace Symbols" }
          )

          vim.keymap.set("n", "grt", builtin.lsp_type_definitions, { buffer = buf, desc = "[G]oto [T]ype Definition" })
        end,
      })
    end,
  },
}
