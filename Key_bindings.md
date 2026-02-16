# Key Bindings Reference

This document outlines key bindings for TMUX, Vim, and LazyVim, organized for clarity and consistency. Key bindings use the `<C-...>` syntax (e.g., `<C-r>` for Ctrl+r) throughout for uniformity. 
   
### Table of Contents
- [SHELL](#shell)
  - [Apache](#apache)
  - [Dir Navigation](#dir-navigation)
  - [Docker](#docker)
  - [Git](#git)
- [TMUX](#tmux)
  - [Configuration and Plugins](#tmux-configuration-and-plugins)
  - [Copy and Paste](#tmux-copy-and-paste)
  - [Sessions](#tmux-sessions)
  - [Windows](#tmux-windows)
  - [Panes](#tmux-panes)
- [Oh-my-ZSH Plugins](#oh-my-zsh-plugins)
- [Vim](#vim)
  - [General Commands](#vim-general-commands)
  - [File Explorer (netrw)](#vim-file-explorer-netrw)
  - [File and Buffer Management](#vim-file-and-buffer-management)
  - [Navigation](#vim-navigation)
  - [Searching and Replacing](#vim-searching-and-replacing)
  - [Editing and Text Manipulation](#vim-editing-and-text-manipulation)
  - [Macros and Automation](#vim-macros-and-automation)
  - [Custom Key Bindings](#vim-custom-key-bindings)
  - [Troubleshooting](#vim-troubleshooting)
- [LazyVim](#lazyvim)
  - [General Commands](#lazyvim-general-commands)
  - [Commenting](#lazyvim-commenting)
  - [Surrounding](#lazyvim-surrounding)
  - [LSP-Related Commands](#lazyvim-lsp-related-commands)
  - [Searching](#lazyvim-searching)
  - [Harpoon](#lazyvim-harpoon)
  - [Windows](#lazyvim-windows)

---

### SHELL

`_` - sudo  
`ccat` - colorize_cat  
`ch` - /home/bobby/bin/cht.sh (command-line client for cheat.sh cheat sheets). Example `ch perl/array`  
`chatgpt` - [custom script] - CLI interface to ChatGPT/OpenAI  
`cless` - colorize_less  
`csvlens` - Interactive CSV file viewer (like lens for tabular data)  
`dirsync` - [custom script] Directory synchronizer (sync files between directories)  
`egrep` - egrep --color=auto (grep -E)  
`eget` - Easy binary downloader from GitHub releases  
`ff` - (fuuzzy finder) fzf --height 40% --layout reverse --border  
`fgrep` - fgrep --color=auto  
`fv` - nvim $(fzf --height 40% --layout reverse --border)  
`fzf` - General-purpose command-line fuzzy finder  
`ggh` - SSH connection manager  
`grok` - [custom script] - xAI Grok CLI  
`json_xs` - JSON command-line processor (Perl-based JSON tool)  
`kubectl` - Kubernetes command-line tool (interact with K8s clusters)  
`l` - ls -lah  
`la` - ls -lAh  
`lazydocker` - Simple terminal UI for managing Docker  
`lazygit` - Simple terminal UI for git commands  
`lazysql` - (likely lazy-based SQL viewer or editor tool)  
`lg` - lazygit  
`moose-outdated` - Check for outdated Moose modules (Perl tool)  
`nv` - NVIM_APPNAME=nvim-lazy nvim  
`nvim` - Neovim text editor  
`nvim-custom` - NVIM_APPNAME="nvim-custom" nvim  
`ollama` - Run and manage large language models locally (CLI for Ollama)  
`package-stash-conflicts` - Check for Package::Stash conflicts (Perl tool)  
`pandoc` - Universal document converter (markup to markup/PDF/etc.)  
`perlcritic` - Critique Perl source code for best practices  
`perltidy` - Indent and reformat Perl scripts  
`perly` - [custom script] /usr/bin/perl /home/control-io/www/DevSandbox/Sandbox/_templates/perly.pl  
`perlyprod` - [custom script] /usr/bin/perl /home/control-io/www/DevSandbox/Sandbox/_templates/perlyprod.pl  
`pls` - (custom or alternative ls with pretty output)  
`postboy` - [custom script] (custom script - possibly HTTP/posting tool)  
`posty` - (custom script - likely API/posting helper)  
`prod_scratch` - /usr/bin/perl /home/control-io/www/DevSandbox/Sandbox/_templates/prod_scratch.pl  
`pscpu` - ps auxf | sort -nr -k 3  
`pscpu10` - ps auxf | sort -nr -k 3 | head -10  
`psmem` - ps auxf | sort -nr -k 4  
`psmem10` - ps auxf | sort -nr -k 4 | head -10  
`qc` - quickconnect  
`quickconnect` - (custom script - likely SSH/quick connect helper)  
`re` - rr && ee  
`reposync` - (custom script - likely repo synchronization tool)  
`reposync_thisdir_to_alpha` - reposync . alpha ongoing  
`restarthive.sh` - (custom script - likely restarts a Hive service)  
`rl` - tail -f /home/control-io/www/log/templog  
`rl2` - tail -f /home/control-io/www/log/templog2  
`scpdownloads` - cd /mnt/c/Users/BobbyValenzuela/OneDrive\ -\ Probax/Documents/SCP-Downloads  
`showmerges` - git log --oneline --merges -E --grep 'DEV-[0-9]+' -n 15  
`spf` - (custom script - possibly SPF checker or sender policy framework tool)  
`sqlcmd` - Microsoft SQL Server command-line query tool  
`ssh_keyupdate` - (complex ssh-agent + ssh-add command)  
`starship` - Cross-shell prompt (customizable prompt engine)  
`tere` - (likely a fuzzy cd or directory jumper tool)  
`timed-process` - (custom script - likely times or profiles processes)  
`tmux` - tmux -2  
`upandup` - sudo apt update && sudo apt upgrade  
`update_aws_creds.sh` - (custom script - updates AWS credentials)  
`vscode-cleanup` - (custom script - cleans VS Code cache/data)  
`vscode-cleanup-all` - (custom script - thorough VS Code cleanup)  
`vscode-cleanup-pbx` - (custom script - VS Code cleanup variant)  
`which-command` - whence  
`yt-dlp` - Feature-rich command-line audio/video downloader  
`zig` - Zig programming language compiler/toolchain  

## Apache
`apachelogacc` - tail -n15 -f /var/log/apache2/access.log  
`apachelogerr` - tail -n15 -f /var/log/apache2/error.log  
`apacherestart` - sudo service apache2 restart  
`e0` - tail -f -n 0 /var/log/apache2/error.log  
`ee` - tail -f /var/log/apache2/error.log  
`er` - watch egrep -i 'DBD::' /var/log/apache2/error.log  
`rr` - sudo service apache2 restart && echo 'Apache Restarted!'  
`tomahawk` - (custom script - possibly a music player or search tool)  


## Dir navigation
`...` - cd ../../../  
`....` - cd ../../../../  
`.....` - cd ../../../../  
`......` - ../../../../..  
`.4` - cd ../../../../  
`.5` - cd ../../../../..  
`..` - cd ..  
`-` - cd -  
`1` - cd -1  
`2` - cd -2  
`3` - cd -3  
`4` - cd -4  
`5` - cd -5  
`6` - cd -6  
`7` - cd -7  
`8` - cd -8  
`9` - cd -9  
`callouts_to_list` - (custom script - converts callouts/markdown to list format)  
`cb` - clipboard manager. See `cb -h`  
`ll` - ls -lh  
`ls` - ls --color=tty  
`lsa` - ls -lah  
`md` - mkdir -p  
`mkdir` - mkdir -pv  
`rd` - rmdir  
`ya` - (alias for yazi)  
`yazi` - Blazing fast terminal file manager (Rust-based)  
`yz` - (alias/variant for yazi)  

## Docker

Here is the alphabetized list in the requested format:

`dbl` - docker build  
`dcb` - docker compose build  
`dcdn` - docker compose down  
`dce` - docker compose exec  
`dcin` - docker container inspect  
`dck` - docker compose kill  
`dcl` - docker compose logs  
`dclF` - docker compose logs -f --tail 0  
`dclf` - docker compose logs -f  
`dcls` - docker container ls  
`dclsa` - docker container ls -a  
`dco` - docker compose  
`dcps` - docker compose ps  
`dcpull` - docker compose pull  
`dcr` - docker compose run  
`dcrestart` - docker compose restart  
`dcrm` - docker compose rm  
`dcstart` - docker compose start  
`dcstop` - docker compose stop  
`dcup` - docker compose up  
`dcupb` - docker compose up --build  
`dcupd` - docker compose up -d  
`dcupdb` - docker compose up -d --build  
`dib` - docker image build  
`dii` - docker image inspect  
`dils` - docker image ls  
`dipru` - docker image prune -a  
`dipu` - docker image push  
`dirm` - docker image rm  
`dit` - docker image tag  
`dlo` - docker container logs  
`dnc` - docker network create  
`dncn` - docker network connect  
`dndcn` - docker network disconnect  
`dni` - docker network inspect  
`dnls` - docker network ls  
`dnrm` - docker network rm  
`dpo` - docker container port  
`dps` - docker ps  
`dpsa` - docker ps -a  
`dpu` - docker pull  
`dr` - docker container run  
`drit` - docker container run -it  
`drm` - docker container rm  
`drm!` - docker container rm -f  
`drs` - docker container restart  
`ds` - ollama run deepseek-r1:14b  
`dst` - docker container start  
`dsta` - docker stop $(docker ps -q)  
`dstp` - docker container stop  
`dsts` - docker stats  
`dtop` - docker top  
`dvi` - docker volume inspect  
`dvls` - docker volume ls  
`dvprune` - docker volume prune  
`dxc` - docker container exec  
`dxcit` - docker container exec -it

<br />

## Git

Here is the alphabetized list in the requested format:

`g` - git  
`ga` - git add  
`gaa` - git add --all  
`gam` - git am  
`gama` - git am --abort  
`gamc` - git am --continue  
`gams` - git am --skip  
`gamscp` - git am --show-current-patch  
`gap` - git apply  
`gapa` - git add --patch  
`gapt` - git apply --3way  
`gau` - git add --update  
`gav` - git add --verbose  
`gb` - git branch  
`gbD` - git branch --delete --force  
`gba` - git branch --all  
`gbd` - git branch --delete  
`gbg` - LANG=C git branch -vv | grep ": gone\]"  
`gbgD` - LANG=C git branch --no-color -vv | grep ": gone\]" | cut -c 3- | awk '{print $1}' | xargs git branch -D  
`gbgd` - LANG=C git branch --no-color -vv | grep ": gone\]" | cut -c 3- | awk '{print $1}' | xargs git branch -d  
`gbl` - git blame -w  
`gbm` - git branch --move  
`gbnm` - git branch --no-merged  
`gbr` - git branch --remote  
`gbs` - git bisect  
`gbsb` - git bisect bad  
`gbsg` - git bisect good  
`gbsn` - git bisect new  
`gbso` - git bisect old  
`gbsr` - git bisect reset  
`gbss` - git bisect start  
`gc` - git stash save && git stash drop && git checkout master && git pull && rr && echo 'Cleaned Up!'  
`gc!` - git commit --verbose --amend  
`gcB` - git checkout -B  
`gca` - git commit --verbose --all  
`gca!` - git commit --verbose --all --amend  
`gcam` - git commit --all --message  
`gcan!` - git commit --verbose --all --no-edit --amend  
`gcann!` - git commit --verbose --all --date=now --no-edit --amend  
`gcans!` - git commit --verbose --all --signoff --no-edit --amend  
`gcas` - git commit --all --signoff  
`gcasm` - git commit --all --signoff --message  
`gcb` - git checkout -b  
`gcd` - git checkout $(git_develop_branch)  
`gcf` - git config --list  
`gcfu` - git commit --fixup  
`gcl` - git clone --recurse-submodules  
`gclean` - git clean --interactive -d  
`gclf` - git clone --recursive --shallow-submodules --filter=blob:none --also-filter-submodules  
`gcm` - git checkout $(git_main_branch)  
`gcmsg` - git commit --message  
`gcn` - git commit --verbose --no-edit  
`gcn!` - git commit --verbose --no-edit --amend  
`gco` - git checkout  
`gcor` - git checkout --recurse-submodules  
`gcount` - git shortlog --summary --numbered  
`gcp` - git cherry-pick  
`gcpa` - git cherry-pick --abort  
`gcpc` - git cherry-pick --continue  
`gcs` - git commit --gpg-sign  
`gcsm` - git commit --signoff --message  
`gcss` - git commit --gpg-sign --signoff  
`gcssm` - git commit --gpg-sign --signoff --message  
`gd` - git diff  
`gdca` - git diff --cached  
`gdct` - git describe --tags $(git rev-list --tags --max-count=1)  
`gdcw` - git diff --cached --word-diff  
`gds` - git diff --staged  
`gdt` - git diff-tree --no-commit-id --name-only -r  
`gdup` - git diff @{upstream}  
`gdw` - git diff --word-diff  
`gf` - git fetch  
`gfa` - git fetch --all --tags --prune --jobs=10  
`gfg` - git ls-files | grep  
`gfo` - git fetch origin  
`gg` - git gui citool  
`gga` - git gui citool --amend  
`ggpull` - git pull origin "$(git_current_branch)"  
`ggpur` - ggu  
`ggpush` - git push origin "$(git_current_branch)"  
`ggsup` - git branch --set-upstream-to=origin/$(git_current_branch)  
`ghh` - git help  
`gignore` - git update-index --assume-unchanged  
`gignored` - git ls-files -v | grep "^[[:lower:]]"  
`git-svn-dcommit-push` - git svn dcommit && git push github $(git_main_branch):svntrunk  
`git_add` - git add -A && git reset Estimator  
`git_force_push` - `eval $(ssh-agent -s) && ssh-add ~/.ssh/id_rsa && git push && echo 'Pushed to GitHub!' ` 
`git_current_branch` - (oh-my-zsh deprecated function wrapper)  
`gk` - gitk --all --branches &!  
`gke` - gitk --all $(git log --walk-reflogs --pretty=%h) &!  
`gl` - git pull  
`glg` - git log --stat  
`glgg` - git log --graph  
`glgga` - git log --graph --decorate --all  
`glgm` - git log --graph --max-count=10  
`glgp` - git log --stat --patch  
`glo` - git log --oneline --decorate  
`globurl` - noglob urlglobber  
`glod` - git log --graph --pretty="%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%ad) %C(bold blue)<%an>%Creset"  
`glods` - git log --graph --pretty="%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%ad) %C(bold blue)<%an>%Creset" --date=short  
`glog` - git log --oneline --decorate --graph  
`gloga` - git log --oneline --decorate --graph --all  
`glol` - git log --graph --pretty="%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%ar) %C(bold blue)<%an>%Creset"  
`glola` - git log --graph --pretty="%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%ar) %C(bold blue)<%an>%Creset" --all  
`glols` - git log --graph --pretty="%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%ar) %C(bold blue)<%an>%Creset" --stat  
`glp` - git_log_prettily  
`gluc` - git pull upstream $(git_current_branch)  
`glum` - git pull upstream $(git_main_branch)  
`gm` - git merge  
`gma` - git merge --abort  
`gmc` - git merge --continue  
`gmff` - git merge --ff-only  
`gmom` - git merge origin/$(git_main_branch)  
`gms` - git merge --squash  
`gmtl` - git mergetool --no-prompt  
`gmtlvim` - git mergetool --no-prompt --tool=vimdiff  
`gmum` - git merge upstream/$(git_main_branch)  
`gp` - git push  
`gpd` - git push --dry-run  
`gpf` - git push --force-with-lease --force-if-includes  
`gpf!` - git push --force  
`gpoat` - git push origin --all && git push origin --tags  
`gpod` - git push origin --delete  
`gpr` - git pull --rebase  
`gpra` - git pull --rebase --autostash  
`gprav` - git pull --rebase --autostash -v  
`gpristine` - git reset --hard && git clean --force -dfx  
`gprom` - git pull --rebase origin $(git_main_branch)  
`gpromi` - git pull --rebase=interactive origin $(git_main_branch)  
`gprum` - git pull --rebase upstream $(git_main_branch)  
`gprumi` - git pull --rebase=interactive upstream $(git_main_branch)  
`gprv` - git pull --rebase -v  
`gpsup` - git push --set-upstream origin $(git_current_branch)  
`gpsupf` - git push --set-upstream origin $(git_current_branch) --force-with-lease --force-if-includes  
`gpu` - git push upstream  
`gpv` - git push --verbose  
`gr` - git remote  
`gra` - git remote add  
`grb` - git rebase  
`grba` - git rebase --abort  
`grbc` - git rebase --continue  
`grbd` - git rebase $(git_develop_branch)  
`grbi` - git rebase --interactive  
`grbm` - git rebase $(git_main_branch)  
`grbo` - git rebase --onto  
`grbom` - git rebase origin/$(git_main_branch)  
`grbs` - git rebase --skip  
`grbum` - git rebase upstream/$(git_main_branch)  
`grep` - grep --color=auto  
`grev` - git revert  
`greva` - git revert --abort  
`grevc` - git revert --continue  
`grf` - git reflog  
`grh` - git reset  
`grhh` - git reset --hard  
`grhk` - git reset --keep  
`grhs` - git reset --soft  
`grm` - git rm  
`grmc` - git rm --cached  
`grmv` - git remote rename  
`groh` - git reset origin/$(git_current_branch) --hard  
`grrm` - git remote remove  
`grs` - git restore  
`grset` - git remote set-url  
`grss` - git restore --source  
`grst` - git restore --staged  
`grt` - cd "$(git rev-parse --show-toplevel || echo .)"  
`gru` - git reset --  
`grup` - git remote update  
`grv` - git remote --verbose  
`gsb` - git status --short --branch  
`gsd` - git svn dcommit  
`gsh` - git show  
`gsi` - git submodule init  
`gsps` - git show --pretty=short --show-signature  
`gsr` - git svn rebase  
`gss` - git status --short  
`gst` - git status  
`gsta` - git stash push  
`gstaa` - git stash apply  
`gstall` - git stash --all  
`gstc` - git stash clear  
`gstd` - git stash drop  
`gstl` - git stash list  
`gstp` - git stash pop  
`gsts` - git stash show --patch  
`gstu` - gsta --include-untracked  
`gsu` - git submodule update  
`gsw` - git switch  
`gswc` - git switch --create  
`gswd` - git switch $(git_develop_branch)  
`gswm` - git switch $(git_main_branch)  
`gta` - git tag --annotate  
`gtl` - gtl(){ git tag --sort=-v:refname -n --list "${1}*" }; noglob gtl  
`gts` - git tag --sign  
`gtv` - git tag | sort -V  
`gunignore` - git update-index --no-assume-unchanged  
`gunwip` - git rev-list --max-count=1 --format="%s" HEAD | grep -q "\--wip--" && git reset HEAD~1  
`gwch` - git log --patch --abbrev-commit --pretty=medium --raw  
`gwip` - git add -A; git rm $(git ls-files --deleted) 2> /dev/null; git commit --no-verify --no-gpg-sign --message "--wip-- [skip ci]"  
`gwipe` - git reset --hard && git clean --force -df  
`gwt` - git worktree  
`gwta` - git worktree add  
`gwtls` - git worktree list  
`gwtmv` - git worktree move  
`gwtrm` - git worktree remove  

---

## TMUX

### TMUX Configuration and Plugins
- Enable TMUX plugins by install TPM: `https://github.com/tmux-plugins/tpm`
- Reload config file: `tmux source ~/.tmux.conf`
- Reload TMUX environment: `<C-i>`  _For re-loading Theme for example_
- Custom Bind key I've set: `<C-t> R`  
- Open cheat.sh: `<bind-key> S`  

### TMUX Copy and Paste
__Tmux search__
- `<bind-key> [` - Enter copy mode 
  - `/` - Start search
  - Enter search term and then `<Enter>` (then use `n`/`N` to search throughout matches - search starts at top of page, use `N` to search backwards)
  - End search: `q`

__tmux copy/paste [MAIN]__  _(copy to tmux buffer and clipboard)_
- Enter copy mode: `<bind-key> [`
- Use arrows to find text to start to copy from 
- Start Selection: `v`
- Copy: `y`
- Paste (from tmux buffer): `<bind-key> ]`
- Paste (from system clipboard): `<C-S-v>`

__Neovim and Cli quick copy commands__
- Tmux quick copy (from cli to system clipboard): `Mouse select + y (while selecting)`
- Neovim copy (clipboard) => `Select (mouse/v) + y`

### TMUX Sessions
- Open tmux as a named session: `tmux new -s <name>`  
- To detach a tmux session: `<bind_key> D`  
- View tmux sessions (from cli): `tmux ls`  
- Re-attach to session (from cli): `tmux attach -t 0`  
- Rename tmux sessions (from cli): `tmux rename-session -t 0 <name>`  
- Killing tmux sessions (from cli): `tmux kill-session -t 0 <name>` 
__Where ‘0’ is your session id/name__

### TMUX Windows  
- Rename Window: `<bind_key> ,`  
- Create new Window: `<bind_key> c`  
- Show all Windows: `<bind_key> S`  
- Show all Windows (with preview): `<bind_key> w` _Enter to select_  
- Switch between windows: `<bind_key> <number>`  
- Close Window: `<bind_key> &` (or `exit` if all panes are closed)  

### TMUX Panes
- Split Windows Vertically: `<bind_key> |`  (with my conf I use `|` instead of `%`)  
- Split Windows Horizontally: `<bind_key> _`  (with my conf I use `_` instead of `"`)  
- Navigate subwindows (panes): `<bind_key> <arrow-key>`  
- Show pane numbers: `<bind_key> Q`  
- Move current pane left: `<bind_key> {`  
- Move current pane right: `<bind_key> }`  
- Zoom in/out to make pane full screen: `<bind_key> z`
- Close pane: `exit` or `<C-b> z`

---

## Oh-my-ZSH Plugins  
- `ccat/cless` - colorized cat+less  
- `copyfile` - copy file contents to system clipboard  
- `<C-o>` - copy cmdline contents to system clipboard  
- Allows pressing `<C-z>` again to switch back to a background job.  

---

## Vim
There are loads of good vim cheat sheets out there and this isn't a substitution, but rather a list of common/handy ones I've found to be efficient on my workflow.  
[Ultimate Cheat Sheet](https://catswhocode.com/vim-cheat-sheet)  
[LeanXinY](https://learnxinyminutes.com/docs/vim/)  
[vim.rtott](https://vim.rtorr.com/)  
[DevHints-vim](https://devhints.io/vim)  

### Vim General Commands
- `ter[minal]` - Open terminal (may need to hit `i` to beging typing)  
- `exit` / `<C-d>` then `<C-w> q` - to close terminal window  
- `:verbose map Q` - see what is mapped to the `Q` key  
- `<C-\> <C-n>` - Exit "terminal mode".  

_On "Ctrl-\ Ctrl-n"_  
This key combination switches the terminal buffer from terminal-insert mode (where you interact with the shell) to Vim’s normal mode. In normal mode, you can use Vim commands like :hide, navigate windows, or edit other buffers. In terminal-insert mode, Vim passes most keystrokes directly to the shell, so you can’t use Vim commands like :hide until you enter normal mode.  
`<C-\>` is a special prefix in Vim’s terminal mode to signal a command to Vim itself rather than the shell.  
`<C-n>` (or Ctrl-N) tells Vim to switch to normal mode.  
You’ll notice the cursor behavior changes, and Vim’s command line becomes available (e.g., you can type : to enter commands).  
Visual cue: In normal mode, the terminal buffer becomes “read-only” from Vim’s perspective, and you can’t type into the shell until you return to insert mode (e.g., by pressing i).  

### Vim File Explorer (netrw)  
- `:Explore` - Explorer (opens file tree)  
- `:Vex` - Vertical Explorer (opens file tree)  
- `i` - Rotate betweeb views (3rd is tree mode)  
- `v` - Open file in vertical split (opens to left by default unless `set splitright` is set  
- `u` - Go up one level  

### Vim File and Buffer Management
_Finding Files_  
- `:args **/*filename*.pl` - Search for file by partial name and file type recursively  
- `<C-q>` - Adds :args results to Quickfix list (keybinding)  

_Working with vim cmd/shell_  
- `<C-r>3` - Paste from 3 register (in insert mode or into vim command line). Useful for pasting into a search regex  
- `:read !<shell_command>` - Paste shell output into buffer.  
- `:g/function/d` - Delete all lines matching the pattern 'function'  
- `q:` - Opens a buffer of previous commands to execute (with enter key)  
- `q/` - Opens a buffer of previous searches to execute (with enter key)  
- `<C-l>` - Move window to far left  
- `<C-w>` - delete previous word  

_Managing Changes_  
- `:wa` - ("write all") save all open buffers    
- `:e!` - erase all unsaved changes  
- `:bufdo e!` - erase all unsaved changes (in all open buffers)  
- `u` - undo last change (normal mode)  
- `<C-u>` - undo last change (insert mode)  
- `<C-r>` - Redo  
- `:w !diff %` or `:w !git diff --no-index % -` - view changes in vim before saving (or add this in .vimrc `command Diff execute 'w !,且git diff --no-index % -'`)  
- `:earlier 2h` - [Time-based undo] Reverts file to state 2hours ago (can use `m` or `s` for minutes/seconds)  
- `:later 2h` - [Time-based redo] Reverts file to state 2hours ago (can use `m` or `s` for minutes/seconds)  

_Buffers_  
- `:E` - Open file nav (short for `explore`)  
- `:e ~/.vimrc` - edit a file by name (short for `:edit`).  
- `:e` - reload current buffer from disk  
- `:e!` - Remove all unsaved changes  
- `:vert ba` - edit all buffers as vertical windows  
- `:tab ba` - edit all buffers as tabs  
- `gf` - Find and open the file by filename under cursor  
- `<C-^>` (which is Ctrl+6) - swap back and forth between current (#) and alternate (a%) buffers.  
- `:b6` - Go to buffer 6  

_Viewing Buffers_  
- `:b` then `<C-d>` - show all open buffers to cycle though.  
- `:ls` - view buffers or (`buffers` with plugin)  

_Switching Buffers_  
- `:b file1.txt` - Select by filename (tab shows open buffers, but can open new files as well)
- `:bn` - rotate to next buffer.  
- `:bp` - rotate back to previous buffer.  
- `:b3` - Select buffer #3 (may need to force with `b!3`).   
- `:bf` or `:bl` - go to first/last buffer (f/l)  
- `:badd myfile.txt` - add a new buffer by filename  

_Deleting Buffers_  
- `:bd myfile.txt` - delete a buffer by buffer number or filename  
- `:%bd` - Delete all open buffers  

_Tabs_
- `:tabnew` or `:tabnew {file}` - open a file in a new tab  
- `<C-w> T` - move the current split window into its own tab  
- `gt` - move to the next tab  
- `gT` - move to the previous tab  
- `2gt` - switch to tab #2  
- `:tabc` - close the current tab and all its windows  
- `:tabo` - Tabonly - close all tabs except for the current one  
- `:tabdo {cmd}` - run the command on all tabs (e.g. :tabdo q - closes all opened tabs)  

_Windows_
- `<C-w> s` - Split open buffer horizontally  
- `<C-w> v` - Split open buffer vertically    
- `:vert sb {filename}` - Split buffer with another open buffer (you can enter file name or use tab to cycle through open buffers)  
- `:e {filename}` - Edit filename in current window  
- `:sp {filename}` - Split the window and open filename (if empty just splits the same buffer)    
- `:vs file` - Vertically split window  (enter open/unopened file)  

_Managing Windows_  
- `<C-w> q` or `:clo` - Close current window  
- `<C-w> <up>` - Put cursor in top window (works for any direction)  
- `<C-w> w` - Switch to next window    
- `<C-w> H` - Make Leftmost full  vertical window  
- `<C-w> L` - Make Rightmost full  vertical window  
- `<C-w>=` - Gives the same size to all windows  
- `<C-w>|` - Current window width = 100%  
- `50<C-w>|` - Current window width = 50% of initial window width    
- `<C-w>_` - Maximize current window vertically  
- `:only` - Close all windows, except current  
- `hide`/`unhide` - Hide/Unhide a window (only 1)  
- `:qa` - Quit All open windows (exits vim if on last tab)  

### Vim Navigation
_Moving along line_ 
- `t{` - Move to next `{` and use `;` to see sebsequent match (and `,` for previous match)  
- `e` - end of word  
- `E` - end of word (punctuation included)  
- `{` / `}` - Move up/down in paragraphs  

_Moving along file_  
- `gg` - Go to top of file  
- `G` - go to bottom of file  
- `: {num}` - Go to line  
- `zz` - Center screen with cursor position (don't confuse with ZZ - save)  
- `I`/`A` - Go to begin/end of line  
- `{`/`}` - move up/down along chunks of text (paragraphs)  
- `gd` - go to definition (where func/sub is defined)  
- `<C-o>` / `<C-i>` - Jump forward/backward in jump list (`:jumps`)  

_Markers_  
- `:marks` - View all markers  
- `:cc 22` - View the 22nd quickfix item    
- `'` - View all markers w/explanations [🔌]    
- `m {a-z}` - Setting markers/waypoints as {a-z}  
- `'{a-z}` - Move to marker/position {a-z}  
- `:delm!` - vim clear all marks (or specific ranges like `:delm a-zA-Z0-9`)  
- `''` - Move to previous marker position  (thats two single quotes in succession, not a single double quote)  
Note: Lowercase markers are local to a file and uppercase markers are global across all files. Meaning you can re-use `a` for different places in different files but `A` only refers to one place in a single file.  

### Vim Searching and Replacing
_Searching_  
- `/` - Search (grep): type text and enter then `n`/`N` to iterate through matches  
- `<C-q>` - Save search results in a quickfix list (we can even grep the quick fix list with `/`)   
- `cn`/`cp` - Next/Previous item in quickfix list. Mapped to `F11`/`F12`.  
- `<C-r> "` - Yanks the unamed register into the search box. This will paste in anything yanked.  

_Searching, replacing, and RegEx_  
- `\r` - This represents newline  
- `:%s/(foo)/\1\r` - Replaces matches with itself followed by a newline ('%' represents every occurence in the buffer)   
- `:s/old/new/g` - When text is selected you can use a replace (without the %) to replace text within the selected range (use `gc` to replace with confirmation first)    
- `:s/\VTEXTOMATCH/REPLACEWITHTHIS/` - The `\V` (very no magic mode treats all characters literaly except the `\`  
- `:s/\v\w+/` - The `\v` (very magic mode treats most special cahrs as special - as in regular regex    
- `:s/old/new/g22` - Replace 'old' with 'new' every every occurence in a line (g) including the next 22 lines.     
- `:noh` - "No Highlighting" - remove highlited matches  
- `:vim /function/ **/*.pl` - Grep all matches of `function` in every '.pl. file in current dir (recursively). Then `:cope` to create a QuickFix list  
- `:vim /\Vfunction/ /home/ubuntu/**/*.pl` - Grep all matches of `function` in every '.pl. file in current dir (recursively). Then `:cope` to create a QuickFix list  
- `:g&` - Apply previous replace action to the entire file  
- `:grep '^sub run_powershell' -g \*.pl` - Regex search using grep on perl files  
- `:grep '^sub run_powershell' -g '{*.pl,*.pm}'` - Regex search using grep on perl files (ripgrep)  
- `:grep -E '^sub run_powershell' *.pl` - Regex search using grep on perl files  (posix grep) Use `:grep text %` to search current buffer  

Notes  
- `:s/foo/bar/` - replace 1st occurrence on current line  
- `:%s?foo/bar/` - replace 1st occurrence on every line  
- `:.,$s?foo/bar/` - replace 1st occurrence on every line until end of buffer    

_Quickfix list commands_  
- `:cope` - open quickfix list  
- `:cclose` - close quickfix list  
- `:cnext` / `:cn` - go to next quickfix list item  
- `:cprevious` / `:cp` - go to previous quickfix list item  
- `:s/foo/bar/g` - replace text on a highlighted quickfix line  
- `:cdo s/foo/bar/g` - replace text on all quickfix list items (globally - every occurence in each line)  
- `:cdo s/foo/bar/gc` - replace text on all quickfix list items (globally - every occurence in each line)  - with confirmation

__Finding Multiple Occurrences__  
1. Select text (in visual mode)
2. `#` to highlight all occurences (can use `*` but that begins at next occurence)
3. `n`/`N` to select next/previous occurences
4. `v` again to select the highlighted occurence

__Change multiple instances without multi-cursor__  
1. Select text to change  
2. `#` to highlight all matches (selects next match)
3. Make sure you're in normal mode    
4. `cgn` - change globally (when done changing, press `Esc` to exit insert mode)  
5. `.` to change every subsequent match.  

_(Can also use dgn to delete multiple references)_

### Vim Editing and Text Manipulation
_SYDC (Selecting/Yanking/Deleting/Changing)_  
- `gv` - Re-select last selected text  
- `viw` - selects just the word.  
- `vaw` - selects the word plus any surrounding whitespace.  
- `<C-r>w` - Copy whatever word is under cursor and paste into vim command line. (Useful for pasting into a search regex)  
- `o` - Reverse order while continuing to select (switches cursor between start/end of selected text)  
- `/<term>` - While in visual mode, select lines based on RegEx  
- `<C-v>` - enter visual block mode. Once text is selected enter insert mode (`a`/`A`,`i`/`I`,`c`/`C`,`p`/`P`,`o`/`O` etc) and make changes. They will appear on the first line, but once you hit Esc those changes will be made to all selected lines.  
- `gs{char}` - Global surround. Example: Select text then `gs"`  
- `d` or `dd` - Cuts (Deletes and yanks)  
- `D` / `d$` - Cut to end of line  
- `Y` / `y$` - Yank/Copy to end of line  
- `C` - Cut to end of line  
- `:m 5` - Move line under cursor (or selected lines) to line 5  
- `:2,7m 5` - Move lines 2-7 to line 5  
- `vib` - Select inside next `()` occurrence (works with `y`/`d`)  
- `viB` - Select inside current `{}` (works with `y`/`d`)  

_Multi-Line_
- `10y` - Yank 10 lines  
- `10d` - Delete 10 lines  
- `10V` - Select 10 lines  

_Mass Select_  
- `ggVG` - Select entire file  
- `:1,500y` - Copy everything from line 1 to 500 (use `d` for delete) (can start/end on any line - usefull for slicing bits)  

_Continguous Lines of text (paragraph)_  
- `yap` - Yank with newlines  
- `yip` - Yank without newlines  
- `cap` - Change with newlines  
- `cip` - Change without newlines  
- `dap` - Delete with newlines  
- `dip` - Delete without newlines  
- `vii` - Selects the "inner indent" block (lines with the same indentation level as the cursor, excluding surrounding blank lines)  
- `vai` - Selects "a indent" block (includes the inner block plus the lines immediately above/below with less indentation, like a function definition).

_Registers: Viewing/Yanking/Pasting_  
- `:reg` - View registers (vim)  
- `"0p` - Paste from 0 register (in normal mode)  
- `"2p` - Paste 2nd to last thing yanked (grabs from 2 register in normal mode)  
- `"_dd` - Delete line and yank to black hole register (keeps registers the same).  
- `"1yiw` - Yank word under cursor into register 1    
- `ayy` - Yank line to "a" register (overwriting register a).  
- `Ayy` - Yank line to "a" register (appending to register a)  
- `"+y` - Yank text into system clipboard  
- `<C-r> *` - put the clipboard contents (X11: primary selection)  
- `<C-r> +` - put the clipboard contents  
- `<C-r> /` - put the last search pattern  
- `<C-r> :` - put the last command-line  
- `<C-r> "` - Paste from unamed register (anything yanked). Works in insert mode and command mode  

_Note: '^J' in a register will be changed to a newline when pasting._

_Brackets && Braces_  
- `%` - Select top/bottom of current block  
- `v%` - Select Content within parens/brackets (inclusively) if you're right before a bracket.  
- `vi{` - Selects everything within the block... then Esc to leave you at ending "}"  
- `ci{` - Change text inside brackets (exclusively)  
- `ca{` - Change text inside brackets (inclusively)  
- `yi{` - Yank text inside brackets (inclusively)  
- `ya{` - Yank text inside brackets (exclusively)  
- `di{` - Delete text inside brackets (inclusively)  
- `da{` - Delete text inside brackets (exclusively)  
- `{action}ab` - (y)ank/ (d)elete, (v)isual select entire block of code including lines where curly braces are on. Or, `zcdd` (zc to fold the block and dd to cut).
- `[{` - Go to opening containing curly brace (can use repeatedly)
- `]}` - Go to closing containing curly brace (can use repeatedly)   

_Folding_  
- `zf` - Create a fold from selected lines  
- `zf10j` - Create fold from current line to 10 lines down  
- `zc` - fold a block of code (z = fold and c = close)  
- `zo` - unfold a block of code (z = fold and c = open)  
- `zM` - fold all blocks in buffer  
- `zR` - unfolds all in buffer  

_Editing_  
- `ciw` - Change inner word (replace)  
- `xp` - swap two adjacent letters (move letter cursor one place to the right)  
- `J` - Merge lines: Apend line below to the end of the current line.  
- `cc` - change entire line.  
- `dt/<searchterm>` - Delete text up until search term  
- `:sort` - Sort selected lines  
- `:norm I#` - Insert a '#' at the start of each selected line  
- `:norm A;` - Append a ';' to the end of each highlited line  
- `:norm I/* A */` - Insert '/*' at the start of each selected line and append '*/' at the end of each selected line  
- `:g/error/norm I#` - Insert a '#' at the start of each line that matches the pattern /error/  
- `ct{` - Change everything from cursor position to next `{` occurence  

_Casing/Capitilization_  
- `gu` / `gU` - Lowercase/Uppercase character under cursor  
- `guiw` / `gUiw` - Lowercase/Uppercase word under cursor  
- `guu` / `gUU` - Lowercase/Uppercase entire line  
- `u` - Selected text to lower case  
- `U` - Selected text to upper case  
- `~` - Inverse casing of selected text/character under cursor.  
- `g~w` - change case of word (until whitespace)  
- `g~~` - change case of entire line  

_Identing_  
- `<<`/`>>` - Indent code left/right  
- `==`/`=` - Auto indent code (`==` for one line and `=` for multiple lines)  

_Sorting_  
- `:sort` - Sort all lines  
- `:sort!` - Sort all lines in reverse  
- `:sort u` - Sort all lines and remove duplicates  
- `:sort`/`:sort!` - When lines are selected, this will sort in ASC/DESC order respectively.  

_Indenting_  
- `=` - Auto-Indenting (based on rules - works on selected text as well)  
- `=ap` - Auto-Indent Paragraph  
- `<` - Indent Left  
- `>` - Indent Right  

_Numbers_ 
- `<C-a>` - Increment Highlighted Numbers  
- `<C-x>` - Decrement Highlighted Numbers  
- `g<C-a>` - Increment Highlight Numbers in sequence (each matched item will increment one more than previous match).  
- `g<C-x>` - Decrement Highlight Numbers in sequence (each matched item will increment one more than previous match).

### Vim Macros and Automation
- `q<letter>` - start recording a macro  
- `q` - stop recording a macro  
- `@<letter>` - execute macro (once)  
- `@@` - Rerun the last ran macro  
- `<number>@<letter>` - To execute the macro <number> times  
- `:3,9 normal @b` - Run macro "b" on lines 3-9.  
- `:reg <macro_letter>` - View register (holds macros as well - note '[^' represents the Esc key)  
- `@:` - re-run last vim command  
- `.` - re-run last command in normal mode  

__Best Practices when recording macros__
- Once recording has started, type `0` to begin at the beginning of the line.
- Once done with commands, type 'j' before you finish recording to ensure ending on the next line (in case this macro runs multiple times).

__Uncommenting__
- Put your cursor on the first comment character (like #), and enter Visual-Block mode (`<C-b>` for me)
- Go down until the last commented line and press `x`  

__Commenting__

_Option 1_
- Enter Visual-Block mode (`<C-b>` for me) then enter `:s/^/#/`

_Option 2_
- Enter Visual-Block mode (`<C-b>` for me)
- Go down until last line and press `I`, then press `#` (or other comment character), then `Esc`.

### Vim Custom Key Bindings
_Bare Vim (common settings to apply on a ad-hoc plain vim editor)_
```vim
colo slate  
set number/relativenumber  
set mouse=a  
set ignorecase  
set hlsearch  
set incsearch  
set cursorline  

# Additional
syntax on
filetype on
set wrap! (toggle on of off)
```

_Custom_  
- `<C-t>` - Tmux bind key (Ctrl+t)   
- `<C-b>` - Visual-Block mode (Ctrl+B)  
- `<leader> gu` - Git undo last commit  
- `<leader> gS` - Git stash unsaved changes  
- `<leader> rm` - Remove markers  
- `<leader> tt` - Toggle Twlight  

_Modes_
- `<S-v>` - Visual Line Mode  
- `<S-b>` - (custom) Visual Block Mode  (default: `<C-S-v>` or `<C-q>`)  

### Custom Neovim Keybinds  
These are my current keybinds I'm using: [Keybinds](https://github.com/bobby-valenzuela/Dev-Environment/blob/main/config/.config/nvim/lua/config/keymaps.lua)  

<br />

### Vim Troubleshooting  
- `:highlight Delimiter` - See what styles apply to the "Delimiter" highlightgroup  
- `:highlight Delimiter` - See what styles apply to the "Delimiter" highlightgroup (verbose)  
- `:echo synIDattr(synID(line("."), col("."), 1), "name")` - See highlight group applying to item under cursor  
- `:echo map(synstack(line("."), col(".")), 'synIDattr(v:val, "name")')` - See all highlight groups that could apply to item under cursor  

_Note: `<C-...>` should be taken to mean `Ctrl+`. All other keys are to be entered in succession (not simultaneously)._

---

## LazyVim

https://www.lazyvim.org/keymaps

### LazyVim General Commands
- `<leader> /` - grep (from cwd) [🔌]  
- `<leader> <space>` - file search (from cwd)  [🔌telescope]  
- `<leader> f t` - Open terminal (root) [🔌]   
- `<C-/>` - Show/Hide terminal [🔌]    
- `<leader> e` - opens explorer in PWD  [🔌]  
- `:MasonInstall <language_server>` - Use mason to install a language server [🔌 Mason]   
- `:LazyExtras` - Manage LazyExtra plugins  [🔌]  
- `:LspInfo` - Get info on current LSP  [🔌]  
- `:source $MYVIMRC` - Reload config (and plugins) without restarting nvim  
- `:MarkdownPreview` - View MarkdownPreview in browser [🔌 Markdown-Preview]  
- `<leader> p` - View Yank history [🔌 Yanky]  
- `<leader> f b` - View open buffers [🔌]   
- `L` - Cycle through all open buffers [🔌]  
- `<leader> ` - switch last file (buffer)  
- `<leader> b e` - View buffer explorer  
- `<leader> ` or `<C-^>` (which is `Ctrl+6`) - swap back and forth between current (`#`) and alternate (`a%`) buffers. [🔌]  

_Commandline mode_  
- `<C-r>"` - Paste from unamed register (anything yanked). Also works in insert mode  
- `<C-f>` - View command history  

### LazyVim Commenting  
- `gcc` - comment out current line [🔌 vim-commentary]  
- `gc` - comment out a select range of lines [🔌 vim-commentary]  
- `gcgc` - uncomment adjacent lines [🔌 vim-commentary]  

### LazyVim Surrounding  
- `faiw"` - Surround inner word with " (press fa fast) [🔌 mini-surround]   
- `fd"` - Remove surrounding quotes (press fd fast) [🔌 mini-surround]  
- `fr"'` - replace surrounding double quotes with single-quotes (press fr fast) [🔌 mini-surround]  

### LazyVim LSP-Related Commands  
- `<C-Space>` - (in insert mode) see possible parameters.  
- `K` - get pop-up with code info [🔌]   
- `gd` - 'Go to Definition' -> Find where a function/sub is defined when highlighting one [🔌]   
- `gr` - 'Go to References' -> Find where a functions/sub is referenced when highlighting one [🔌]   

### LazyVim Searching  
- `s {first_char}{second_char}` - search forward to matches and show labels + enter the label of the match you want to go to [🔌leap]  
- `S {first_char}{second_char}` - search backward to matches and show labels + enter the label of the match you want to go to [🔌leap]  
- `gs {first_char}{second_char}` - search _forward_ to matches and show labels + enter the label of the match you want to go to [🔌leap]. _Global search (across windows splits)_  
- `gS {first_char}{second_char}` - search _backward_ to matches and show labels enter the label of the match you want to go to [🔌leap]. _Global search (across windows splits)_  

### LazyVim Harpoon  
- `:wall` - Write to all open buffers  
- `<leader> H` - Add file to harpoon list [🔌]   
- `<leader> h` - View harpoon quick menu [🔌]   
- `<leader> {1..5}` - Harpoon to (open) specific file [🔌]  
- `[[` - Go to top of file [🔌]  
- `]]` - Go to bottom of file  [🔌]  
- `[i` - Go to the top of code block (via mini-indentscope) [🔌 Identscope]  
- `]i` - Go to the bottom of code block (via mini-indentscope) [🔌 Identscope]  

### LazyVim Windows  
- `<leader> w w` - switch windows [Lazyvim]  
- `<leader> w q` - close window [Lazyvim]  
- `<leader> w v` - verical split window [Lazyvim]  
- `<leader> w o` - close all other windows [Lazyvim]  
- `<space> w |` - max width of current window [Lazyvim]  
- `<leader> w =` - equal width of current windows [Lazyvim]  
- (in NeoTree) `s` - to open in new window in vertical split [Lazyvim]







