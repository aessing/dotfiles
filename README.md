# Andre's Dotfiles

This repository contains my personal configuration files, customizations, themes, and fonts to personalize my macOS and Linux experience. It works on **macOS**, **Linux**, and **GitHub Codespaces**.

---

## :rocket: Quick Start

### Fresh macOS Installation

Run this single command to set up everything automatically:

```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/aessing/dotfiles/main/setup_macos.sh)"
```

This will:
1. Install **Homebrew**
2. Install **Git** via Homebrew
3. Clone this repository to `~/.dotfiles`
4. Install packages from a **Brewfile** (your choice)
5. Apply **macOS system preferences**
6. **Symlink** all dotfiles to your home directory

### Existing Installation / Linux / Codespaces

```bash
git clone https://github.com/aessing/dotfiles.git ~/.dotfiles
cd ~/.dotfiles
./install.sh
```

---

## :open_file_folder: What's Included

### :gear: Shell Configuration

| File | Description |
|------|-------------|
| `.zshrc` | Main Zsh configuration file |
| `.zshenv` | Environment variables (loaded for all shells) |
| `.zprofile` | Login shell configuration |
| `.zsh/` | Modular Zsh configuration scripts |

#### Zsh Modules (`.zsh/`)

| Module | Description |
|--------|-------------|
| `aliases.zsh` | Shell aliases and shortcuts |
| `autocomplete.sh` | Zsh autosuggestions configuration |
| `azure_functions.zsh` | Azure Functions CLI settings |
| `docker.zsh` | Docker CLI completions |
| `dotnet.zsh` | .NET SDK configuration |
| `functions.zsh` | Custom shell functions |
| `homebrew.zsh` | Homebrew environment setup |
| `monokai.zsh` | Zsh syntax highlighting (Monokai theme) |
| `nvm.zsh` | Node Version Manager configuration |
| `python.zsh` | Python/Homebrew Python setup |
| `starship.zsh` | Starship prompt with distro detection |

### :package: Package Management

| File | Description |
|------|-------------|
| `.Brewfile` | Personal Homebrew packages (full setup) |
| `.Brewfile.DBX` | Databricks Homebrew packages |

### :wrench: Configuration Files

| File | Description |
|------|-------------|
| `.gitconfig` | Git configuration with aliases and settings |
| `.config/starship.toml` | Starship prompt configuration |
| `.config/1Password/ssh/agent.toml` | 1Password SSH agent settings |
| `.ssh/config` | SSH client configuration |

### :abc: Fonts

Using [Nerd Fonts](https://www.nerdfonts.com) for icons in terminal and applications:

| Font | Description |
|------|-------------|
| **CaskaydiaCove Nerd Font** | Patched Cascadia Code with Nerd Font icons |
| **CaskaydiaMono Nerd Font** | Monospace variant – ideal for terminal |
| **JetBrains Mono Nerd Font** | Developer typeface with Nerd Font icons |

> **Currently using:** JetBrains Mono Nerd Font

### :art: Themes

#### Monokai Pro Terminal Themes

Beautiful Monokai Pro themes for macOS Terminal.app:

- Monokai Classic
- Monokai Pro
- Monokai Pro (Filter Machine)
- Monokai Pro (Filter Octagon)
- Monokai Pro (Filter Ristretto)
- Monokai Pro (Filter Spectrum)
- Monokai Pro Light
- Monokai Pro Light (Filter Sun)

> **Currently using:** Monokai Pro (Filter Spectrum)  
> More info: [monokai.pro](https://monokai.pro/)

---

## :computer: Scripts

### `setup_macos.sh`

Full macOS bootstrap script with interactive prompts:

```bash
./setup_macos.sh
```

**Steps:**
1. Install Homebrew
2. Install Git
3. Clone dotfiles repository
4. Install packages from Brewfile (selectable)
5. Apply macOS system preferences
6. Symlink dotfiles

### `install.sh`

Cross-platform dotfiles symlink script:

```bash
./install.sh [--force]
```

**Options:**
- `--force` — Overwrite existing files without creating backups

**Platforms:** macOS, Linux, GitHub Codespaces

### `Config/set-macOS-defaults.sh`

Apply macOS system preferences:

```bash
./Config/set-macOS-defaults.sh
```

---

## :cloud: GitHub Codespaces

This repository includes a `.devcontainer/devcontainer.json` for automatic setup in GitHub Codespaces:

- **Zsh** as default shell
- **Starship** prompt pre-installed
- **Zsh plugins:** zsh-autosuggestions & zsh-syntax-highlighting
- **GitHub CLI** (`gh`) pre-installed
- **uv** (fast Python package manager) installed
- **specify-cli** (spec-driven development) installed
- Dotfiles automatically symlinked

---

## :floppy_disk: Manual Installation

### Fonts via Homebrew

```bash
brew install --cask font-caskaydia-cove-nerd-font
brew install --cask font-caskaydia-mono-nerd-font
brew install --cask font-jetbrains-mono-nerd-font
```

### Fonts Manual

1. Navigate to `Fonts/` directory
2. Open desired font folder
3. Double-click font files to install via Font Book (macOS)

### Terminal Themes (macOS)

1. Navigate to `Themes/monokai-pro-terminal/`
2. Double-click `.terminal` file to import
3. Set as default in Terminal → Preferences → Profiles

---

## :file_folder: Repository Structure

```text
~/.dotfiles/
├── .Brewfile                    # Homebrew packages (personal)
├── .Brewfile.DBX                # Homebrew packages (work)
├── .config/
│   ├── 1Password/ssh/agent.toml
│   └── starship.toml
├── .devcontainer/
│   └── devcontainer.json        # Codespaces configuration
├── .gitconfig
├── .ssh/
│   ├── config
│   └── 1Password/config
├── .zsh/                        # Modular Zsh configs
│   ├── aliases.zsh
│   ├── autocomplete.sh
│   ├── azure_functions.zsh
│   ├── docker.zsh
│   ├── dotnet.zsh
│   ├── functions.zsh
│   ├── homebrew.zsh
│   ├── monokai.zsh
│   ├── nvm.zsh
│   ├── python.zsh
│   └── starship.zsh
├── .zshenv
├── .zprofile
├── .zshrc
├── Config/
│   └── set-macOS-defaults.sh    # macOS system preferences
├── Fonts/
│   ├── CaskaydiaCoveNerdFont/
│   ├── CaskaydiaMonoNerdFont/
│   └── JetBrainsMonoNerdFont/
├── Themes/
│   └── monokai-pro-terminal/    # Terminal.app themes
├── install.sh                   # Cross-platform symlink script
├── setup_macos.sh               # macOS bootstrap script
└── README.md
```

---

## :star: Credits

Inspired by the **Dotfiles** repository by [**Christian Lempa**](https://github.com/ChristianLempa/dotfiles). Thanks Christian!

---

## :ambulance: Support Information

For further information about this project, how to [contribute](CONTRIBUTING.md), or how to contact us, please have a look at the [support document](SUPPORT.md) of this repository. It also contains information about [security related topics](SECURITY.md), [licensing](LICENSE.md), and more.

## :man_judge: Disclaimer

THE CONTENT OF THIS REPOSITORY IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE CONTENT OF THIS REPOSITORY OR THE USE OR OTHER DEALINGS BY CONTENT OF THIS REPOSITORY.
