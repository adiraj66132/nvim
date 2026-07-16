# nvim

A personal Neovim configuration written in Lua. Lightweight, batteries-included
for a handful of languages, and entirely self-managed (no plugin manager needed).

## Highlights

- **Zero-dependency plugin management** — `lua/manage.lua` lazily `git clone`s
  plugins into the data dir and adds them to the runtime path. No Packer,
  Lazy, or Vim-Plug required. Plugin list lives in `lua/plugin-list.lua`.
- **Native LSP** — Neovim's built-in `vim.lsp` is configured for a broad set of
  languages with diagnostics, hover, rename, code actions, formatting and
  document highlighting.
- **Treesitter** everywhere — syntax highlighting, folds, textobjects and a
  custom sticky-context header, all driven by hand-written `queries/`.
- **Custom fuzzy finding** via Telescope + Harpoon, plus an autocompletion
  popup built on `nvim-cmp`.

## Editor behavior

- Relative + absolute line numbers, cursorline, 8-line `scrolloff`.
- 4-space soft tabs (`expandtab`), `ignorecase`/`smartcase` search.
- Persistent undo via `~/.vim/undodir` (`undofile` on, `swapfile` off).
- System clipboard integration (`unnamedplus`).
- `scrolloff`, `splitright`/`splitbelow`, fast `updatetime` (50ms).
- `iskeyword` includes `-` so `dw`/`ciw` operate on full hyphenated words.

## Language servers

Configured in `plugin/lsp.lua` (auto-enabled): `lua_ls`, `cssls`,
`intelephense` (PHP), `ts_ls` (JS/TS), `zls` (Zig), `nil` (Nix),
`rust_analyzer`, `clangd` (C/C++), `c3-lsp`, `serve-d` (D), `jsonls`,
`hls` (Haskell), `gopls`, and `templ`.

## Treesitter

Hand-written queries for `c`, `ecma`, `go`, `goon`, `javascript`, `jsx`,
`lua`, `nix`, `php`, `php_only`, `rust`, and `zig` under `queries/`
(`highlights`, `folds`, `injections`, `locals`, `textobjects`). Prebuilt
parsers ship in `parser/`. Custom `@function` textobjects (`af`/`if`) and
case directives (`downcase!`/`upcase!`) are added in `plugin/tonysitter.lua`.

## Plugins

| Plugin | Purpose |
| --- | --- |
| `nvim-cmp` (+ `cmp-nvim-lsp`, `cmp-path`, `cmp-buffer`) | Autocompletion |
| `telescope.nvim` | Fuzzy find files, grep, buffers, man pages |
| `harpoon` (harpoon2) | Quick file working set / navigation |
| `tokyonight.nvim` / `shibuya.nvim` | Color schemes |
| `lualine.nvim` | Status line |
| `nvim-highlight-colors` | Inline color swatches |
| `vim-fugitive` | Git integration |
| `undotree` | Visual undo history |
| `vim-oscyank` | Clipboard over SSH (OSC 52) |
| `indent-blankline.nvim` | Indent guides |
| `better-indent-support-for-php-with-html` | PHP/HTML indent fix |
| `plenary.nvim` / `nvim-web-devicons` | Utilities / icons |

## Custom features

- **Sticky context header** (`plugin/tonycontext.lua`) — pins the enclosing
  function/class first line to the top of the window. Toggle with
  `<leader>th` / `<leader>tu`.
- **Floating terminal** (`plugin/flterm.lua`) — `:Flterm` or `<leader>ft`;
  `<esc><esc>` leaves terminal mode.
- **Doc generators** (`plugin/docgen.lua`) — `<leader>dg` inserts a doc
  comment stub for the function on the current line (C, Go, Rust, Python).
- **Quick format** (`plugin/quickformat.lua`) — `<leader>qq` expands a
  single-line parenthesized call across multiple lines.
- **PHP fixer** — `<leader>cc` runs `php-cs-fixer` on the current file.

## Keybindings

Leader is `<Space>`.

### Navigation / editing
| Key | Action |
| --- | --- |
| `<leader>cd` | Open file explorer (`Ex`) |
| `J` / `K` (visual) | Move selection down / up |
| `J` (normal) | Join lines, keep cursor |
| `<C-d>` / `<C-u>` | Page down / up, centered |
| `n` / `N` | Next / prev search, centered |
| `<leader>p` (visual) | Paste without yanking replaced text |
| `<leader>d` | Delete into black hole register |
| `<leader>s` | Replace word under cursor on the line |
| `<leader>x` | `chmod +x` current file |
| `<leader>y` | OSC-yank to system clipboard (SSH-safe) |
| `<leader>rl` | Reload config |
| `<leader><leader>` | Source current file |

### LSP (buffer-local on attach)
| Key | Action |
| --- | --- |
| `K` | Hover |
| `gd` / `gD` | Definition / Declaration |
| `gi` / `go` | Implementation / Type definition |
| `gr` / `gs` | References / Signature help |
| `gl` | Line diagnostics float |
| `<F2>` | Rename |
| `<F3>` | Format |
| `<F4>` | Code action |

### Telescope
| Key | Action |
| --- | --- |
| `<leader>ff` | Find files |
| `<leader>fo` | Recent files |
| `<leader>fq` | Quickfix |
| `<leader>fh` | Help tags |
| `<leader>fm` | Man pages |
| `<leader>fb` | Buffers |
| `<leader>fg` | Grep (prompt) |
| `<leader>fc` | Grep current filename |
| `<leader>fs` | Grep word under cursor |
| `<leader>fi` | Find in nvim config |

### Harpoon
| Key | Action |
| --- | --- |
| `<leader>a` | Add file to list |
| `<C-e>` | Toggle quick menu |
| `<C-p>` / `<C-n>` | Prev / next in list |
| `<leader>fl` | Open list in Telescope |

### Misc
| Key | Action |
| --- | --- |
| `<leader>u` | Toggle Undotree |
| `<leader>cl` / `<leader>co` | Close / open quickfix |
| `<leader>cn` / `<leader>cp` | Quickfix next / prev |
| `<C-j>` / `<C-k>` | Quickfix next / prev |
| `<leader>k` / `<leader>j` | Location list next / prev |
| `<leader>li` | LSP health check |
| `<leader>mm` | Run `make` |
| `<leader>dg` | Generate doc stub |
| `<leader>qq` | Expand parenthesized call |
| `<leader>cc` | Run `php-cs-fixer` |

## Filetype tweaks

- `after/ftplugin/` adds per-language indent/number settings for
  `hare`, `jsonc`, `nix`, `man`, and the custom `goon` language
  (plus its `.goon` extension mapping and Treesitter parser/queries).

## Install

```sh
git clone git@github.com:adiraj66132/nvim.git ~/.config/nvim
```

Requires Neovim 0.11+ (uses built-in `vim.lsp.config`). Plugins are cloned
automatically on first launch into `~/.local/share/nvim/plugins`.
