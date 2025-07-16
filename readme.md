# Dotfiles 

**Note:** this dotfoles is located in the home directory.

This is used to save and sync my dotfiles.

```
brew install stow
```

The local of stow is that you first copy all the necessary files that needs to be saved in the ~/dotfiles directory.

The easiest way of doing this is to copy all files to `dotfiles/.config` directory, and remove the unnecessary ones. Then you can stow the rest by specifying the target directory. Note: your wd should be inside the `.config`.

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
# create symlinks in the target directory, based on currect directory structure. **Note** vifm at the end is just the package name. You can pick up your own name
stow -h
stow --adopt --target ~/.config/vifm pkg-vifm
```

- git update

```
gu "update stow dotfiles"
```
