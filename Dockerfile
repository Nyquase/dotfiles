FROM ubuntu:latest

RUN apt-get update
RUN apt-get install -y locales && locale-gen en_US.UTF-8
ENV LC_ALL en_US.UTF-8
ENV TERM xterm-256color


RUN apt-get install -y sudo curl git wget unzip fontconfig

ENV LIGHT_INSTALL true
RUN git clone https://github.com/Nyquase/dotfiles/ && cd dotfiles && ./install.sh

CMD zsh