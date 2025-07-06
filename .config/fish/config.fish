. ~/.config/fish/aliases.fish
. ~/.config/fish/abbr_fish.sh

set -x LC_ALL en_US.UTF-8
set -x BEAST_PACKAGE_PATH "/Users/jakejing/Library/Application\ Support/BEAST/2.5"

set -g -x PATH /opt/homebrew/bin /usr/local/bin /usr/local/lib /Users/jakejing/.cargo/bin /opt/local/bin/ /Library/TeX/texbin /opt/local/bin /usr/bin /Applications/Julia-1.7.app/Contents/Resources/julia/bin /Users/jakejing/.config/vifm/scripts/ /usr/local/share/ /usr/local/share/fish/completions/ /Users/jakejing/.script/ /usr/local/bin/jupyter-nbextension /Users/jakejing/.nvm /Users/jakejing/switchdrive/uralic/TuLeD /Applications/BEAST\ 3.5.1/bin /Library/PostgreSQL/13/bin /Applications/Skim.app/Contents/MacOS /Applications/Skim.app/Contents/SharedSupport /usr/local/opt/ruby/bin /Users/jakejing/Library/Application\ Support/BEAST/2.5 /usr/local/bin/ltex-ls-16.0.0/bin /Applications/WezTerm.app/Contents/MacOS/ /Applications/kitty.app/Contents/MacOS/ /Users/jakejing/go/bin/ $PATH

# Setting PATH for Python 3.11
# The original version is saved in /Users/jakejing/.config/fish/config.fish.pysave
set -x PATH "/opt/homebrew/bin" "$PATH"

# -L/usr/local/opt/llvm/lib

set -gx LDFLAGS "-L/usr/local/opt/openssl@3/lib"
set -gx CPPFLAGS "-I/usr/local/opt/openssl@3/include"
set -gx PKG_CONFIG_PATH "/usr/local/opt/openssl@3/lib/pkgconfig"

# set nvim/hx as the default editor
set -x EDITOR nvim

# set -x TERM xterm-kitty-direct
# set -x KITTY_ENABLE_WAYLAND 0
# set -x TERM xterm-kitty

# set the default keybinding
set -U fish_key_bindings fish_default_key_bindings

set fish_greeting ""

# Paths to your tackle
set tacklebox_path ~/.tackle ~/.tacklebox

# Theme
#set tacklebox_theme entropy bobthefish
set theme_color_scheme bobthefish

# Which modules would you like to load? (modules can be found in ~/.tackle/modules/*)
# Custom modules may be added to ~/.tacklebox/modules/
# Example format: set tacklebox_modules virtualfish virtualhooks

# Which plugins would you like to enable? (plugins can be found in ~/.tackle/plugins/*)
# Custom plugins may be added to ~/.tacklebox/plugins/
# Example format: set tacklebox_plugins python extract

set fish_plugins autojump vi-mode tacklebox_plugins python extract
# set vi_mode_default vi_mode_normal */

# Load Tacklebox configuration
. ~/.tacklebox/tacklebox.fish

test -e {$HOME}/.iterm2_shell_integration.fish; and source {$HOME}/.iterm2_shell_integration.fish

set -x LF_COLORS "~/Documents=01;31 ~/Downloads=01;31 ~/.local/share=01;31 ~/.config/lf/lfrc=31 .git/=01;32 .git*=32 *.gitignore=32 *Makefile=32 README.*=33 *.txt=34 *.md=34 ln=01;36 di=01;34 ex=01;32"


zoxide init fish | source

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/jakejing/Downloads/google-cloud-sdk/path.fish.inc' ]
    . '/Users/jakejing/Downloads/google-cloud-sdk/path.fish.inc'
end

# Added by Windsurf
fish_add_path /Users/jakejing/.codeium/windsurf/bin
eval "$(/opt/homebrew/bin/brew shellenv)"
