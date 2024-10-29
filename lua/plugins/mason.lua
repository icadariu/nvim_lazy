return {
  {
    "williamboman/mason.nvim",
    opts = {
      -- https://mason-registry.dev/registry/list
      ensure_installed = {
        "beautysh",
        "gopls",
        "helm-ls",
        "json-lsp",
        "lua-language-server",
        "markdownlint",
        "prettier",
        "prettierd",
        "shfmt",
        "taplo",
        "yamlfmt",
        "stylua",
        "terraform-ls",
        "yaml-language-server",
        "bash-language-server",
      },
    },
  },
}
