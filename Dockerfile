FROM node:13.10.1-alpine
RUN apk add --no-cache python build-base
WORKDIR /srv
COPY package*.json ./
RUN npm i -g @angular/cli@$(node -p "require('./package-lock.json').dependencies['@angular/cli'].version")
RUN npm ci
COPY . .
