ARG VERSION=7
FROM centos:${VERSION}

LABEL maintainer="Sen Zhang <szhang.hust@gmail.com>"

RUN yum -y update
# epel-release for luajit
RUN yum install -y epel-release curl gcc gcc-c++ make git

RUN yum install -y zsh

RUN sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

ARG VIM_VERSION=master
ARG VIM_ENABLE_ALL=""
ARG VIM_ENABLE_GUI="${VIM_ENABLE_ALL}"
ARG VIM_ENABLE_PERL="${VIM_ENABLE_ALL}"
#ARG VIM_ENABLE_PYTHON="${VIM_ENABLE_ALL}"
ARG VIM_ENABLE_PYTHON3="${VIM_ENABLE_ALL}"
ARG VIM_ENABLE_RUBY="${VIM_ENABLE_ALL}"
ARG VIM_ENABLE_LUA="${VIM_ENABLE_ALL}"
ARG VIM_ENABLE_TCL="${VIM_ENABLE_ALL}"
ARG LUA_VERSION="5.3"

RUN yum install -y ctags \
        glibc-devel \
        gettext \
        ncurses \
        ncurses-devel \
        libacl-devel \
    && yum install -y \
        diffutils \
        ${VIM_ENABLE_GUI:+gtk3-devel libXmu-devel} \
        ${VIM_ENABLE_PERL:+perl perl-devel perl-ExtUtils-ParseXS perl-ExtUtils-CBuilder perl-ExtUtils-Embed} \
        ${VIM_ENABLE_PYTHON:+python-devel} \
        ${VIM_ENABLE_PYTHON3:+python36 python36-devel} \
        ${VIM_ENABLE_RUBY:+ruby ruby-devel} \
        ${VIM_ENABLE_LUA:+lua lua-devel luajit-devel} \
        ${VIM_ENABLE_TCL:+tcl-devel} \
    && git -c http.postBuffer=1048576000 -c advice.detachedHead=false \
        clone --depth 1 --branch "${VIM_VERSION}" \
        https://github.com/vim/vim.git /usr/src/vim \
    && cd /usr/src/vim \
    && ./configure \
        --with-features=huge \
        --enable-multibyte \
        --enable-cscope \
        ${VIM_ENABLE_GUI:+--enable-gui=gtk3} \
        ${VIM_ENABLE_PERL:+--enable-perlinterp} \
        ${VIM_ENABLE_PYTHON:+--enable-pythoninterp} \
        ${VIM_ENABLE_PYTHON3:+--enable-python3interp} \
        ${VIM_ENABLE_RUBY:+--enable-rubyinterp} \
        ${VIM_ENABLE_LUA:+--enable-luainterp --with-luajit} \
        ${VIM_ENABLE_TCL:+--enable-tclinterp} \
        --enable-fail-if-missing \
    && make \
    && make install \
    && rm -rf /usr/src/vim \
#test
    && vim -es \
        ${VIM_ENABLE_PERL:+-c 'verbose perl print("Perl $^V")'} \
        ${VIM_ENABLE_PYTHON:+-c 'verbose python import platform;print("Python v" + platform.python_version())'} \
#${VIM_ENABLE_PYTHON3:+-c 'verbose python3 import platform;print("Python3 v" + platform.python_version())'} \
        ${VIM_ENABLE_RUBY:+-c 'verbose ruby puts "Ruby v#{RUBY_VERSION}"'} \
        ${VIM_ENABLE_LUA:+-c 'verbose lua print(_VERSION)'} \
        ${VIM_ENABLE_TCL:+-c 'verbose tcl puts "Tcl v[info patchlevel]"'} \
        -c q

RUN git clone https://github.com/SenZhangAI/oh-my-zsh-sen.git && cd oh-my-zsh-sen && sh install.sh

RUN mkdir -p $HOME/.vim && cd $HOME/.vim \
    && git clone https://github.com/SenZhangAI/vim.git \
    && cd vim && sh install.sh

## install common tools
RUN yum install -y wget tree sudo

WORKDIR /root

ENTRYPOINT ["/bin/zsh"]
