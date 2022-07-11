FROM node:14-alpine

ARG deploy_env='dev'

ENV TZ=America/Sao_Paulo
ENV LANG pt_BR.UTF-8
ENV LANGUAGE pt_BR.UTF-8
ARG deploy_env
ENV DEPLOY_ENV ${deploy_env}

RUN mkdir -p /src && chown -R node:node /src
RUN apk add --update-cache bash sudo
RUN echo 'node ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers
RUN apk update && apk add tzdata
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

WORKDIR /src

COPY --chown=node:node . .
COPY --chown=node:node package.json .

USER node

RUN yarn

EXPOSE 3000

CMD ["npm", "run", "prod"]
