FROM ubuntu:xenial

ENV TERM xterm

RUN apt-get update && apt-get install dialog && apt-get install -y apt-utils && apt-get upgrade && apt-get install -y git

RUN git clone https://github.com/rhuard/NewStartup.git $HOME/NewStartup && $HOME/NewStartup/docker_image.sh && vim +PluginInstall +qall

RUN apt-get install -y llvm clang build-essential
RUN apt-get install -y vim-nox-py2 && apt-get install -y wget curl
RUN apt-get install -y python-dev python3-dev
RUN wget http://releases.llvm.org/4.0.1/clang+llvm-4.0.1-x86_64-linux-gnu-debian8.tar.xz
RUN mkdir ~/ycm_build && mkdir -p ~/ycm_tmp
RUN tar -xf clang+llvm-4.0.1-x86_64-linux-gnu-debian8.tar.xz
RUN mv clang+llvm-4.0.1-x86_64-linux-gnu-debian8 ~/ycm_tmp/llvm_root_dir
RUN cd ~/ycm_build
RUN cmake -G "Unix Makefiles" -DPATH_TO_LLVM_ROOT=~/ycm_tmp/llvm_root_dir . ~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp
RUN cmake --build . --target ycm_core --config Release


CMD ["zsh"]
