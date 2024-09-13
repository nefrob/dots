FROM alpine:latest

RUN apk update && apk add --no-cache bash curl git shadow stow tmux vim zsh
RUN mkdir /root/dots && git clone https://github.com/nefrob/dots /root/dotfiles

WORKDIR /root/dotfiles
# Set this to test branch as needed
# RUN git checkout ...
RUN chmod +x setup.sh && bash ./setup.sh
