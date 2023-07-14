#FROM node:20-alpine
#RUN apk update && apk add mysql-client mariadb-connector-c-dev

FROM node:20
RUN apt-get update && apt-get install default-mysql-client -y

WORKDIR /app
RUN echo 'alias db="yarn --silent dbmate"' >>~/.bashrc

ENV NODE_ENV=development
COPY package.json yarn.lock /app/
RUN yarn --silent install
