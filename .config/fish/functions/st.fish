function st --description "syncronize the dot files"
    cd ~/dotfiles && stow --adopt -d . -t ~ .
    gu $argv
end
