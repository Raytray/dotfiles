Raymond Tang's dotfiles
=======================

My gitconfig has a few changes for colors, as well as aliases for more ease of use.

## Git Hooks
* A folder for common git-hooks that I use on more than a single project

## ZSH

Uses [oh-my-zsh](https://github.com/ohmyzsh/ohmyzsh) (my fork is included as a submodule) with the custom `ray` theme (`ray.zsh-theme`).

#### oh-my-zsh settings
* Plugins: `pip`, `git-extras`, `gradle`, `zsh-syntax-highlighting`, `docker`, `docker-compose`, `python`, `tmux`
* Extra completions from [zsh-completions](https://github.com/zsh-users/zsh-completions) (installed as a custom plugin)
* Auto-updates oh-my-zsh (`zstyle ':omz:update' mode auto`)
* Shows red dots while waiting for completion
* Auto-activates Python virtualenvs named `.venv` or `venv` when entering a directory (`PYTHON_AUTO_VRUN`)

#### Shell options
* `no_share_history`: each session keeps its own history
* Autocorrect (`correct`, `correct_all`) is turned off

#### cd -> cdls()
* Credit to [BinRoot](https://github.com/binroot)
* Immediately lists contents of the directory after changing into it. `cd` with no argument goes home and lists it.

#### Aliases for Default Flags
* `ls --color=auto -CF`
    * Use colors, columns, and display indicators to filetype (Folder, executable, symlink, etc)
* `emacs -nw`
    * Call emacs in no window mode. Also set as `$EDITOR`.
* `cp -v`, `rm -v`, `mv -v`, `ln -v`
    * Verbose output for file operations.
* `python` -> `python3`

#### History and Process search
* `psg` -> `ps -ef | grep`
* `zhg` -> `history | cut -c 8- | grep`

#### Language tooling
* [nvm](https://github.com/nvm-sh/nvm) for Node.js (loaded from `~/.nvm`, with bash completion)
* [rbenv](https://github.com/rbenv/rbenv) and ruby-build for Ruby
* Maven from `/opt/maven` (`M2_HOME`, `MAVEN_HOME`)
* [opencode](https://opencode.ai) on `PATH` from `~/.opencode/bin`
* Sources `~/.local/bin/env` (added by the [uv](https://docs.astral.sh/uv/) installer to put `~/.local/bin` on `PATH`)
* `PROJECT_HOME` set to `~/repositories`
