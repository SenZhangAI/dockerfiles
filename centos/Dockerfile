ARG VERSION=7
FROM centos:${VERSION}

LABEL maintainer="Sen Zhang <szhang.hust@gmail.com>"

RUN yum -y update
# epel-release for luajit
RUN yum install -y epel-release curl gcc gcc-c++ make git

RUN yum install -y zsh

RUN sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

RUN yum install -y https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm || echo "ok" \
    && yum install -y neovim python3-neovim

RUN git clone https://github.com/SenZhangAI/oh-my-zsh-sen.git && cd oh-my-zsh-sen && sh install.sh

RUN mkdir -p $HOME/.vim && cd $HOME/.vim \
    && git clone https://github.com/SenZhangAI/vim.git \
    && cd vim && sh install.sh

## install common tools
RUN yum install -y wget tree sudo

WORKDIR /root

ENTRYPOINT ["/bin/zsh"]
