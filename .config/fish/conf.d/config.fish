set fish_greeting
fish_vi_key_bindings

if type -q exa
  alias ll 'exa -la'
else
  alias ll 'ls -la'
end

if type -q nala
  alias apt 'nala'
end

if type -q bat
  alias cat 'bat -pp'
  alias less 'bat -p'
else if type -q batcat
  alias cat 'batcat -pp'
  alias less 'batcat -p'
end

# Tmux aliases
alias t 'tmux attach || tmux new-session'
alias ta 'tmux attach -t'
alias tn 'tmux new-session'
alias tl 'tmux list-sessions'

# Docker aliases
alias dc 'sudo docker compose'
alias dcup 'sudo docker compose up --force-recreate -d'
alias dcdown 'sudo docker compose down'
alias dcrestart 'sudo docker compose restart'
alias docker-clean 'sudo docker container prune -f; and \
                    sudo docker image prune -af; and \
                    sudo docker network prune -f; and \
                    sudo docker volume prune -af'

# Use .. ... .... to move up directories
function multicd
    echo cd (string repeat -n (math (string length -- $argv[1]) - 1) ../)
end
abbr --add dotdot --regex '^\.\.+$' --function multicd

# Set full paths
set -U fish_prompt_pwd_dir_length 0

# White text for valid input
set -U fish_color_command white

if status is-interactive; and not set -q TMUX; and set -q SSH_CONNECTION
    tmux attach-session -t ssh_tmux || tmux new-session -s ssh_tmux
end