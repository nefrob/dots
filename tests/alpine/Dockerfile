FROM alpine:latest

RUN apk update && apk add --no-cache bash curl git shadow stow tmux vim zsh
RUN mkdir /root/dots && git clone https://github.com/nefrob/dots /root/dotfiles

WORKDIR /root/dotfiles
RUN git checkout origin/nefrob/cleanup-new-system
RUN chmod +x setup.sh && bash ./setup.sh
