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
Optional
```zsh
# zsh-history-substring-search
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down
bindkey '^[OA' history-substring-search-up
bindkey '^[OB' history-substring-search-down

# Load and initialise completion system
autoload -Uz compinit
compinit

# ZSH history
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt SHARE_HISTORY
```

### What needs to be done
1. **Install Requirements**: Ensure that `zsh` and `git` are installed on your system.
2. **Clone the My-ZSH repository** to your local machine.
3. **Modify .zshrc file**: Append the configuration lines provided above to your `.zshrc` file to initialize My-ZSH and specify the plugins to be installed.
4. **Install Plugins**: The plugins specified in the `.zshrc` file will be installed when you restart your ZSH shell or run `source .zshrc`.
5. **Save and Restart ZSH Shell**: After appending the configuration lines and installing the desired plugins, save the `.zshrc` file and restart your ZSH shell or run `source .zshrc` to apply the changes.
