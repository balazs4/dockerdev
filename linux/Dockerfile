FROM alpine:edge

RUN apk add --update --no-cache bash neovim tmux git curl wget sudo htop
RUN adduser -S dev -h /home/dev -s /bin/bash -u 1001 -D -G users
RUN echo 'dev ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers

ENV HOME /home/dev
ENV USER dev
ENV TERM screen-256color
ENV EDITOR nvim
USER dev
WORKDIR /home/dev

## neovim
RUN mkdir -p "$HOME/.config/nvim/autoload"
RUN curl -s https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim > "$HOME/.config/nvim/autoload/plug.vim"
RUN mkdir -p "$HOME/.config/nvim/plugged"
COPY init.vim "$HOME/.config/nvim/init.vim"
RUN sudo chown -R dev:users $HOME
RUN nvim --headless +PlugInstall +qall &&  echo 'color onedark' >> "$HOME/.config/nvim/init.vim"

CMD bash
