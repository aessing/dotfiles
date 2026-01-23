# Andre's Dotfiles

This repository contains my personal configuration files, customizations, themes, and fonts to personalize my macOS experience.

---

## :open_file_folder: What's Included

### :abc: Fonts

To display icons in terminal and applications, I'm using [Nerd Fonts](https://www.nerdfonts.com) – iconic font aggregator, collection, and patcher. The following fonts are included:

| Font | Description |
|------|-------------|
| **CaskaydiaCove Nerd Font** | A patched version of Cascadia Code with Nerd Font icons – perfect for applications |
| **CaskaydiaMono Nerd Font** | Monospace variant of CaskaydiaCove – ideal for terminal use |
| **JetBrains Mono Nerd Font** | A typeface for developers with Nerd Font icons |

> **Note:** I'm currently using **JetBrains Mono Nerd Font** in terminal applications and **JetBrains Mono Nerd Font** in other applications (VSCode).

### :art: Themes

Terminal themes to enhance the visual experience:

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

> **Note:** I'm currently using **Monokai Pro (Filter Spectrum)** in terminal application.
> You can find more information about Monokai Pro [here](https://monokai.pro/).

---

## :rocket: Installation

### Fonts

#### Via Homebrew (recommended)

```bash
# Tap the fonts cask
brew tap homebrew/cask-fonts

# Install CaskaydiaCove Nerd Font
brew install --cask font-caskaydia-cove-nerd-font

# Install CaskaydiaMono Nerd Font
brew install --cask font-caskaydia-mono-nerd-font

# Install JetBrains Mono Nerd Font
brew install --cask font-jetbrains-mono-nerd-font
```

#### Manual Installation

1. Navigate to the `Fonts/` directory
2. Open the desired font folder
3. Double-click on the font files to install them via Font Book (macOS) or your system's font manager

### Terminal Themes (macOS)

1. Navigate to `Themes/monokai-pro-terminal/`
2. Double-click on the `.terminal` file to import it into Terminal.app
3. Go to Terminal → Preferences → Profiles and set your preferred theme as default

---

## :star: Credits

This repository is inspired by the **Dotfiles** repository by [**Christian Lempa**](https://github.com/ChristianLempa/dotfiles). Thanks Christian!

---

## :ambulance: Support Information

For further information about this project, how to [contribute](CONTRIBUTING.md), or how to contact us, please have a look at the [support document](SUPPORT.md) of this repository. It also contains information about [security related topics](SECURITY.md), [licensing](LICENSE.md), and more.

## :man_judge: Disclaimer

THE CONTENT OF THIS REPOSITORY IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE CONTENT OF THIS REPOSITORY OR THE USE OR OTHER DEALINGS BY CONTENT OF THIS REPOSITORY.
