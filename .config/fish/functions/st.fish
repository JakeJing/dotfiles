function st --description "syncronize the dotfiles and update the git repos"
    if test (count $argv) -gt 1
        cd ~/dotfiles && stow --adopt -d . -t $argv
        echo "Arguments were passed: $argv[1]"
        gu $argv[2]
    else
        echo "pls specify the target directory the softlinks should be saved!"
    end
end
