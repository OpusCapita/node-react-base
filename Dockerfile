FROM node:6-alpine
MAINTAINER gr4per

ENV modulesPath /var/tmp/base/node_modules

RUN mkdir -p ${modulesPath}

# Set the working directory for any RUN, CMD, ENTRYPOINT, COPY and ADD instructions that follow,
# (creates it if does not exist).

WORKDIR /var/tmp/base/

COPY package.json .
COPY yarn.lock .

# Setting NODE_ENV is necessary for "npm install" below.
ENV NODE_ENV=development
RUN yarn
RUN chown -Rf node:node ${modulesPath}
