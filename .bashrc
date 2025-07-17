# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
    . /etc/bashrc
fi

# User specific environment
if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:" ]]; then
    PATH="$HOME/.local/bin:$HOME/bin:$PATH"
fi
export PATH

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions
if [ -d ~/.bashrc.d ]; then
    for rc in ~/.bashrc.d/*; do
        if [ -f "$rc" ]; then
            . "$rc"
        fi
    done
fi
unset rc

eval "$(starship init bash)"
eval "$(thefuck --alias)"
alias connectheadphones="bluetoothctl connect 80:C3:BA:59:0F:7A"
alias disconnectheadphones="bluetoothctl disconnect 80:C3:BA:59:0F:7A"
alias connectsoundbar="bluetoothctl connect F8:1B:A3:79:A7:55"
alias disconnectsoundbar="bluetoothctl disconnect F8:1B:A3:79:A7:55"
alias openedulog="code ~/Desktop/OpenEduLog/OpenEduLog-frontend/ && code ~/Desktop/OpenEduLog/OpenEduLog-backend/"
alias code='code --enable-features=UseOzonePlatform,WaylandWindowDecorations --ozone-platform=wayland'
alias restartwifi="nmcli radio wifi off && sleep 1 && nmcli radio wifi on"
alias code-aproco-workers="code ~/Desktop/Aproco/aproco-workers"
alias firefoxa="firefox -P Aproco &"
alias firefoxp="firefox -P Private &"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/home/twoface/Documents/google-cloud-sdk/path.bash.inc' ]; then . '/home/twoface/Documents/google-cloud-sdk/path.bash.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/home/twoface/Documents/google-cloud-sdk/completion.bash.inc' ]; then . '/home/twoface/Documents/google-cloud-sdk/completion.bash.inc'; fi
