return {
  "ThePrimeagen/harpoon",
  config = function()
    local h_mark = require("harpoon.mark")
    local h_ui = require("harpoon.ui")

    local telescope = require("telescope")
    telescope.load_extension("harpoon")

    vim.keymap.set("n", "<leader>ha", function(buf)
      h_mark.add_file(buf)
    end, { desc = "Add current buffer" })

    vim.keymap.set("n", "<leader>he", function()
      h_ui.toggle_quick_menu()
    end, { desc = "Toggle menu" })

    vim.keymap.set("n", "<leader>sa", "<cmd>Telescope harpoon marks<cr>", { desc = "Harpoon menu" })

    vim.keymap.set("n", "<leader>p", function()
      h_ui.nav_prev()
    end, { desc = "Harpoon prev" })

    vim.keymap.set("n", "<leader>n", function()
      h_ui.nav_next()
    end, { desc = "Harpoon next" })

    for i = 1, 5 do
      vim.keymap.set("n", "<leader>h" .. i, function()
        h_ui.nav_file(i)
      end, { desc = "Harpoon Goto " .. i })
    end
  end,
}
