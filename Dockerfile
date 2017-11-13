FROM ubuntu:xenial

ENV TERM xterm

#Install programs
RUN apt update && apt install -y dialog apt-utils && apt upgrade -y && apt install -y \
    git \
    llvm \
    clang \
    build-essential \
    python2.7 \
    python3 \
    python-pip \
    python-dev \
    python3-dev \
    gcc \
    bcc \
    cmake \
    openjdk-8-jdk \
    openjdk-8-jre \
    vim \
    vim-nox-py2 \
    wget \
    curl \
    tmux \
    zsh \
    ack-grep \
    curl \
    ranger \
    pylint \
    cowsay \
    figlet \
    exuberant-ctags \
    colordiff \
    diffuse \
    source-highlight \
    dict \
    dict-moby-thesaurus \
    aspell \
    feh \
    bsdmainutils \
    iputils-ping \
    man \
    host \
    dnsutils \
    lua5.3 \
    libncurses5-dev \
    libncursesw5-dev

# Install vim plugins
RUN git clone https://github.com/rhuard/NewStartup.git $HOME/NewStartup && $HOME/NewStartup/docker_image.sh && vim +PluginInstall +qall

# Compile YouCompleteMe for vim
RUN wget http://releases.llvm.org/4.0.1/clang+llvm-4.0.1-x86_64-linux-gnu-debian8.tar.xz && \
    mkdir ~/ycm_build && mkdir -p ~/ycm_tmp && tar -xf clang+llvm-4.0.1-x86_64-linux-gnu-debian8.tar.xz && \
    mv clang+llvm-4.0.1-x86_64-linux-gnu-debian8 ~/ycm_tmp/llvm_root_dir && cd ~/ycm_build && \
    cmake -G "Unix Makefiles" -DPATH_TO_LLVM_ROOT=~/ycm_tmp/llvm_root_dir . ~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp && \
    cmake --build . --target ycm_core --config Release

# start shell
CMD ["zsh"]
