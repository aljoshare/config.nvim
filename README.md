# config.nvim

<div align=center>
    <img src=logo.jpg width=40%>
</div>

---
![Neovim](https://img.shields.io/badge/Neovim-0.10+-57A143?logo=neovim&logoColor=white)
![OS](https://img.shields.io/badge/OS-Linux%20%7C%20macOS-0078D4)
![Theme](https://img.shields.io/badge/Theme-Catppuccin%20Mocha-cba6f7)

A fast, modern, and minimal Neovim configuration built for **Linux** and **macOS** with a curated set of essential plugins.

## Features

- ⚡ **Package Manager**: [lazy.nvim](https://github.com/folke/lazy.nvim) with modular structure (`lua/plugins/*.lua`).
- 🎨 **Aesthetic**: [Catppuccin Mocha](https://github.com/catppuccin/nvim) with unified highlights across plugins and [lualine.nvim](https://github.com/nvim-lualine/lualine.nvim).
- 🚀 **Autocompletion**: [blink.cmp](https://github.com/saghen/blink.cmp) — lightning-fast, zero-hassle completion with snippet support via [friendly-snippets](https://github.com/rafamadriz/friendly-snippets).
- 🧠 **LSP**: [nvim-lspconfig](https://github.com/neovim/nvim-lspconfig) + [mason.nvim](https://github.com/williamboman/mason.nvim) with automatic server installation.
- 🌳 **Treesitter**: [nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter) for syntax highlighting and smart indenting.
- 📂 **File Exploration**: [oil.nvim](https://github.com/stevearc/oil.nvim) to edit your filesystem like a normal Neovim buffer.
- 🎯 **Fast Navigation**: [harpoon2](https://github.com/ThePrimeagen/harpoon) for quick-jumping between frequent files.
- 🔍 **Fuzzy Finder**: [telescope.nvim](https://github.com/nvim-telescope/telescope.nvim) with native fzf acceleration.
- ✍️ **Formatting**: [conform.nvim](https://github.com/stevearc/conform.nvim) with format-on-save and fallback to LSP.
- 🐙 **Git**: [gitsigns.nvim](https://github.com/lewis6991/gitsigns.nvim) for inline diffs, hunk staging, and blame.
- ⌨️ **Keybinding Discovery**: [which-key.nvim](https://github.com/folke/which-key.nvim).

## Pre-configured Languages

- **Rust** (`rust_analyzer`, `rustfmt`)
- **Go** (`gopls`, `goimports`, `gofmt`)
- **Python** (`pyright`, `ruff`)
- **Lua** (`lua_ls`, `stylua`)
- **Shell / Bash** (`bashls`, `shfmt`)
- **YAML & JSON** (`yamlls`, `jsonls`, `prettierd` / `prettier`)
- **Markdown** (`marksman`, `prettierd` / `prettier`)

## Directory Structure

```
.
├── init.lua
└── lua
    ├── config
    │   ├── autocmds.lua    # General autocommands (yank highlight, resize, restore cursor)
    │   ├── keymaps.lua     # General and navigation keymaps
    │   ├── lazy.lua        # Bootstrap lazy.nvim & setup
    │   └── options.lua     # Neovim options (cross-platform Linux/macOS)
    └── plugins
        ├── colorscheme.lua # Catppuccin theme configuration
        ├── completion.lua  # blink.cmp configuration
        ├── formatting.lua  # conform.nvim configuration
        ├── git.lua         # gitsigns.nvim configuration
        ├── lsp.lua         # mason & nvim-lspconfig
        ├── navigation.lua  # oil.nvim & harpoon2
        ├── telescope.lua   # telescope.nvim fuzzy finder
        ├── treesitter.lua  # nvim-treesitter syntax highlighting
        └── ui.lua          # which-key & lualine
```

## Keymaps Overview

Leader key is `Space`.

### Navigation & Files
| Keymap | Description |
|---|---|
| `-` | Open parent directory with **Oil** |
| `<leader>-` | Open parent directory in floating window |
| `<leader>ha` | Add file to **Harpoon** |
| `<leader>hh` | Open Harpoon menu |
| `<leader>1` - `<leader>4` | Select Harpoon buffer 1–4 |
| `<C-S-P>` / `<C-S-N>` | Previous / Next Harpoon buffer |
| `<C-h>` / `<C-j>` / `<C-k>` / `<C-l>` | Move to left / lower / upper / right split |

### Search & Picker (Telescope)
| Keymap | Description |
|---|---|
| `<leader>ff` / `<leader><Space>` | Find files |
| `<leader>fg` | Live grep |
| `<leader>fb` | Open buffers |
| `<leader>fh` | Help tags |
| `<leader>fo` | Recent files |
| `<leader>fd` | Workspace diagnostics |

### LSP & Code
| Keymap | Description |
|---|---|
| `gd` | Go to definition |
| `gr` | Go to references |
| `gI` | Go to implementation |
| `K` | Hover documentation |
| `<C-k>` | Signature documentation |
| `<leader>cr` | Rename symbol |
| `<leader>ca` | Code action |
| `<leader>cf` | Format file / range (`:FormatToggle` to toggle format-on-save) |
| `[d` / `]d` | Previous / Next diagnostic |
| `<leader>e` | Open diagnostic float |

### Git (gitsigns)
| Keymap | Description |
|---|---|
| `]c` / `[c` | Next / Previous git hunk |
| `<leader>hs` | Stage hunk (works in visual mode) |
| `<leader>hr` | Reset hunk (works in visual mode) |
| `<leader>hp` | Preview hunk |
| `<leader>hb` | Blame line |
| `<leader>tb` | Toggle inline blame |
| `<leader>hd` | Diff this file |

## Installation & Requirements

1. **Neovim 0.10+**
2. **Git**
3. **C compiler and Make** (optional, for telescope-fzf-native)
4. A **Nerd Font** (recommended: JetBrainsMono Nerd Font)

Clone this repository into your Neovim config directory:
```bash
# Linux / macOS
git clone https://github.com/aljoshare/config.nvim.git ~/.config/nvim
```
Start Neovim:
```bash
nvim
```
`lazy.nvim` will automatically bootstrap and install all plugins. Mason will install the configured language servers.
