FROM --platform=linux/x86_64 ubuntu:20.04

RUN apt-get update
RUN apt-get install -y locales procps tzdata

RUN yes | unminimize
RUN locale-gen ja_JP.UTF-8
RUN localedef -f UTF-8 -i ja_JP ja_JP

#
# env
#
ENV LANG=ja_JP.UTF-8
ENV TZ=Asia/Tokyo
ENV HOME=/home

WORKDIR $HOME/

# TFTPサーバのインストール
RUN apt-get update && apt-get install -y tftpd-hpa

# ref: https://manpages.debian.org/testing/tftpd-hpa/in.tftpd.8.en.html
CMD echo -n 'Starting TFTP Server...'
CMD /usr/sbin/in.tftpd --version
CMD /usr/sbin/in.tftpd --foreground --user tftp --address :69 --create --secure --blocksize 1468 --verbose /srv/tftp
