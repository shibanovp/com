FROM selenium/standalone-chrome:3.141.59 as test
USER root
RUN curl -sL https://deb.nodesource.com/setup_13.x | bash -
RUN apt install -y git nodejs python build-essential
RUN chown -R seluser:seluser /usr/lib/node_modules /usr/bin /srv
USER seluser
WORKDIR /srv
COPY --chown=seluser:seluser package*.json ./
RUN npm i -g @angular/cli@$(node -p "require('./package-lock.json').dependencies['@angular/cli'].version")
RUN npm ci
COPY --chown=seluser:seluser . .

FROM test as build
RUN ng build --prod

FROM nginx:1.17.10-alpine
COPY --from=build /srv/dist/com /usr/share/nginx/html
