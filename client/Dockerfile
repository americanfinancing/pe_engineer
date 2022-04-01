FROM node:16
ENV NPM_CONFIG_PREFIX=/home/node/.npm-global
ENV PATH=$PATH:/home/node/.npm-global/bin
RUN mkdir -p /opt/app
COPY . /opt/app
RUN chown -R node:node /opt/app
WORKDIR /opt/app

USER node

RUN yarn global add @ionic/cli @ionic/lab && yarn
LABEL "com.docker.compose.project"="realtor-portal"
