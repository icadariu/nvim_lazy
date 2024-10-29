# Good to know

## Shortcuts

* For a list of default shortcuts, check original [lazyvim keymaps](https://www.lazyvim.org/keymaps)
* Also checking [this local file](../lua/config/keymaps.lua) will help.
* Disable format using `<leader>uf`

## Tips & Tricks

* `Alt+h/l` in insert mode - move cursor left or right.
* `Alt+j/k` in insert mode - move cursor line up/down.

* Using `s` will activate flash plugin, allowing fast movement inside the code.

* Check available keymaps from nvim:
  * Using `<leader>?`
  * Using Telescope search keymaps - `<leader>sk`

* Diagnostics
  * `[d or ]d` - jump between identified issues

* **Marks**
  * view marks: `:marks`
  * add mark: `ma` (or any letter after character after "m")
  * delete mark: `:delm mymark` or `:delm!` to delete everything

## Debug

* <https://www.youtube.com/watch?v=lyNfnI-B640>

* check lsp log - `~/.local/state/nvim/lsp.log`
* Or do something like:

  ```txt
  :lua vim.diagnostic.setqflist():q

  # open the issues using
  :copen

  ```
