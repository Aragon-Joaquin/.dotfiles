this is a .dotfiles folder of my arch config just to manage them between computers easily

using with gnu stow (ln -s)


## how to use it

#### if want to install my configs

1) go to $HOME path and clone the repo (or fork it)
2) install [gnu stow](https://www.gnu.org/software/stow/) (with arch: sudo pacman -S stow)
3) delete or move the folders to another locations (if installing nvim, go to ~/.config/nvim and delete its containing files)
4) in the .dotfiles folder, use:
```sh
$ stow folder #ex: stow nvim
```

5) now that folder is a reference to your config. you can change whatever you want and it'll be reflected

---

#### if want to add a new config

1) create a .dotfiles folder on $HOME path 
2) use this convention:

*PACKAGE_NAME/LOCATION*

e.x.:

- for nvim: nvim/.config
- for ghostty: ghostty/.config
- for zsh: zsh

more on [this](https://typecraft.dev/tutorial/never-lose-your-configs-again)

3) move your files to the newly created folder

e.x.:
- mv ~/.config/nvim nvim/.config
- mv ~/.config/ghostty/ ghostty/.config
- mv ~/.zshrc zsh 

and it should be like this:

- nvim/.config/nvim
- ghostty/.config/ghostty
- zsh/.zshrc

and that should be it (then link them as i showed above) :)

**for checking: ls -l | grep package**


