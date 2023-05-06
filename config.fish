if status is-interactive
    # Commands to run in interactive sessions can go here

#
alias yt="open https://www.youtube.com"
alias hn="open https://news.ycombinator.com/"
alias gituniv="open https://github.com/sysco-middleware/aof-universum-ui"
alias gitmin="open https://github.com/sysco-middleware/aof-minside-ui"

alias vdev="open https://web-login.dev.vigilo-oas.no/"
alias vprod="open https://web-login.prod.vigilo-oas.no/"
alias vsc="open https://web-local-school.dev.vigilo-oas.no:8080/login/set-context\?organizationalUnitId=e1db6b72-a575-44aa-8665-1ea56de032e5"
alias vscf="open https://web-local-school.dev.vigilo-oas.no:8080/login/set-context\?organizationalUnitId="
alias vch="open https://web-local-childcare.dev.vigilo-oas.no:5002/login/set-context\?organizationalUnitId=53361961-cc86-4a2e-973c-fe1d120a666a"
alias vchf="open https://web-local-childcare.dev.vigilo-oas.no:5002/login/set-context\?organizationalUnitId="
alias vaf="open https://web-local-after-school.dev.vigilo-oas.no:5004/login/set-context\?organizationalUnitId=b0810a84-79b7-45da-8567-d82916a53737"
alias vaff="open https://web-local-after-school.dev.vigilo-oas.no:5004/login/set-context\?organizationalUnitId="
# END ================
#
alias 16="nvm use 16"
alias nv="node --version"

alias synca="~/scripts/&& ./syncAlmanac.sh"

#MINE
alias t="tree"


# FUNCTIONS START =========

function bps
  echo "OH shieeet, here we go again"
  echo "putting it in"
  echo $argv
  cd ~/01_code/vigilo/vigilo-front-end/
  nvm use 16
  yarn build:libs
  cd ~/01_code/vigilo/vigilo-front-end/packages/vigilo-ui-web && cp -r es lib ~/01_code/Vigilo/$argv/node_modules/vigilo-ui-web
  cd ~/01_code/vigilo/vigilo-front-end/packages/vigilo-domain && cp -r es lib ~/01_code/Vigilo/$argv/node_modules/vigilo-domain
  cd ~/01_code/vigilo/vigilo-front-end/packages/vigilo-web-utils && cp -r es lib ~/01_code/Vigilo/$argv/node_modules/vigilo-web-utils
  cd ~/01_code/vigilo/vigilo-front-end/packages/vigilo-forms && cp -r es lib ~/01_code/Vigilo/$argv/node_modules/vigilo-forms
  cd ~/01_code/vigilo/vigilo-front-end/
  echo "COMPLETE"
end

function bpui
  echo "🛠 🛠 🛠 BUILDING UI-WEB🛠 🛠 🛠"
  cd ~/01_code/vigilo/vigilo-front-end/packages/vigilo-ui-web
  echo "ENTERED CORRECT DIR"
  nvm use 16
  echo "USING NODE 16"
  yarn build
  echo "BUILD COMPLETE"
  cp -r es lib ~/01_code/Vigilo/$argv/node_modules/vigilo-ui-web
  echo "MOVING FILES"
  ls -lc ~/01_code/vigilo/vigilo-front-end/packages/vigilo-ui-web
  echo "COMPLETE ME LORD"
end

function bpdom
  echo "🛠 🛠 🛠 BUILDING DOMAIN TO 🛠 🛠 🛠 " $argv
  cd ~/01_code/vigilo/vigilo-front-end/packages/vigilo-domain
  echo "ENTERED CORRECT DIR"
  nvm use 16
  echo "USING NODE 16"
  yarn build
  echo "BUILD COMPLETE"
  cp -r es lib ~/01_code/Vigilo/$argv/node_modules/vigilo-domain
  echo "MOVING FILES"
  ls -lc ~/01_code/vigilo/vigilo-front-end/packages/vigilo-domain
  echo "COMPLETE ME LORD"
end


function buildpack
echo "FIIIIIIIRING MY LAAAAAAAAAAAZER"
 yarn build && cp -r es lib $argv
 echo "Complete"
end

