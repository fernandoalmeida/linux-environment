alias emacss='emacs &'
alias ed='emacs --daemon'
alias ec='emacsclient -c'
alias et='TERM=xterm-256color emacsclient -t'

alias b='bundle'
alias bi='bundle install'
alias be='bundle exec'
alias berdm='bundle exec rake db:migrate'
alias berdmv0='bundle exec rake db:migrate VERSION=0'
alias berdr='bundle exec rake db:rollback'

alias avd='android avd &'

alias ctags_generate='ctags -R --languages=ruby --exclude=.git --exclude=log --exclude=.gems .'
alias ctags_generate_bundler='ctags -R --languages=ruby --exclude=.git --exclude=log . $(bundle list --paths)'
