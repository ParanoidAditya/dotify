# shellcheck disable=SC2034
DEFAULT_USER=adi

export ZSH="/Users/adi/.oh-my-zsh"

export GOPATH=$HOME
export GO111MODULE=on
export GOPRIVATE="github.com/Shopify/*"

export EDITOR=nano
export PATH=$HOME/.npm-global/bin:$GOPATH/bin:$HOME/.krew/bin:/usr/local/sbin:$PATH

export DOCKER_BUILDKIT=1

# shellcheck disable=SC2034
ZSH_THEME="agnoster"

export UPDATE_ZSH_DAYS=5

# shellcheck disable=SC2034
plugins=(
  autojump
  autoupdate
  colorize
  colored-man-pages
  docker
  fast-syntax-highlighting
  git
  history-substring-search
  vscode
  you-should-use
  zsh-autosuggestions
)

# shellcheck disable=SC1090
source $ZSH/oh-my-zsh.sh

# Python 3.9 incompat with gcloud
export CLOUDSDK_PYTHON="/usr/local/opt/python@3.8/libexec/bin/python"

# shellcheck disable=SC1091
if [ -f '/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.zsh.inc' ]; then
  source '/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.zsh.inc';
fi

# shellcheck disable=SC1091
if [ -f '/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.zsh.inc' ]; then
  source '/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.zsh.inc';
fi

# shellcheck disable=SC1090
for file in ~/.dotfiles/zsh_files/.{aliases,functions}; do
  [ -r "$file" ] && [ -f "$file" ] && source "$file";
done;

#hub => git
if [ -x "$(command -v hub)" ]; then
  eval "$(hub alias -s)"
fi

if [ -x "$(command -v rbenv)" ]; then
  eval "$(rbenv init -)"
fi

export KUBECONFIG=/Users/adi/.kube/config.shopify.cloudplatform:/Users/adi/.kube/config