function setup
  mkdir folder1
  cd folder1
  mkdir subfolder1 subfolde2
end

function bump
  echo "BUMPING:"
  echo "STARTING CHILDCARE"
  cd ~/01_code/Vigilo/vigilo-childcare-employee-portal/
  git checkout -b $argv
  yarn add vigilo-ui-web
  git add .
  git commit -m "bumping ui-web"
  git push -u origin $argv
  echo "END CHILDCARE"

  echo "STARTING SCHOOL"
  cd ~/01_code/Vigilo/vigilooptimal-frontend/
  git checkout -b $argv
  yarn add vigilo-ui-web
  git add .
  git commit -m "bumping ui-web"
  git push -u origin $argv
  echo "END SCHOOL"

  echo "STARTING AFTER-SCHOOL"
  cd ~/01_code/Vigilo/vigilo-after-school-portal/
  git checkout -b $argv
  yarn add vigilo-ui-web
  git add .
  git commit -m "bumping ui-web"
  git push -u origin $argv
  echo "END AFTER-SCHOOL"
end

function update
# For updating all repos
  echo "UPDATING"
  echo "CHILDCARE"
  cd ~/01_code/Vigilo/vigilo-childcare-employee-portal/
  git checkout master
  git pull
  yarn
  echo "DONE CHILDCARE"

  echo "AFTER-SCHOOL"
  cd ~/01_code/Vigilo/vigilo-after-school-portal/
  git checkout master
  git pull
  yarn
  echo "DONE AFTER-SCHOOL"

  echo "SCHOOL"
  cd ~/01_code/Vigilo/vigilooptimal-frontend/
  git checkout master
  git pull
  yarn
  echo "DONE SCHOOL"

  echo "FRONT-END PACKAGES"
  cd ~/01_code/vigilo-frontend/
  git checkout master
  git pull
  yarn
  echo "DONE FRONT-END PACKAGES"

  echo "Script complete 🛠"
end

function bumpboiboi
  echo "BUMPING:"
  echo "STARTING CHILDCARE"
  cd ~/01_code/Vigilo/vigilo-childcare-employee-portal/
  git stash save -u
  git checkout master
  git pull
  git checkout -b $argv
  yarn add vigilo-ui-web
  git add .
  git commit -m "bumping ui-web"
  git push -u origin $argv
  echo "END CHILDCARE"

  echo "STARTING SCHOOL"
  cd ~/01_code/Vigilo/vigilooptimal-frontend/
  git stash save -u
  git checkout master
  git pull
  git checkout -b $argv
  yarn add vigilo-ui-web
  git add .
  git commit -m "bumping ui-web"
  git push -u origin $argv
  echo "END SCHOOL"

  echo "STARTING AFTER-SCHOOL"
  cd ~/01_code/Vigilo/vigilo-after-school-portal/
  git stash save -u
  git checkout master
  git checkout -b $argv
  yarn add vigilo-ui-web
  git add .
  git commit -m "bumping ui-web"
  git push -u origin $argv
  echo "END AFTER-SCHOOL"
end

function bumpdombois
  echo "BUMPING:"
  echo "STARTING CHILDCARE"
  cd ~/01_code/Vigilo/vigilo-childcare-employee-portal/
  git stash save -u
  git checkout master
  git pull
  git checkout -b $argv
  yarn add vigilo-domain
  git add .
  git commit -m "bumping domain"
  git push -u origin $argv
  echo "END CHILDCARE"

  echo "STARTING SCHOOL"
  cd ~/01_code/Vigilo/vigilooptimal-frontend/
  git stash save -u
  git checkout master
  git pull
  git checkout -b $argv
  yarn add vigilo-domain
  git add .
  git commit -m "bumping domain"
  git push -u origin $argv
  echo "END SCHOOL"

  echo "STARTING AFTER-SCHOOL"
  cd ~/01_code/Vigilo/vigilo-after-school-portal/
  git stash save -u
  git checkout master
  git checkout -b $argv
  yarn add vigilo-domain
  git add .
  git commit -m "bumping domain"
  git push -u origin $argv
  echo "END AFTER-SCHOOL"

end



# # FUNCTIONS END ========


alias bpuisc="bpui vigilooptimal-frontend"

