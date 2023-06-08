function st --description "syncronize the dotfiles and update the git repos"
    cd ~/dotfiles && stow --adopt -d . -t ~ .
    gu $argv
end
