return {
  "stevearc/conform.nvim",
  dependencies = { "mason.nvim" },
  event = { "BufReadPre", "BufNewFile" },
  opts = function(_, opts)
    -- Remove 'fish' from 'formatters_by_ft'
    opts.stop_after_first = true
    -- Add your custom formatters or modify existing ones
    opts.formatters_by_ft.fish = nil
    opts.formatters_by_ft.lua = { "stylua" }
    opts.formatters_by_ft.markdown = { "markdownlint" }
    opts.formatters_by_ft.bash = { "beautysh" }
    opts.formatters_by_ft.yaml = { "yamlfmt" }
    opts.formatters_by_ft.toml = { "taplo" }
    opts.formatters_by_ft.sh = { "beautysh" }
    opts.formatters_by_ft.go = { "gofmt" }
    opts.formatters_by_ft.json = { "prettierd", "prettier" }
  end,
  keys = {
    {
      "<Tab>f",
      function()
        require("conform").format({ async = true, lsp_fallback = true })
      end,
      desc = "Format Code",
    },
  },
}
