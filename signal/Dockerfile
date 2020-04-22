FROM ubuntu:xenial

RUN echo 'Acquire::HTTP::Proxy "http://lmaddox.chickenkiller.com:3142";' | cat > /etc/apt/apt.conf.d/01proxy \
 && apt update \
 && apt install -y apt-utils \
 && apt install -y apt-transport-https software-properties-common \
 && add-apt-repository ppa:apt-fast/stable \
 && apt update \
 && apt install -y apt-fast \
 && apt-fast full-upgrade -y

RUN apt-fast install -y gnupg2 curl \
 && curl -s https://updates.signal.org/desktop/apt/keys.asc | apt-key add - \
 && echo "deb [arch=amd64] https://updates.signal.org/desktop/apt xenial main" | tee -a /etc/apt/sources.list.d/signal-xenial.list \
 && apt-fast update \
 && apt-fast install -y signal-desktop

RUN apt-fast purge --autoremove -y apt-utils apt-transport-https software-properties-common apt-fast pigz pbzip2 plzip pixz gnupg2 curl \
 && rm -rf /var/lib/apt/lists/*

RUN adduser docker-user
USER docker-user
ENTRYPOINT ["signal-desktop"]

