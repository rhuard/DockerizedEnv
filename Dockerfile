FROM ubuntu:xenial

RUN apt-get update && apt-get upgrade && apt-get install -y git

RUN apt-get install -y apt-utils

RUN git clone https://github.com/rhuard/NewStartup.git $HOME/NewStartup

RUN $HOME/NewStartup/docker_image.sh

RUN vim +PluginInstall +qall

CMD ["zsh"]
