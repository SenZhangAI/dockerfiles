ARG VERSION=7
FROM centos:${VERSION}

LABEL maintainer="Sen Zhang <szhang.hust@gmail.com>"

RUN rpm --import /etc/pki/rpm-gpg/RPM-GPG-KEY-CentOS-7 &&\
    yum -y updateinfo &&\
    yum install -y epel-release &&\
    yum install -y curl gcc gcc-c++ make git zsh sudo

RUN sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

RUN yum install -y https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm || echo "ok" &&\
    yum install -y python-devel python36 python36-devel neovim python3-neovim

RUN git clone https://github.com/SenZhangAI/oh-my-zsh-sen.git && cd oh-my-zsh-sen && sh install.sh

RUN curl -sL https://rpm.nodesource.com/setup_10.x | bash - &&\
    yum install -y nodejs &&\
    curl -sL https://dl.yarnpkg.com/rpm/yarn.repo | sudo tee /etc/yum.repos.d/yarn.repo &&\
    yum install -y yarn

RUN npm install -g neovim &&\
    yum install -y python36-setuptools &&\
    easy_install-3.6 pip &&\
    pip3 install neovim

RUN yum install -y which && mkdir -p $HOME/.vim && cd $HOME/.vim &&\
    git clone https://github.com/SenZhangAI/vim.git &&\
    cd vim && ./install.sh

## install common tools
# net-tools for netstat
RUN yum install -y wget tree net-tools gdb

RUN sudo yum install -y clang

WORKDIR /root

ENTRYPOINT ["/bin/zsh"]
