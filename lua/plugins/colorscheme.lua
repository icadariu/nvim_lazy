return {
  -- add gruvbox
  { "ellisonleao/gruvbox.nvim" },
  { "ntk148v/habamax.nvim",    dependencies = { "rktjmp/lush.nvim" } },
  -- Configure LazyVim to load gruvbox
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "habamax",
    },
  }
}
