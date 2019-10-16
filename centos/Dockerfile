ARG VERSION=7
FROM centos:${VERSION}

LABEL maintainer="Sen Zhang <szhang.hust@gmail.com>"

RUN rpm --import /etc/pki/rpm-gpg/RPM-GPG-KEY-CentOS-7 &&\
    yum -y updateinfo &&\
    yum install -y epel-release &&\
    yum install -y curl gcc gcc-c++ make git zsh sudo which

RUN sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
RUN git clone https://github.com/SenZhangAI/oh-my-zsh-sen.git && sh ./oh-my-zsh-sen/install.sh && rm -rf ./oh-my-zsh-sen

RUN yum install -y https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm || echo "ok" &&\
    yum install -y python-devel python36 python36-devel neovim python3-neovim

RUN curl -sL https://rpm.nodesource.com/setup_10.x | bash - &&\
    yum install -y nodejs &&\
    curl -sL https://dl.yarnpkg.com/rpm/yarn.repo | sudo tee /etc/yum.repos.d/yarn.repo &&\
    yum install -y yarn

RUN npm install -g neovim &&\
    yum install -y python36-setuptools &&\
    easy_install-3.6 pip &&\
    pip3 install neovim

RUN mkdir -p $HOME/.vim &&\
    git clone https://github.com/SenZhangAI/vim.git $HOME/.vim/vim &&\
    sh $HOME/.vim/vim/install.sh

RUN yum install -y ncurses ncurses-devel libevent libevent-devel automake byacc &&\
    mkdir -p $HOME/tmp &&\
    git clone --depth=1 https://github.com/tmux/tmux.git $HOME/tmp/tmux && cd $HOME/tmp/tmux &&\
    sh autogen.sh &&\
    ./configure && make &&\
    cp $HOME/tmp/tmux/tmux /usr/local/bin &&\
    cd $HOME &&\
    rm -rf $HOME/tmp

RUN curl https://raw.githubusercontent.com/SenZhangAI/dotfiles/master/bootstrap.sh | bash

## install common tools
# net-tools for netstat
RUN yum install -y wget tree net-tools gdb nc

RUN sudo yum install -y clang

## install clangd
RUN sudo yum install -y epel-release &&\
    sudo yum install -y snapd
    sudo systemctl enable --now snapd.socket &&\
    sudo ln -s /var/lib/snapd/snap /snap
## Need reboot here when using real machine
RUN sudo snap install clangd --classic

RUN yum clean all -y

WORKDIR /root

ENTRYPOINT ["/bin/zsh"]
