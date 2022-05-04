# Git things
alias ub="git checkout master && git pull && git checkout -b ";
alias gst='git status';
alias gp='git push origin HEAD';
alias gd="git diff --color-words=. $(gst --porcelain | grep '\sM\s' | awk '{print $2}' | head -1)";
alias ga="git add $(gst --porcelain | grep '\sM\s' | awk '{print $2}' | head -1)";
alias mub="git checkout master && git pull && git checkout -";

function gc { git checkout $(git branch | grep $@) }
