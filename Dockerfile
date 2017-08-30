FROM ubuntu:xenial

ENV TERM xterm

RUN apt-get update && apt-get install dialog && apt-get install -y apt-utils && apt-get upgrade && apt-get install -y git

RUN git clone https://github.com/rhuard/NewStartup.git $HOME/NewStartup && $HOME/NewStartup/docker_image.sh && vim +PluginInstall +qall

CMD ["zsh"]
