FROM ubuntu:latest
MAINTAINER Ricardo Bernardeli <ricardobcs@gmail.com>

RUN apt-get update -y -qq && \
    apt-get install -y -qq vim git htop wget curl ncdu zsh dnsutils

WORKDIR /root

RUN git clone git://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh \
    && cp ~/.oh-my-zsh/templates/zshrc.zsh-template ~/.zshrc

RUN git clone git://github.com/bernardeli/dotfiles.git ~/.dotfiles \
    && sh ~/.dotfiles/install.sh

COPY toolbox_bash_profile /root/.toolbox_bash_profile
RUN echo "source \$HOME/.toolbox_bash_profile" >> ~/.zshrc

CMD ["zsh"]
