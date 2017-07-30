FROM node:alpine

## node
RUN yarn global add prettier chokidar-cli serve

RUN apk add --update --no-cache zsh vim tmux git curl wget sudo htop ncurses openssl grep jq py-pip
RUN adduser -S dev -h /home/dev -s /bin/zsh -u 1001 -D -G users
RUN echo 'dev ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers

## aws
RUN pip install awscli

USER dev
WORKDIR /home/dev
ENV HOME /home/dev
ENV USER dev
ENV TERM screen-256color
ENV EDITOR vim
ENV LC_ALL=en_US.UTF-8
ENV LANG=en_US.UTF-8
ENV LANGUAGE=en_US.UTF-8

RUN git clone https://github.com/balazs4/dotfiles $HOME/.dotfiles --single-branch --depth 1

## ZSH
RUN ln -s $HOME/.dotfiles/zsh/zshrc $HOME/.zshrc
RUN $HOME/.dotfiles/zsh/oh-my-zsh-install.sh
RUN touch $HOME/.z

## TMUX
RUN ln -s $HOME/.dotfiles/tmux/tmux.conf $HOME/.tmux.conf
RUN $HOME/.dotfiles/tmux/install-plugins.sh

## VIM
RUN ln -s $HOME/.dotfiles/vim/vimrc $HOME/.vimrc
RUN $HOME/.dotfiles/vim/install-pathogen.sh
RUN $HOME/.dotfiles/vim/vimplugin

CMD tmux -u
