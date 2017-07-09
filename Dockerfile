FROM alpine:edge

RUN apk add --update --no-cache bash neovim tmux git curl wget sudo htop ncurses openssl
RUN adduser -S dev -h /home/dev -s /bin/bash -u 1000 -D -G users
RUN echo 'dev ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers

ENV HOME /home/dev
ENV USER dev
ENV TERM screen-256color
ENV EDITOR nvim
ENV LC_ALL=en_US.UTF-8
ENV LANG=en_US.UTF-8
ENV LANGUAGE=en_US.UTF-8
USER dev
WORKDIR /home/dev

## neovim
RUN mkdir -p "$HOME/.config/nvim/autoload"
RUN curl -s https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim > "$HOME/.config/nvim/autoload/plug.vim"
RUN mkdir -p "$HOME/.config/nvim/plugged"
COPY init.vim "$HOME/.config/nvim/init.vim"
RUN nvim --headless +PlugInstall +qall

## bash
COPY bash_powerline "$HOME/.bash_powerline"
COPY bashrc "$HOME/.bashrc"
COPY bash_profile "$HOME/.bash_profile"

## tmux
RUN git clone https://github.com/jimeh/tmux-themepack.git ~/.tmux-themepack
COPY tmux.conf "$HOME/.tmux.conf"

RUN sudo chown -R dev:users $HOME
CMD tmux -u
