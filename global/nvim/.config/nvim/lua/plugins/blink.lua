return {
  {
    "saghen/blink.cmp",
    dependencies = {
      "saghen/blink.lib",
      -- provides snippets for the snippet source
      "rafamadriz/friendly-snippets",
    },
    build = function()
      -- build the fuzzy matcher, wait up to 60 seconds
      -- you can use `gb` in `:Lazy` to rebuild the plugin as needed
      require("blink.cmp").build():wait(60000)
    end,

    ---@module 'blink.cmp'
    ---@type blink.cmp.Config
    opts = {
      -- C-space: Open menu or open docs if already open
      -- C-n/C-p or Up/Down: Select next/previous item
      -- C-e: Hide menu
      -- C-k: Toggle signature help (if signature.enabled = true)
      keymap = { preset = "default" },

      -- (Default) Only show the documentation popup when manually triggered
      completion = { documentation = { auto_show = true } },

      -- (Default) list of enabled providers defined so that you can extend it
      -- elsewhere in your config, without redefining it, due to `opts_extend`
      sources = {
        default = { "lazydev", "lsp", "path", "snippets", "buffer" },
        providers = {
          lazydev = {
            name = "LazyDev",
            module = "lazydev.integrations.blink",
            -- make lazydev completions top priority (see `:h blink.cmp`)
            score_offset = 100,
          },
        },
      },

      fuzzy = { implementation = "rust" },
    },
  },
}
