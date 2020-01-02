FROM ubuntu
MAINTAINER Ritik
RUN apt-get update \
    && apt-get install curl -yq && apt-get upgrade -y \
    && curl -sL https://deb.nodesource.com/setup_8.x | bash - \
    && apt-get install -y nodejs \
    && npm install -g react-tools
COPY . /ritik/file/
WORKDIR	/ritik/file/notejam
RUN npm install
ENTRYPOINT node db.js && DEBUG=* ./bin/www
