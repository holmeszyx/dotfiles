
See the powerful Dotfiles [mathiasbynens/dotfiles](https://github.com/mathiasbynens/dotfiles)

# Er

There are little things I need.

# Installation

Clone or download the repo, and `cd dotfiles && bash bootstrap.sh`.

```
git clone https://github.com/holmeszyx/dotfiles.git && cd dotfiles && bash bootstrap.sh
```

Installing first time maybe with '--force' option.

```
bash bootstrap.sh --force
# or
bash bootstap.sh
```

# Update

Pull by git.

# For initialize base VIM config

### Plug-vim

```
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```

Then 

open `vim` and run `:PlugInstall`

### Install YouCompleteMe

- Prepare

`Ubuntu`

```
sudo apt install build-essential cmake python3-dev
```

`Fedora`

```
dnf install cmake gcc-c++ make python3-devel
```

`yum`

```
yum install cmake gcc-c++ make python3-devel
```

- Install

```

cd ~/.vim/plugged/YouCompleteMe

# For C Family
python3 install.py --clang-completer
# or
# No C
python3 install.py

```


