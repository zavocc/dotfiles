# Dotfiles
Dotfiles stored in `stow` format to make it easier to update and synchronize when changes happen. This does not support windows so another file management shall be used for interacting the `windows-home` subroot directory

# Applying
Install `stow` within your preferred package manager

Then clone this repository
```
cd
git clone https://github.com/zavocc/configs
```

On this repository, you will see two directories: `linux-home` and `windows-home` \
Since we're using stow, `linux-home` is used and IT SHOULD be stowed in your home directory

Directories inside `linux-home` consists of "packages" where stow farms symlinks where files should be placed as it is to specified target directory. When you stow this directory to specified target destination to farm symlinks, it will be placed "as is". So, you'll need to verify if there are files in your home directory exists before stowing configs.

One way to do it is to perform a dry-run, in this example we'll be using `neofetch` and if you had run neofetch before, you'll most likely to encounter a generated config file
```
stow -d ~/configs/linux-home -t ~ -S neofetch -n
```
When you see an error, its most likely there are files that is not part of the stow symlink farm exists. To do this, remove files or directories associated with it and run stow but without the `-n`
```
stow -d ~/configs/linux-home -t ~ -S neofetch
```

`-d` means to use specific directory to work on where it contains stow packages. By default, current directory will be used. If you're in the repository as your working directory (`pwd`) then you can omit this argument.

`-t` is critical, as it places the symlinks to that specified directory and places them "as is" based on the file structure of the stow packages. Otherwise, it defaults to parent directory without this.

`-S` means "what stow packages to be applied". Stow packages are basically folders which contains the file structure where it is supposed to be stored in specific directory, in this case, home directory.

Stow packages are just folders located in `linux-hone`, you will see familiar package names that contains config file. For example, `neofetch`, where it contains a configuration file in `.config/neofetch/config.conf`. When stowed, it places in home directory. It would be `~/.config/neofetch/config.conf` symlinked to this repository

Here is the visual representation:
```
Configs repository root
├── linux-home/ --> This is our "working directory" for stow packages. Inside, this contains "stow packages"
│   ├── bash/
│   ├── neofetch/ --> Example stow package where files are placed or merged in our home directory
│   │   └── .config/ --> when stowed, this directory will be placed or merged in our home directory "as is"
│   │       └── neofetch/
│   │           └── config.conf
│   ├── neovim/
│   └── termux/
├── windows-home/
├── .gitignore --> Use this to prevent specific files from being pushed in our repository
└── README.md
```

⚠️ In case for skeleton base systems, I'd suggest to create `.config` directory in your home directory before you stow as you don't want to gitignore whole .config directory where it contains files or directories that you're not supposed to be pushed, especially sensitive credentials stored in plaintext.