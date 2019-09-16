ARG VERSION=latest
FROM kalilinux/kali-linux-docker:${VERSION}

LABEL maintainer="Sen Zhang <szhang.hust@gmail.com>"

RUN apt-get install -y git curl gcc zsh make sudo gawk tree

RUN sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
RUN git clone https://github.com/SenZhangAI/oh-my-zsh-sen.git && sh ./oh-my-zsh-sen/install.sh && rm -rf ./oh-my-zsh-sen

##
#RUN pacman -S --noconfirm python python-pip neovim

# RUN pacman -S --noconfirm nodejs yarn npm

# RUN npm install -g neovim &&\
#     pip3 install --user --upgrade pynvim

# RUN mkdir -p $HOME/.vim &&\
#     git clone https://github.com/SenZhangAI/vim.git $HOME/.vim/vim &&\
#     sh $HOME/.vim/vim/install.sh

# RUN curl https://raw.githubusercontent.com/SenZhangAI/dotfiles/master/bootstrap.sh | bash

# ### install common tools
# ## net-tools for netstat
# RUN pacman -S --noconfirm wget tree net-tools clang gdb tmux

# RUN pacman -Scc --noconfirm

WORKDIR /root

ENTRYPOINT ["/bin/zsh"]
