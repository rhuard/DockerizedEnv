FROM ubuntu:xenial

RUN apt-get update && apt-get upgrade && apt-get install -y git && apt-get install -y apt-utils

RUN git clone https://github.com/rhuard/NewStartup.git $HOME/NewStartup && $HOME/NewStartup/docker_image.sh && vim +PluginInstall +qall

CMD ["zsh"]
