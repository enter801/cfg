# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="majgis"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

alias cdp=~/projects/github.com/meetearnest/
alias k=kubectl
alias i=istioctl

# Add ggo to PATH
PATH="/Users/michaeljackson/.gogo/bin:${PATH}"

### STS-TOKEN-TIMESAVERS
export AWS_TKN_PATH='/Users/michaeljackson/projects/github.com/meetearnest/aws-sts-token-generator/aws-token.sh'
export AWS_TKN_USR='michael.jackson@earnest.com'
export AWS_ACCT_PRD='earnest'
export AWS_ACCT_STG='est-staging'
export AWS_ACCT_TOOLS='est-tools'
export AWS_ACCT_DEV='e-development'
export AWS_ACCT_SBX='est-sandbox'
alias awstkn-sbx-ro="${AWS_TKN_PATH} --username ${AWS_TKN_USR} --account ${AWS_ACCT_SBX} --role Okta-Sandbox-DevProdRead --profile Okta-Sandbox-DevProdRead && export AWS_PROFILE=Okta-Sandbox-DevProdRead"
alias awstkn-sbx-rw="${AWS_TKN_PATH} --username ${AWS_TKN_USR} --account ${AWS_ACCT_SBX} --role Okta-Sandbox-DevProdWrite --profile Okta-Sandbox-DevProdWrite && export AWS_PROFILE=Okta-Sandbox-DevProdWrite"
alias awstkn-stg-ro="${AWS_TKN_PATH} --username ${AWS_TKN_USR} --account ${AWS_ACCT_STG} --role Okta-Staging-DevProdRead --profile Okta-Staging-DevProdRead && export AWS_PROFILE=Okta-Staging-DevProdRead"
alias awstkn-tools-rw="${AWS_TKN_PATH} --username ${AWS_TKN_USR} --account ${AWS_ACCT_TOOLS} --role Okta-Tools-DevProdWrite --profile Okta-Tools-DevProdWrite && export AWS_PROFILE=Okta-Tools-DevProdWrite"
alias awstkn-tools-admin="${AWS_TKN_PATH} --username ${AWS_TKN_USR}  --account ${AWS_ACCT_TOOLS} --role Okta-Tools-Administrator --profile Okta-Tools-Administrator && export AWS_PROFILE=Okta-Tools-Administrator"
alias awstkn-prd-ro="${AWS_TKN_PATH} --username ${AWS_TKN_USR} --account ${AWS_ACCT_PRD} --role Okta-Production-DevProdRead --profile Okta-Production-DevProdRead && export AWS_PROFILE=Okta-Production-DevProdRead"
alias kube-role=". role-utility assume_role arn:aws:iam::644712362974:role/pbe-slodev-eks-kubectl-auth-role kubectl_user eks-auth-kubectl"
alias slodev-config="aws eks --region us-east-1 update-kubeconfig --name pbe-slodev-cluster --profile Okta-Sandbox-DevProdWrite"
alias kube-sbx=". role-utility dettach_role && awstkn-sbx-rw && kube-role"
alias dpplaybx2-config="aws eks --region us-east-1 update-kubeconfig --name eks-dpplaybx2-us-east-1 --profile Okta-Sandbox-DevProdWrite"
alias persistent-config="aws eks --region us-west-2 update-kubeconfig --name eks-persistent-us-west-2 --profile Okta-Sandbox-DevProdWrite"

# Staging with saml2aws
alias staging-config="aws eks --region us-east-1 update-kubeconfig --name c1-est-stg-us-east-1 --profile Okta-Staging-DevProdRead"
alias staging-login="saml2aws login -a staging"

# vscode
alias code=code-insiders

#dsa - stop all running docker containers
dsa () {
  RUNNING_CONTAINERS="$(docker ps -q)"
  if [[ "${RUNNING_CONTAINERS}" == ""  ]]; then
    echo "No containers are running."
  else
    echo "The following containers were stopped:"
    docker stop $(echo ${RUNNING_CONTAINERS})
  fi
}

# nvm
  export NVM_DIR="$HOME/.nvm"
  [ -s "/usr/local/opt/nvm/nvm.sh" ] && \. "/usr/local/opt/nvm/nvm.sh"  # This loads nvm
  [ -s "/usr/local/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/usr/local/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion
