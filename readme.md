# Dotfiles 

This is used to save and sync my dotfiles.

```
brew install stow
```

The local of stow is that you first copy all the necessary files that needs to be saved in the ~/dotfiles directory.

```
pwd
# /Users/jakejing/dotfiles/.config
```

- make a copy of the original file inside dotfiles/.config

```
# copy ~/.config/vifm/vifmrc into the ~/dotfiles/vifm
mkdir vifm && cp ~/.config/vifm/vifmrc vifm 
```

- stow the file to the target directory

```
# create symlinks in the target directory, based on currect directory structure. **Note** vifm at the end is just the package name.

stow --adopt --target ~/.config/vifm vifm
```

- git update

```
gu "update stow dotfiles"
```
