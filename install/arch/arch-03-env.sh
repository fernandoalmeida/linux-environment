#/bin/bash -e

###############################################
# utilities
###############################################
echo "setup AUR package manager"
read
make arch/aura

echo "setup hardwares"
read
make arch/audio \
     arch/video \
     arch/bluetooth \
     arch/printer

echo "setup general dependencies"
read
make arch/ssh \
     arch/git \
     arch/bash \
     arch/awesome \
     arch/fonts \
     arch/xscreensaver \
     arch/zip

echo "setup main programming dependencies"
read
make arch/emacs \
     arch/elixir \
     arch/python \
     arch/node \
     arch/docker

echo "setup additional programming dependencies"
read
make arch/lsp-bash \
     arch/lsp-elixir \
     arch/lsp-erlang \
     arch/lsp-javascript \
     arch/lsp-typescript \
     arch/lsp-css \
     arch/lsp-lua \
     arch/lsp-python \
     arch/prettier \
     arch/ngrok

echo "setup utilities"
read
make arch/firefox \
     arch/chromium \
     arch/zoom \
     arch/telegram \
     arch/slack \
     arch/dropbox \
     arch/filemanager \
     arch/imageviewer \
     arch/pdfviewer \
     arch/libreoffice \
     arch/gimp \
     arch/wakatime \
     # arch/spotify
