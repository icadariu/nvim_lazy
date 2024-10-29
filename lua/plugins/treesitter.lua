-- https://github.com/nvim-treesitter/nvim-treesitter?tab=readme-ov-file#supported-languages
return {
  "nvim-treesitter/nvim-treesitter",
  opts = {
    ensure_installed = {
      "regex",
      "lua",
      "bash",
      "diff",
      "make",
      "dockerfile",
      "terraform",
      "hcl",
      "helm",
      "tmux",
      "jq",
      "yaml",
      "ssh_config",
    },
    ignore_install = {
      "c",
      "html",
      "javascript",
      "jsdoc",
      "textproto",
      "tsx",
      "typescript",
    },
    sync_install = false,
    auto_install = true,
    indent = { enable = true },
    highlight = { enable = true },
  },
}
