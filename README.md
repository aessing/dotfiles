<p align="center">
  <img src=".github/media/banner.png" alt="Andre's Dotfiles" width="100%">
</p>

<p align="center">
  <strong>Personal configuration files for macOS, Linux, and GitHub Codespaces</strong>
</p>

<p align="center">
  <a href="#-quick-start">Quick Start</a> •
  <a href="#-whats-included">What's Included</a> •
  <a href="#-scripts">Scripts</a> •
  <a href="#-codespaces">Codespaces</a>
</p>

---

## 🚀 Quick Start

### Fresh macOS Installation

```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/aessing/dotfiles/main/setup_macos.sh)"
```

This will install Homebrew, Git, clone the repo, install packages, apply macOS preferences, and symlink all dotfiles.

### Existing Installation / Linux / Codespaces

```bash
git clone https://github.com/aessing/dotfiles.git ~/.dotfiles
cd ~/.dotfiles
./install.sh
```

---

## 📂 What's Included

### Shell Configuration

| File | Description |
|------|-------------|
| `.zshrc` | Main Zsh configuration |
| `.zshenv` | Environment variables |
| `.zprofile` | Login shell configuration |
| `.zsh/` | Modular Zsh scripts |

<details>
<summary><strong>Zsh Modules</strong></summary>

| Module | Description |
|--------|-------------|
| `aliases.zsh` | Shell aliases and shortcuts |
| `autocomplete.sh` | Zsh autosuggestions |
| `azure_functions.zsh` | Azure Functions CLI |
| `docker.zsh` | Docker CLI completions |
| `dotnet.zsh` | .NET SDK configuration |
| `functions.zsh` | Custom shell functions |
| `homebrew.zsh` | Homebrew environment |
| `monokai.zsh` | Syntax highlighting theme |
| `monokai-style.zsh` | Monokai color definitions |
| `nvm.zsh` | Node Version Manager |
| `python.zsh` | Python/pyenv setup |
| `starship.zsh` | Starship prompt with distro detection |

</details>

### Configuration Files

| File | Description |
|------|-------------|
| `.gitconfig` | Git configuration with aliases |
| `.config/starship/starship.toml` | Starship prompt (Monokai Pro theme) |
| `.config/fastfetch/` | Fastfetch system info configuration |
| `.config/1Password/ssh/agent.toml` | 1Password SSH agent |
| `.ssh/config` | SSH client configuration |

### Package Management

| File | Description |
|------|-------------|
| `.Brewfile` | Personal Homebrew packages |
| `.Brewfile.DBX` | Work Homebrew packages |

### Fonts

[Nerd Fonts](https://www.nerdfonts.com) with icons for terminal:

- **CaskaydiaCove Nerd Font** — Patched Cascadia Code
- **CaskaydiaMono Nerd Font** — Monospace variant
- **JetBrains Mono Nerd Font** — Developer typeface *(currently using)*

### Themes

**Monokai Pro** themes for macOS Terminal.app:

| Theme | Variant |
|-------|---------|
| Monokai Classic | Original |
| Monokai Pro | Default |
| Monokai Pro (Filter Machine) | Blue tint |
| Monokai Pro (Filter Octagon) | Green tint |
| Monokai Pro (Filter Ristretto) | Brown tint |
| Monokai Pro (Filter Spectrum) | Purple tint *(currently using)* |
| Monokai Pro Light | Light variant |
| Monokai Pro Light (Filter Sun) | Warm light |

> More info: [monokai.pro](https://monokai.pro/)

---

## 💻 Scripts

### `setup_macos.sh`

Full macOS bootstrap with interactive prompts:

```bash
./setup_macos.sh
```

1. Install Homebrew
2. Install Git
3. Clone dotfiles repository
4. Install packages from Brewfile (selectable)
5. Apply macOS system preferences
6. Symlink dotfiles

### `install.sh`

Cross-platform dotfiles installer:

```bash
./install.sh [--force]
```

| Option | Description |
|--------|-------------|
| `--force` | Overwrite existing files without backup |

### `Config/set-macOS-defaults.sh`

Apply macOS system preferences:

```bash
./Config/set-macOS-defaults.sh
```

---

## ☁️ GitHub Codespaces

Automatic setup via `.devcontainer/devcontainer.json`:

- **Zsh** as default shell
- **Starship** prompt pre-installed
- **Zsh plugins** — autosuggestions & syntax-highlighting
- **GitHub CLI** (`gh`)
- **uv** — fast Python package manager
- **specify-cli** — spec-driven development
- Dotfiles automatically symlinked

---

## 📁 Repository Structure

```
~/.dotfiles/
├── .Brewfile                     # Homebrew packages (personal)
├── .Brewfile.DBX                 # Homebrew packages (work)
├── .config/
│   ├── 1Password/ssh/agent.toml  # 1Password SSH agent
│   ├── fastfetch/                # Fastfetch configuration
│   └── starship/starship.toml    # Starship prompt
├── .devcontainer/
│   └── devcontainer.json         # Codespaces configuration
├── .gitconfig                    # Git configuration
├── .ssh/
│   └── config                    # SSH configuration
├── .zsh/                         # Modular Zsh configs
├── .zshenv                       # Environment variables
├── .zprofile                     # Login shell config
├── .zshrc                        # Main Zsh config
├── Config/
│   └── set-macOS-defaults.sh     # macOS preferences
├── Fonts/                        # Nerd Fonts
├── Themes/
│   └── monokai-pro-terminal/     # Terminal.app themes
├── install.sh                    # Cross-platform installer
├── setup_macos.sh                # macOS bootstrap
└── README.md
```

---

## 🛠️ Manual Installation

<details>
<summary><strong>Fonts via Homebrew</strong></summary>

```bash
brew install --cask font-caskaydia-cove-nerd-font
brew install --cask font-caskaydia-mono-nerd-font
brew install --cask font-jetbrains-mono-nerd-font
```

</details>

<details>
<summary><strong>Fonts Manual</strong></summary>

1. Navigate to `Fonts/` directory
2. Open desired font folder
3. Double-click font files to install via Font Book (macOS)

</details>

<details>
<summary><strong>Terminal Themes (macOS)</strong></summary>

1. Navigate to `Themes/monokai-pro-terminal/`
2. Double-click `.terminal` file to import
3. Set as default in Terminal → Preferences → Profiles

</details>

---

## ⭐ Credits

Inspired by [Christian Lempa's Dotfiles](https://github.com/ChristianLempa/dotfiles).

---

## 📄 License & Support

For information about [contributing](CONTRIBUTING.md), [support](SUPPORT.md), [security](SECURITY.md), and [licensing](LICENSE.md), please see the respective documents.

---

<p align="center">
  <sub>THE CONTENT OF THIS REPOSITORY IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND.</sub>
</p>
