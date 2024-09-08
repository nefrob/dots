FROM alpine:latest

RUN apk add --no-cache git
RUN git clone https://github.com/nefrob/dots "$HOME/dots"

WORKDIR "$HOME/dots"
CMD ["./setup.sh"]
