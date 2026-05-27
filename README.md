# Hanako Dotfiles

#### TODO
- mangowm
- waybar
- qutebrowser
- niri (yes i use two window managers)
- and idk, i'll be updating the current ones


#### PROFILES CONVENTIONS

- **global**: used by the rest of the profiles. if a specific folder has a duplicate package inside (e.x.: like tmux) then i would recommend to use the tmux from that profile and not from the global... but do whatever you want to!
- **desktop**: my main pc config
- **minimal**: just minimal config for low end devices, it mostly consist of vendoring

#### COPYING CONFIG

using with gnu stow (ln -s)

1. go to $HOME path and clone the repo (or fork it)

2. install [gnu stow](https://www.gnu.org/software/stow/) (with arch: sudo pacman -S stow, or void: sudo xbps-install -Su stow)

3. delete or move PREVIOUS folders to another location
   - (if installing nvim, go to ~/.config/nvim and delete its containing files)

4. in the .dotfiles folder, STAY ON ROOT, and use:

> [!IMPORTANT]
> cd into .dotfiles AND EXECUTE THE FOLLOWING COMMANDS FROM THERE

```sh
$ stow -d profile -t ~ config 
```

example: 
```sh
$ stow -d desktop -t ~ nvim
```

5. now that folder is a reference to your config. you can change whatever you want and it'll be reflected


#### ADDING CONFIG

1. create a .dotfiles folder on $HOME path

2. use this convention:

**PACKAGE_NAME/LOCATION**

e.x.:

- for nvim: nvim/.config
- for ghostty: ghostty/.config
- for zsh: zsh

> more on [this](https://typecraft.dev/tutorial/never-lose-your-configs-again)

3. move your files to the newly created folder

```sh
#examples:
$ mv ~/.config/nvim nvim/.config
$ mv ~/.config/ghostty/ ghostty/.config
$ mv ~/.zshrc zsh
```

and it should be like this:

```sh
$ tree -a -L 3 -d -I .git
.
├── nvim
│   └── .config
│       └── nvim
├── zellij
│   └── .config
│       └── zellij
└── zsh
```

and that should be it (then link them as i showed above) :)

**for checking: ls -l | grep package**
