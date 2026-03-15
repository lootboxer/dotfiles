# Neovim Configuration

> A modern, modular Neovim configuration optimized for full-stack development with **Vue 3**, **TypeScript**, **Golang**, and **PostgreSQL** (planned).

## 📋 Table of Contents

- [Overview](#overview)
- [Quick Start](#quick-start)
- [File Structure](#file-structure)
- [Core Configuration](#core-configuration)
- [Plugin Configurations](#plugin-configurations)
- [Keybindings Reference](#keybindings-reference)
- [LSP & Language Support](#lsp--language-support)
- [Environment Configuration](#environment-configuration)
- [Health Check](#health-check)
- [Future Roadmap](#future-roadmap)

---

## 🎯 Overview

This configuration is built on **lazy.nvim** for plugin management and features a comprehensive setup for modern web and backend development. It emphasizes:

- **Modular architecture** - Plugins and keybindings are organized in separate files
- **Vue 3 excellence** - Full LSP support, auto-tagging, Treesitter integration, custom snippets
- **Golang basics** - gopls LSP, Treesitter highlighting (see [GOALS.md](./GOALS.md) for planned enhancements)
- **AI-assisted coding** - Avante.nvim with agentic mode for intelligent code assistance
- **Productivity-first** - Harpoon, Telescope, project management, session persistence
- **Modern UI/UX** - Snacks.nvim, TokyoNight theme, bufferline, notifications

### Key Statistics

- **23 Plugins** - Carefully selected and configured
- **8 LSP Servers** - ts_ls, vue_ls, gopls, rust_analyzer, lua_ls, pyright, cssls, emmet
- **100+ Keybindings** - Organized by functionality with which-key integration
- **Custom Snippets** - Vue 3 development snippets available in `snippets/` directory

---

## 🚀 Quick Start

### Prerequisites

```bash
# Required
neovim >= 0.10
git
make
unzip
ripgrep (rg)

# Language servers (auto-installed via Mason)
node >= 18
go >= 1.21
python3
```

### Installation

1. **Clone this configuration:**
   ```bash
   git clone <this-repo> ~/.config/nvim
   ```

2. **Launch Neovim:**
   ```bash
   nvim
   ```
   Lazy.nvim will automatically install all plugins on first launch.

3. **Configure environment files:**
   ```bash
   # Project discovery
   cp lua/envs/neovim-project.example.lua lua/envs/neovim-project.lua

   # AI assistant (optional)
   cp lua/envs/avante.example.lua lua/envs/avante.lua
   # Edit avante.lua and add your API key
   ```

4. **Run health check:**
   ```vim
   :checkhealth
   ```

5. **Install language servers:**
   ```vim
   :Mason
   ```
   Install: typescript-language-server, vue-language-server, gopls, lua-language-server, etc.

---

## 📁 File Structure

```
nvim/
├── init.lua                          # Main entry point, lazy.nvim setup
├── README.md                         # This file
├── GOALS.md                          # Future roadmap and improvement plans
│
├── lua/
│   ├── autocmds.lua                  # Auto-commands (Vue auto-tagging)
│   ├── health.lua                    # Health check definitions
│   │
│   ├── keybindings/                  # Keybinding modules
│   │   ├── init.lua                  # Core keybindings (navigation, diagnostics)
│   │   ├── snacks.lua                # Snacks.nvim keybindings (zen, terminal, etc.)
│   │   │   ├── buffers.lua           # Buffer management
│   │   │   ├── git.lua               # Git operations (Lazygit, browse)
│   │   │   ├── notifications.lua     # Notification controls
│   │   │   └── terminal.lua          # Terminal toggle
│   │
│   ├── plugins/                      # Plugin configurations (23 files)
│   │   ├── avante.lua                # AI assistant
│   │   ├── blink-cmp.lua             # Completion engine
│   │   ├── bufferline.lua            # Buffer/tab line
│   │   ├── conform.lua               # Code formatting
│   │   ├── gitsigns.lua              # Git integration
│   │   ├── grug-far.lua              # Project-wide search/replace
│   │   ├── guess-indent.lua          # Auto-detect indentation
│   │   ├── harpoon.lua               # Quick file navigation
│   │   ├── lint.lua                  # Linting
│   │   ├── mini.lua                  # Mini plugins (ai, surround)
│   │   ├── neovim-project.lua        # Project management
│   │   ├── nvim-autopairs.lua        # Auto-close brackets
│   │   ├── nvim-drawer.lua           # Sidebar management
│   │   ├── nvim-lsp-file-operations.lua  # LSP file sync
│   │   ├── nvim-lspconfig.lua        # LSP configuration
│   │   ├── nvim-rip-substitute.lua   # Search/replace
│   │   ├── nvim-tree.lua             # File explorer
│   │   ├── nvim-treesitter.lua       # Syntax highlighting
│   │   ├── nvim-ts-autotag.lua       # Auto-close HTML tags
│   │   ├── snacks.lua                # Utility collection
│   │   ├── telescope.lua             # Fuzzy finder
│   │   ├── todo-comments.lua         # TODO highlighting
│   │   ├── tokyonight.lua            # Colorscheme
│   │   └── which-key.lua             # Keymap helper
│   │
│   └── envs/                         # Environment-specific configs
│       ├── avante.example.lua        # AI provider configuration
│       └── neovim-project.example.lua # Project discovery paths
│
└── snippets/                         # Custom snippet collection
    ├── README.md                     # Snippet documentation
    ├── USAGE.md                      # Usage instructions
    ├── QUICK_REFERENCE.md            # Quick reference
    └── vue/                          # Vue 3 snippets
        ├── SNIPPETS_LIST.md          # Complete snippet list
        ├── vue.lua                   # 19 core Vue snippets
        ├── html.lua                  # 15 HTML/template snippets
        └── typescript.lua            # 10 TypeScript type snippets
```

---

## ⚙️ Core Configuration

### init.lua

The main configuration file sets up:

- **Leader key**: `;` (both leader and local leader)
- **Editor options**:
  - Line numbers enabled
  - Mouse support
  - Clipboard sync with OS
  - Smart case-insensitive search
  - 2-space indentation (tabs converted to spaces)
  - Split windows open right/below
  - Scroll offset: 10 lines
  - No swapfiles
  - Persistent undo history
  - Confirm before quitting unsaved buffers

- **Plugin management**: lazy.nvim with auto-install
- **Module loading**: Loads `keybindings` and `autocmds` modules

### autocmds.lua

Auto-commands for enhanced functionality:

- **Vue file support**: Auto-enables ts-autotag for Vue files
- **HTML injection**: Registers HTML language for Vue template sections
- **Yank highlighting**: Visual feedback when copying text

---

## 🔌 Plugin Configurations

### LSP & Completion

#### nvim-lspconfig
**Purpose**: Language Server Protocol client configuration

**Configured Servers**:
- `ts_ls` - TypeScript/JavaScript
- `vue_ls` - Vue.js (Volar)
- `gopls` - Go
- `rust_analyzer` - Rust
- `lua_ls` - Lua (with Neovim runtime)
- `pyright` - Python
- `cssls` - CSS/SCSS
- `emmet_language_server` - HTML/CSS Emmet

**Customizations**:
- Auto-install via Mason integration
- Document highlighting on cursor hold
- Inlay hints support (toggle with `<leader>th`)
- Severity-sorted diagnostics
- Telescope integration for LSP pickers (definitions, references, symbols)
- Custom keybindings on LSP attach

**Keybindings**: `gd`, `gD`, `gr`, `gI`, `gy`, `grn`, `gra`, `gO`, `gW`

---

#### blink.cmp
**Purpose**: Fast completion engine with snippet support

**Customizations**:
- LuaSnip integration for custom snippets
- Multiple sources: LSP, buffer, path, snippets
- Super-tab preset (Tab/Shift-Tab navigation)
- Auto-brackets for functions and methods
- Documentation preview with Treesitter highlighting
- Signature help window
- Ghost text for inline suggestions
- Fuzzy matching with frecency sorting
- Custom snippet loading from `~/.config/nvim/snippets`
- Filetype-specific snippets (Vue files get HTML/JS/TS/CSS snippets)

**Keybindings**: `<Tab>` (accept), `<C-e>` (hide), `<C-k/j>` (scroll docs)

---

#### nvim-lsp-file-operations
**Purpose**: Sync file operations with LSP

**Customizations**:
- Automatically updates imports when files are moved/renamed
- Integrated with nvim-tree file explorer
- Prevents broken imports after file reorganization

---

#### nvim-autopairs
**Purpose**: Auto-close brackets, quotes, and parentheses

**Customizations**:
- Works in insert mode only
- Smart pairing for all bracket types
- Quote pairing with context awareness

---

### File Navigation & Management

#### telescope.nvim
**Purpose**: Fuzzy finder for files, text, and more

**Customizations**:
- Custom project marks picker with git-ignore filtering
- Telescope pickers for LSP (definitions, references, symbols)
- Git integration (branches, commits, status, stash, file history)
- Live grep with ripgrep
- Recent files tracking
- Buffer switching
- Help tags, keymaps, and command history search
- Custom mark deletion commands

**Keybindings**: `<leader><space>`, `<leader>ff`, `<leader>/`, `<leader>sg`, `<leader>gb`, and many more

---

#### nvim-tree
**Purpose**: File explorer sidebar

**Customizations**:
- Sync root with current working directory
- Auto-update focused file location
- Auto-reload on directory change
- Integration with nvim-web-devicons
- LSP file operations support (rename/move updates imports)

**Keybindings**: `<leader>e` (toggle/focus)

---

#### nvim-drawer
**Purpose**: Persistent sidebar management

**Customizations**:
- Left-side drawer with 40-character width
- Keeps nvim-tree persistent across tabs
- Auto-reload on tab change
- Integrated with nvim-tree for seamless experience

---

#### harpoon (v2)
**Purpose**: Quick file navigation with marked files

**Customizations**:
- Mark up to 5 frequently used files
- Instant switching between marked files
- Support for splits, tabs, and windows
- Telescope integration for menu

**Keybindings**: `<leader>ha` (add), `<leader>hh` (menu), `<leader>h1-5` (jump), `<leader>hp/hn` (prev/next)

---

#### neovim-project
**Purpose**: Project management and session persistence

**Customizations**:
- Auto-discovery of projects from configured paths
- Session state persistence (buffers, windows, tabs)
- Auto-load last session on startup
- Telescope integration for project switching
- Dashboard integration

**Configuration**: Set project paths in `lua/envs/neovim-project.lua`

**Keybindings**: `<leader>pp` (discover), `<leader>ph` (history), `<leader>pr` (go to root)

---

### Git Integration

#### gitsigns.nvim
**Purpose**: Git change indicators and operations

**Customizations**:
- Visual indicators for added/changed/deleted lines
- Staged changes support
- Current line blame info (author, time, summary)
- Auto-attach to git repositories
- Virtual text for blame information
- Max file length: 40,000 lines for performance

---

### Formatting & Linting

#### conform.nvim
**Purpose**: Code formatting with multiple formatters

**Configured Formatters**:
- `stylua` - Lua
- `prettier` - JS/TS/Vue/CSS/HTML/JSON/YAML/Markdown

**Customizations**:
- Format on save support
- Prettier only runs if `.prettierrc*` config file is found in project
- LSP fallback formatting if no formatter configured
- Timeout: 3 seconds

**Keybindings**: `<leader>f` (format buffer)

---

#### nvim-lint
**Purpose**: Linting integration

**Configured Linters**:
- `markdownlint` - Markdown files

**Customizations**:
- Auto-lint on: BufEnter, BufWritePost, InsertLeave
- Only lints modifiable buffers
- Async linting to prevent blocking

---

#### guess-indent.nvim
**Purpose**: Auto-detect indentation settings

**Customizations**:
- Automatically detects tabs vs spaces
- Detects indent width (2, 4, 8 spaces)
- Runs on buffer read

---

### Syntax & Highlighting

#### nvim-treesitter
**Purpose**: Advanced syntax highlighting and code understanding

**Configured Languages**: bash, c, html, lua, luadoc, markdown, vim, vimdoc, javascript, typescript, tsx, vue, scss, css, json, yaml, go

**Customizations**:
- Auto-install parsers on first encounter
- Incremental selection with `<C-space>` (init/increment) and `<bs>` (decrement)
- Smart indentation based on syntax tree
- Performance optimization: disables for files >100KB
- Fold support

---

#### nvim-ts-autotag
**Purpose**: Auto-close and rename HTML/XML tags

**Supported Languages**: HTML, XML, Vue, JSX/TSX, Svelte, PHP

**Customizations**:
- Auto-close tags on `>`
- Auto-rename tag pairs when editing
- Smart skip for self-closing tags (img, input, br, hr, etc.)
- Vue file integration via autocmd

---

### Search & Replace

#### grug-far.nvim
**Purpose**: Project-wide search and replace with interactive UI

**Customizations**:
- Interactive search/replace interface
- Visual selection support
- Word-under-cursor search
- Live preview of changes

**Keybindings**: `<leader>sr` (search/replace), `<leader>sR` (search word)

---

#### nvim-rip-substitute
**Purpose**: Advanced search and replace with transient UI

**Customizations**:
- Transient popup UI for quick edits
- Visual mode support
- Ripgrep integration

**Keybindings**: `<leader>fs` (search/replace)

---

### UI & UX

#### bufferline.nvim
**Purpose**: Enhanced buffer/tab line

**Customizations**:
- LSP diagnostics integration (error/warning counts)
- Always show bufferline
- NvimTree offset support (prevents overlap)
- Buffer icons with nvim-web-devicons
- Buffer reordering support

**Keybindings**: `<S-h>` (prev), `<S-l>` (next), `<S-C-j>` (move left), `<S-C-k>` (move right)

---

#### which-key.nvim
**Purpose**: Keymap popup helper

**Customizations**:
- Shows available keybindings in popup after leader key
- Context-aware suggestions
- Grouped by functionality

**Keybindings**: `<leader>?` (show buffer local keymaps)

---

#### snacks.nvim
**Purpose**: Collection of 20+ utility features

**Enabled Features**:
- `bigfile` - Performance optimizations for large files
- `bufdelete` - Smart buffer deletion
- `dashboard` - Startup dashboard
- `debug` - Debug utilities
- `dim` - Dim inactive windows
- `git` - Git utilities (browse, Lazygit)
- `image` - Image support
- `indent` - Indent guides
- `input` - Enhanced input UI
- `notifier` - Notification system
- `picker` - File picker
- `profiler` - Performance profiling
- `quickfile` - Quick file operations
- `rename` - File renaming
- `scope` - Scope management
- `scroll` - Smooth scrolling
- `statuscolumn` - Enhanced status column
- `terminal` - Floating terminal
- `toggle` - UI toggles (spelling, wrap, diagnostics, etc.)
- `words` - Word highlighting
- `zen` - Zen mode for distraction-free editing

**Keybindings**: `<leader>z` (zen), `<leader>Z` (zoom), `<C-/>` (terminal), `<leader>un` (dismiss notifications), and many UI toggles with `<leader>u*`

---

#### tokyonight.nvim
**Purpose**: Colorscheme

**Customizations**:
- TokyoNight theme (night variant)
- Non-italic comments
- High priority loading (1000)

---

#### mini.nvim
**Purpose**: Collection of minimal independent plugins

**Enabled Modules**:
- `mini.ai` - Enhanced text objects (around/inside with extended support)
- `mini.surround` - Surround operations (add, delete, replace, find, highlight)

---

### AI Assistant

#### avante.nvim
**Purpose**: AI-powered coding assistant

**Customizations**:
- Configurable AI provider (Claude/OpenAI/etc.)
- Agentic mode for autonomous code editing
- Image pasting support
- Markdown rendering in chat
- NvimTree integration for file context selection
- Custom instructions file support (`avante.md` in project root)
- Environment-based configuration

**Configuration**: Set API keys in `lua/envs/avante.lua` or via environment variables

**Keybindings**: `<leader>a+` (add file in tree), `<leader>a-` (remove file in tree)

---

### Utilities

#### todo-comments.nvim
**Purpose**: Highlight and search TODO comments

**Customizations**:
- Highlights: TODO, FIXME, NOTE, HACK, WARNING, PERF, TEST
- Searchable via Telescope
- Default configuration

---

## ⌨️ Keybindings Reference

> **Leader key**: `;`

### Essential Bindings

| Key | Mode | Action |
|-----|------|--------|
| `jk` / `kj` | Insert | Escape to normal mode |
| `<Esc>` | Normal | Clear search highlight |
| `<leader>d` | Normal | Open diagnostic float |

### Window Navigation

| Key | Mode | Action |
|-----|------|--------|
| `<C-h/j/k/l>` | Normal | Move focus between windows |
| `<C-S-h/j/k/l>` | Normal | Move windows themselves |

### File Explorer

| Key | Mode | Action |
|-----|------|--------|
| `<leader>e` | Normal | Toggle/focus file explorer |

### Harpoon (Quick Navigation)

| Key | Action |
|-----|--------|
| `<leader>ha` | Add file to harpoon |
| `<leader>hh` | Toggle harpoon menu |
| `<leader>h1-5` | Jump to harpoon file 1-5 |
| `<leader>hp/hn` | Previous/next harpoon file |

### Telescope (Fuzzy Finder)

**File Finding:**
| Key | Action |
|-----|--------|
| `<leader><space>` | Find files |
| `<leader>ff` | Find files |
| `<leader>fc` | Find config files |
| `<leader>fg` | Find git files |
| `<leader>fr` | Recent files |
| `<leader>fb` / `<leader>,` | Buffers |

**Searching:**
| Key | Action |
|-----|--------|
| `<leader>/` | Grep in project |
| `<leader>sg` | Live grep |
| `<leader>sw` | Search word under cursor |
| `<leader>sb` | Search in current buffer |
| `<leader>sB` | Search in open buffers |

**LSP:**
| Key | Action |
|-----|--------|
| `<leader>ss` | Document symbols |
| `<leader>sS` | Workspace symbols |
| `<leader>sd` | Diagnostics |

**Git:**
| Key | Action |
|-----|--------|
| `<leader>gb` | Git branches |
| `<leader>gl` | Git log |
| `<leader>gs` | Git status |
| `<leader>gS` | Git stash |
| `<leader>gf` | File git log |

**Other:**
| Key | Action |
|-----|--------|
| `<leader>sh` | Search help |
| `<leader>sk` | Search keymaps |
| `<leader>sm` | Search marks |
| `<leader>smp` | Search project marks (git-ignored) |
| `<leader>s"` | Registers |
| `<leader>:` | Command history |

### LSP

| Key | Action |
|-----|--------|
| `gd` | Go to definition (Telescope) |
| `gD` | Go to declaration |
| `gr` | References (Telescope) |
| `gI` | Go to implementation (Telescope) |
| `gy` | Go to type definition (Telescope) |
| `grn` | Rename symbol |
| `gra` | Code action |
| `gO` | Document symbols (Telescope) |
| `gW` | Workspace symbols (Telescope) |
| `<leader>th` | Toggle inlay hints |

### Formatting & Search/Replace

| Key | Action |
|-----|--------|
| `<leader>f` | Format buffer |
| `<leader>fs` | Search and replace (rip-substitute) |
| `<leader>sr` | Search and replace (grug-far) |
| `<leader>sR` | Search and replace word (grug-far) |

### Buffers

| Key | Action |
|-----|--------|
| `<S-h>` | Previous buffer |
| `<S-l>` | Next buffer |
| `<S-C-j>` | Move buffer left |
| `<S-C-k>` | Move buffer right |
| `<leader>q` | Delete buffer |
| `<leader>S` | Select scratch buffer |
| `<leader>.` | Toggle scratch buffer |

### Git (Snacks)

| Key | Action |
|-----|--------|
| `<leader>gB` | Git browse (open in browser) |
| `<leader>gg` | Open Lazygit |

### Terminal

| Key | Mode | Action |
|-----|------|--------|
| `<C-/>` | Normal/Terminal | Toggle terminal |
| `<C-_>` | Normal/Terminal | Toggle terminal (alt binding) |

### Zen Mode

| Key | Action |
|-----|--------|
| `<leader>z` | Toggle zen mode |
| `<leader>Z` | Toggle zoom (current window) |

### Notifications & UI Toggles

| Key | Action |
|-----|--------|
| `<leader>un` | Dismiss all notifications |
| `<leader>us` | Toggle spelling |
| `<leader>uw` | Toggle wrap |
| `<leader>uL` | Toggle relative numbers |
| `<leader>ud` | Toggle diagnostics |
| `<leader>ul` | Toggle line numbers |
| `<leader>uc` | Toggle conceallevel |
| `<leader>uT` | Toggle treesitter |
| `<leader>ub` | Toggle background (dark/light) |
| `<leader>uh` | Toggle inlay hints |
| `<leader>ug` | Toggle indent guides |
| `<leader>uD` | Toggle dim |

### File Operations

| Key | Action |
|-----|--------|
| `<leader>cR` | Rename file |

### Projects

| Key | Action |
|-----|--------|
| `<leader>pp` | Discover projects |
| `<leader>ph` | Project history |
| `<leader>pr` | Go to project root |

### AI Assistant (Avante)

| Key | Filetype | Action |
|-----|----------|--------|
| `<leader>a+` | NvimTree | Add file to Avante context |
| `<leader>a-` | NvimTree | Remove file from Avante context |

### Reference Navigation

| Key | Action |
|-----|--------|
| `]]` | Next reference (supports count) |
| `[[` | Previous reference (supports count) |

### Other

| Key | Action |
|-----|--------|
| `<leader>N` | Open Neovim news |
| `<leader>?` | Show buffer local keymaps |

---

## 🔧 LSP & Language Support

### Configured Language Servers

| Language | Server | Status |
|----------|--------|--------|
| **TypeScript/JavaScript** | ts_ls | ✅ Full support |
| **Vue** | vue_ls | ✅ Full support + snippets |
| **Go** | gopls | ⚠️ Basic (see GOALS.md for planned improvements) |
| **Rust** | rust_analyzer | ✅ Full support |
| **Lua** | lua_ls | ✅ Full support |
| **Python** | pyright | ✅ Full support |
| **CSS** | cssls | ✅ Full support |
| **HTML** | emmet_language_server | ✅ Emmet support |

### Treesitter Languages

Syntax highlighting for: bash, c, html, lua, luadoc, markdown, vim, vimdoc, javascript, typescript, tsx, vue, scss, css, json, yaml, go

### Formatters

- **Lua**: stylua
- **JS/TS/Vue/CSS/HTML/JSON/YAML/Markdown**: prettier (requires `.prettierrc*` config)
- **Fallback**: LSP formatting

### Linters

- **Markdown**: markdownlint

---

## 🌍 Environment Configuration

### Project Discovery

Create `lua/envs/neovim-project.lua`:

```lua
return {
  projects = {
    '~/Projects/*',
    '~/Work/*',
    '~/Code/*',
  },
}
```

### AI Assistant (Avante)

Create `lua/envs/avante.lua`:

```lua
return {
  provider = "claude",
  providers = {
    claude = {
      endpoint = "https://api.anthropic.com",
      model = "claude-sonnet-4-5-20250929",
      timeout = 30000,
      extra_request_body = {
        temperature = 0.75,
        max_tokens = 20480,
      },
      -- Add your API key here or set ANTHROPIC_API_KEY env var
    },fds
  },
}
```

**Environment variables:**
- `ANTHROPIC_API_KEY` - Claude API key
- `OPENAI_API_KEY` - OpenAI API key (if using OpenAI provider)

### Custom Instructions

Create `avante.md` in your project root for project-specific AI instructions.

---

## 🏥 Health Check

Run comprehensive health checks:

```vim
:checkhealth
```

Checks for:
- Neovim version (>= 0.10 required)
- External dependencies (git, make, unzip, ripgrep)
- System information
- Plugin health status

---

## 🗺️ Future Roadmap

See [GOALS.md](./GOALS.md) for a comprehensive improvement plan including:

### High Priority

- ✅ **Enhanced Golang Development**
  - go.nvim for advanced Go features
  - goimports, gofmt formatters
  - golangci-lint linting
  - Enhanced gopls configuration
  - Go snippets

- ✅ **PostgreSQL/SQL Support**
  - SQL LSP (sqls)
  - vim-dadbod-ui for database management
  - SQL formatter
  - SQL snippets

- ✅ **Debugging (DAP)**
  - nvim-dap with dap-go and dap-ui
  - Visual debugging for Go and TypeScript

- ✅ **Test Runner (Neotest)**
  - neotest with Go and Vitest adapters
  - Inline test results
  - Test coverage

### Medium Priority

- Enhanced linting (ESLint, golangci-lint)
- Trouble.nvim for better diagnostics
- Diffview for enhanced Git workflow
- REST API client (kulala.nvim)
- Treesitter text objects
- EditorConfig support
- Import organization keymaps

---

## 📖 Additional Resources

- **Plugin documentation**: Run `:Lazy` to see all installed plugins
- **Keybinding help**: Press `<leader>?` or `:WhichKey`
- **LSP info**: `:LspInfo`
- **Mason**: `:Mason` to manage LSP servers, formatters, linters
- **Telescope help**: `<leader>sh` then search for any topic
- **Snippet reference**: See [snippets/QUICK_REFERENCE.md](./snippets/QUICK_REFERENCE.md)

---

## 🤝 Contributing

This is a personal configuration, but feel free to:
- Use it as inspiration for your own setup
- Submit issues for bugs
- Suggest improvements via pull requests

---

## 📄 License

MIT License - Feel free to use and modify for your own purposes.

---

**Version**: 1.0.0
**Last Updated**: 2026-03-14
**Neovim Version**: >= 0.10
**Plugin Manager**: lazy.nvim

