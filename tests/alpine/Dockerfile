FROM alpine:latest

RUN apk update && apk add --no-cache git
RUN git clone https://github.com/nefrob/dots "$HOME/dots"

WORKDIR "$HOME/dots"
RUN chmod +x packages/alpine.sh && ./packages/alpine.sh
RUN chmod +x setup.sh && ./setup.sh
