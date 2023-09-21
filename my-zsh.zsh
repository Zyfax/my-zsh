#!/bin/zsh

export ZSH_DIR="${XDG_DATA_HOME:-$HOME/.local/share}/my-zsh"
export ZSH_PLUGIN_DIR="$ZSH_DIR/plugins"
export ZSH_INSTALLED_PLUGINS=()


function plug_inst() {
    if ! [ -d $ZSH_PLUGIN_DIR ]; then
        mkdir -p "$ZSH_PLUGIN_DIR";
    fi

    function _try_source() {
        local -a initfiles=(
            $plugin_dir/${plugin_name}.{plugin.,}{z,}sh{-theme,}(N)
            $plugin_dir/*.{plugin.,}{z,}sh{-theme,}(N)
        )
        (( $#initfiles )) && source $initfiles[1]
    }

    local plugin_name="$1"
    local plugin_dir="$ZSH_PLUGIN_DIR/${plugin_name:t}"

    if ! [ -d $plugin_dir ]; then
        echo "Installing plugin $plugin_name"
        git clone --depth 1 "https://github.com/${plugin_name}.git" "$plugin_dir"> /dev/null 2>&1 || { echo -e "\e[1A\e[K❌ Failed to clone $plugin_name"; return 12 }
        echo -e "\e[1A\e[K✅ my-zsh installed $plugin_name"
    fi

    _try_source && { ZSH_INSTALLED_PLUGINS+="$plugin_name" && return 0 } || echo "❌ $plugin_name not activated" && return 1
}

# _zsh_help function
function _my_zsh_help() {
    echo "Usage: my-zsh <command> [options]"
    echo ""
    echo "Commands:"
    echo "  reinstall Reinstall all plugins"
    echo "  clean     Clean all plugins"
    echo ""
    echo "Options:"
    echo "  -h, --help     Show this help message"
    echo ""
}

# _zsh_reinstall_plugins function
function _my_zsh_reinstall_plugins() {
    echo "Reinstalling my-zsh plugins..."
    _my_zsh_clean_plugins
    for plugin in $ZSH_INSTALLED_PLUGINS; do
        plug_inst $plugin
    done    
    echo "✨ my-zsh reinstalled"
}

# _zsh_clean function
function _my_zsh_clean_plugins() {
    rm -rf $ZSH_PLUGIN_DIR/*
    echo "✨ my-zsh cleaned"
}

# my-zsh function
function my-zsh() {
    typeset -A subcmds=(
        reinstall "_my_zsh_reinstall_plugins"
        clean "_my_zsh_clean_plugins"
    )
    emulate -L zsh
    [[ -z "$subcmds[$1]" ]] && { _my_zsh_help; return 1 } || ${subcmds[$1]} $2
}