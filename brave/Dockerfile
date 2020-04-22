FROM my-ubuntu:latest

RUN curl -s https://brave-browser-apt-release.s3.brave.com/brave-core.asc | apt-key --keyring /etc/apt/trusted.gpg.d/brave-browser-release.gpg add - \
 && echo "deb [arch=amd64] https://brave-browser-apt-release.s3.brave.com/ stable main" | tee /etc/apt/sources.list.d/brave-browser-release.list \
 && apt-fast update \
 && apt-fast install -y brave-browser

RUN apt-fast purge --autoremove -y apt-utils apt-transport-https software-properties-common apt-fast pigz pbzip2 plzip gnupg2 curl \
 && rm -rf /var/lib/apt/lists/*

RUN adduser docker-user
USER docker-user
ENTRYPOINT ["brave-browser"]