alias cdn="cdg && cd NOTES"


alias bb="open https://bitbucket.org"

alias duk="cd ~/01_code/DUK-strapi/frontend"

alias buildboi="yarn build && cp -r es lib ~/01_code/Vigilo/vigilo-childcare-employee-portal/node_modules/vigilo-ui-web/"

alias cdg="cd ~/Google\ Drive/My\ Drive/0000_programming"

alias cdvi="cd ~/01_code/Vigilo"

alias lsv="ls -lc ~/01_code/Vigilo"

#AOF COMMANDS
alias genapi="npm run generate-api"
alias nrs="npm run serve"


# GIT COMMANDS =============
alias gitboi="git checkout master && git pull"
alias gitwoke="git checkout main && git pull"
alias yboi="git checkout master && git pull && yarn"
alias gsw="git checkout -"
alias gitny="git checkout -b"
alias gs="git status"
alias gb="git branch"
alias gc="git checkout"
alias gcm="git checkout master"
alias grb="git rebase origin/master"
alias grbc="git rebase --continue"
alias gd="git diff"
alias gp="git pull"
alias gl="git log"
alias ga="git add"
alias glb="git for-each-ref --sort=-committerdate refs/heads/"
alias gbs="git branch --sort=-committerdate"
alias gblr="git for-each-ref --sort=committerdate refs/heads/ --format='%(HEAD) %(color:yellow)%(refname:short)%(color:reset) - %(color:red)%(objectname:short)%(color:reset) - %(contents:subject) - %(authorname) (%(color:green)%(committerdate:relative)%(color:reset))'"
# GIT COMMANDS END ==========


#Other
alias dba="cat /Users/boien/code/dummyData/bankAccountNm.txt"

#misc
alias rain="echo raining... && afplay ~/code/sounds/calmrain.mp3"
alias thunder="afplay ~/code/sounds/thunder.mp3"
alias ascrain="cd ~/code/ascii-rain && ./rain"


#NPM
alias n="npm"


# Python
alias python="python3"
alias p="python3"

alias y="yarn"
alias ys="yarn start"
alias yys="yarn && yarn start"
alias yst="yarn storybook"
alias yd="yarn develop"
alias ya="yarn add"
alias yb="yarn build"

alias dr="dotnet run"

alias s="sudo"

alias gsl="git stash list"
alias gss="git stash save -u"
alias gsa="git stash apply"

alias cdcode="cd ~/01_code"
alias fishconf="vim ~/.config/fish/config.fish"
alias codefish="code ~/.config/fish/config.fish"

alias cdviafter="cdvi && cd vigilo-after-school-portal/"
alias cdvichild="cdvi && cd vigilo-childcare-employee-portal/"
alias cdvischool="cdvi && cd vigilooptimal-frontend/"

alias cdvifront="cdvi && cd vigilo-front-end/"
alias cdvipack="cd /Users/jonathan/01_code/Vigilo/vigilo-front-end/packages/"
alias cdviui="cd /Users/jonathan/01_code/Vigilo/vigilo-front-end/packages/vigilo-ui-web"
alias cdvidom="cd ~/01_code/Vigilo/vigilo-front-end/packages/vigilo-domain"

alias ecs="emacs -nw"

alias nodechild="~/01_code/Vigilo/vigilo-childcare-employee-portal/node_modules/vigilo-ui-web"
alias nodeschool="cdvischool && cd node_modules/vigilo-ui-web"
alias nodeafter="cdviafter && cd node_modules/vigilo-ui-web"
alias ndc="cd nodechild"
alias bcpchild="cd ~/01_code/Vigilo/vigilo-front-end/packages/vigilo-ui-web  && yarn build && cp -r es lib ~/01_code/Vigilo/vigilo-childcare-employee-portal/node_modules/vigilo-ui-web && cd ~/01_code/Vigilo/vigilo-childcare-employee-portal/node_modules/vigilo-ui-web && ls -lc"

alias fl="fish_logo"
alias nf="neofetch"
alias books="open ~/Library/Containers/com.apple.BKAgentService/Data/Documents/iBooks"

end

set -x PATH (pwd)"/git-fuzzy/bin:$PATH"
