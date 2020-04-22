FROM ubuntu:latest

RUN echo 'Acquire::HTTP::Proxy "http://lmaddox.chickenkiller.com:3142";' | cat > /etc/apt/apt.conf.d/01proxy \
 && apt update \
 && apt install -y apt-utils \
 && apt install -y apt-transport-https software-properties-common \
 && add-apt-repository ppa:apt-fast/stable \
 && apt update \
 && apt install -y apt-fast \
 && apt-fast full-upgrade -y \
 && apt-fast install -y pigz pbzip2 plzip pixz \
 && apt-fast install -y gnupg2 curl

