# My-ZSH
My-ZSH is a simple ZSH plugin manager allowing for easy management and installation of ZSH plugins.

## Installation
To install My-ZSH, open a terminal and execute the following command:
```bash
git clone https://github.com/Zyfax/my-zsh.git "$HOME/.local/share/my-zsh/"
```

## Configuration of .zshrc
After My-ZSH has been installed, you need to add some lines to your .zshrc file to initialize the plugin manager and install the desired plugins.
Append the following lines to your .zshrc:
```zsh
## my-zsh init
[ -f "${XDG_DATA_HOME:-$HOME/.local/share}/my-zsh/my-zsh.zsh" ] && source "${XDG_DATA_HOME:-$HOME/.local/share}/my-zsh/my-zsh.zsh"

# Install Plugins
plug_inst "zsh-users/zsh-autosuggestions"
plug_inst "zsh-users/zsh-syntax-highlighting"
plug_inst "zsh-users/zsh-history-substring-search"
#plug_inst "zsh-users/zsh-completions"
plug_inst "zyfax/zsh-prompt"
```

### What needs to be done
1. Clone the My-ZSH repository to your local machine.
2. Append the configuration lines to your .zshrc file.
3. Install the desired plugins using the plug_inst command in the .zshrc file.
4. Save the .zshrc file and restart your ZSH shell or run source .zshrc to apply the changes.
