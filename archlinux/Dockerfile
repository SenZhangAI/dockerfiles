ARG VERSION=latest
FROM archlinux/base:${VERSION}

LABEL maintainer="Sen Zhang <szhang.hust@gmail.com>"

RUN cp /etc/pacman.d/mirrorlist /etc/pacman.d/mirrorlist.bak &&\
    echo 'Server = http://mirrors.163.com/archlinux/$repo/os/$arch' > /etc/pacman.d/mirrorlist &&\
    echo 'Server = http://mirrors.cqu.edu.cn/archlinux/$repo/os/$arch' >> /etc/pacman.d/mirrorlist &&\
    echo 'Server = https://mirrors.cqu.edu.cn/archlinux/$repo/os/$arch' >> /etc/pacman.d/mirrorlist &&\
    echo 'Server = http://mirror.lzu.edu.cn/archlinux/$repo/os/$arch' >> /etc/pacman.d/mirrorlist &&\
    echo 'Server = http://mirrors.neusoft.edu.cn/archlinux/$repo/os/$arch' >> /etc/pacman.d/mirrorlist &&\
    echo 'Server = https://mirrors.neusoft.edu.cn/archlinux/$repo/os/$arch' >> /etc/pacman.d/mirrorlist &&\
    echo 'Server = https://mirrors.sjtug.sjtu.edu.cn/archlinux/$repo/os/$arch' >> /etc/pacman.d/mirrorlist &&\
    echo 'Server = http://mirrors.tuna.tsinghua.edu.cn/archlinux/$repo/os/$arch' >> /etc/pacman.d/mirrorlist &&\
    echo 'Server = https://mirrors.tuna.tsinghua.edu.cn/archlinux/$repo/os/$arch' >> /etc/pacman.d/mirrorlist &&\
    echo 'Server = http://mirrors.ustc.edu.cn/archlinux/$repo/os/$arch' >> /etc/pacman.d/mirrorlist &&\
    echo 'Server = https://mirrors.ustc.edu.cn/archlinux/$repo/os/$arch' >> /etc/pacman.d/mirrorlist &&\
    echo 'Server = https://mirrors.xjtu.edu.cn/archlinux/$repo/os/$arch' >> /etc/pacman.d/mirrorlist &&\
    echo 'Server = http://mirrors.zju.edu.cn/archlinux/$repo/os/$arch' >> /etc/pacman.d/mirrorlist

RUN pacman -Syyu --noconfirm &&\
    pacman -S pacman --noconfirm &&\
    pacman-db-upgrade

RUN pacman -S --noconfirm git curl gcc zsh make sudo gawk tree

RUN sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
RUN git clone https://github.com/SenZhangAI/oh-my-zsh-sen.git && sh ./oh-my-zsh-sen/install.sh && rm -rf ./oh-my-zsh-sen

#
RUN pacman -S --noconfirm python python-pip neovim

RUN pacman -S --noconfirm nodejs yarn npm

RUN npm install -g neovim &&\
    pip3 install --user --upgrade pynvim

RUN mkdir -p $HOME/.vim &&\
    git clone https://github.com/SenZhangAI/vim.git $HOME/.vim/vim &&\
    sh $HOME/.vim/vim/install.sh

RUN curl https://raw.githubusercontent.com/SenZhangAI/dotfiles/master/bootstrap.sh | bash

### install common tools
## net-tools for netstat
RUN pacman -S --noconfirm wget tree net-tools clang gdb tmux netcat

RUN pacman -Scc --noconfirm

WORKDIR /root

ENTRYPOINT ["/bin/zsh"]
