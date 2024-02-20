FROM ubuntu
FROM node:17

WORKDIR /usr/src/app

ENV DEBIAN_FRONTEND noninteractive

RUN echo "deb http://security.debian.org/debian-security bullseye-security main contrib non-free" > /etc/apt/sources.list

RUN apt-get update && apt-get -y upgrade && \
    apt-get -y install gcc && \
    rm -rf /var/lib/apt/lists/* && \
    apt-get -y install python3


COPY package*.json ./

RUN npm install


COPY . .

EXPOSE 8080
CMD ["npm","run","start"]
