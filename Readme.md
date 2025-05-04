# 😪 LazyVim Configuration

This is a modular and clean Neovim configuration built on top of [LazyVim](https://www.lazyvim.org/). It follows a structured approach with separated files for options, keymaps, plugins, and LSP setup — making it easy to extend and maintain.

## 📁 Directory Structure

```
~/.config/nvim/
├── init.lua                  -- Entry point: loads modular configs
├── lua/
│   └── config/
│       ├── lazy.lua          -- Bootstraps lazy.nvim and loads plugins from /plugins
│       ├── options.lua       -- Vim options (line numbers, tabs, colors, etc.)
│       ├── keymaps.lua       -- Global keybindings
│       ├── autocmds.lua      -- Custom autocommands
│       └── lsp.lua           -- LSP server setup
│
│   └── plugins/
│       ├── lsp.lua           -- LSP and completion plugins
│       ├── treesitter.lua    -- Treesitter config
│       ├── ui.lua            -- Colorscheme, UI components (NERDTree, Airline, Dashboard)
│       ├── tools.lua         -- Telescope, autopairs, git
│       └── ai.lua            -- Copilot and AI tools (Parrot, CopilotChat)
```

---

## 🚀 Getting Started

1. **Clone this config:**

   ```bash
   git clone https://github.com/YOUR_USERNAME/nvim-config ~/.config/nvim
   ```

2. **Launch Neovim:**

   ```bash
   nvim
   ```

3. **Lazy.nvim will install itself and all configured plugins on first run.**

4. **(Optional) Clean lock file:**

   ```bash
   rm ~/.config/nvim/lazy-lock.json
   nvim +Lazy sync
   ```

---

## ➕ Adding a New Plugin

To add a new plugin, simply create a file inside `lua/plugins/`, or append to an existing one.

### ✅ Example: Adding `vim-surround`

Create or edit `lua/plugins/tools.lua`:

```lua
-- ~/.config/nvim/lua/plugins/tools.lua
return {
  {
    "tpope/vim-surround",
    event = "VeryLazy", -- Optional lazy-load
  },
}
```

Save and run:

```vim
:Lazy sync
```

---

## 🌜 Colorscheme

This config uses the [`charleston`](https://github.com/romanaverin/charleston.nvim) colorscheme and `vim-airline` with the `deus` theme.

To change the theme, edit `plugins/ui.lua` and update:

```lua
vim.cmd("colorscheme YOUR_THEME")
```

---

## 💬 AI Support

Includes both:

- `CopilotChat.nvim`: Chat-based Copilot UX
- `parrot.nvim`: Gemini/OpenAI assistant

Just export the following in your shell:

```bash
export OPENAI_API_KEY=your_openai_key
export GEMINI_API_KEY=your_gemini_key
```

---

## 🛠 LSP Servers

Installed LSP servers include:

- Docker (`dockerls`)
- JSONNet (`jsonnet_ls`)
- Python (`pyre`)
- YAML (`yamlls`)

You can extend them in `config/lsp.lua`.

---

## 📦 Powered by

- [Lazy.nvim](https://github.com/folke/lazy.nvim)
- [nvim-lspconfig](https://github.com/neovim/nvim-lspconfig)
- [nvim-cmp](https://github.com/hrsh7th/nvim-cmp)
- [nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter)

---
