# Environment configs from original .zshrc on devcontainer
# see https://github.com/microsoft/vscode-dev-containers/blob/v0.238.0/containers/javascript-node/.devcontainer/base.Dockerfile
export ZSH=$HOME/.oh-my-zsh
ZSH_THEME="codespaces"
plugins=(git)
source $ZSH/oh-my-zsh.sh
DISABLE_AUTO_UPDATE=true
DISABLE_UPDATE_PROMPT=true

## Environment variable configuration
#
# LANG
#
export LANG=ja_JP.UTF-8
case ${UID} in
0)
    LANG=C
    ;;
esac

# 'cd'を打たなくてもディレクトリ名だけで移動できるようにする
#
setopt auto_cd

# ディレクトリ移動時に自動でpushdされる 'cd -<TAB>' で履歴が表示される
# 'cd -3'とかするとその番号のディレクトリに移動する
#
setopt auto_pushd

# コマンドの打ち間違い(typo)を訂正してくれるようにする
#
setopt correct

# TAB補完時の候補を詰めて表示(一度にたくさん表示)
#
setopt list_packed

# パス名の最後につく'/'を自動的に削除しない
#
setopt noautoremoveslash

# 補完機能実行時にビープ音を鳴らさない
#
setopt nolistbeep

## キーバインドの設定
#
# emacs風の操作が出来るように
#
bindkey -e

# コマンド履歴の検索時に <Ctrl-p>で履歴をさかのぼり、<Ctrl-n>で履歴を下る
#
autoload history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey "^p" history-beginning-search-backward-end
bindkey "^n" history-beginning-search-forward-end
bindkey "\\ep" history-beginning-search-backward-end
bindkey "\\en" history-beginning-search-forward-end

# <TAB>での補完候補の変更時に、<Shift-TAB>で逆順に変更する
#
bindkey "\e[Z" reverse-menu-complete

## コマンド履歴の設定
#
HISTFILE=${HOME}/.zsh_history
HISTSIZE=50000
SAVEHIST=50000
setopt hist_ignore_dups     # 重複したコマンドは履歴保存しない
setopt share_history        # コマンド履歴ファイルを複数のzshプロセス間で共有


## 補完機能の設定
#
fpath=(${HOME}/.zsh/functions/Completion ${fpath})
autoload -U compinit        # 補完機能を有効にする
compinit


## zsh editorを有効にする
#
autoload zed

## 先方予測によるコマンド補完機能の設定
#  (使いこなせないので無効しとく)
#autoload predict-on
#predict-off


## コマンドエイリアスの設定
#
setopt complete_aliases     # エイリアスを展開してもとのコマンドをみつけて, そのコマンドに応じた補完

alias where="command -v"

alias la="ls -a"
alias lf="ls -F"
alias ll="ls -l"
alias lla="ls -la"

alias du="du -h"
alias df="df -h"

alias su="su -l"

alias s="git status"
alias d="git diff"
alias b="git branch"
alias co="git checkout"
alias logoneline="git log --oneline"
alias loghead="logoneline | head"
alias logpretty="git log --pretty=format:\"%h %an : %s\""