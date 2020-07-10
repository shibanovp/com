FROM selenium/standalone-chrome:4.0.0-alpha-6-20200609 as test
USER root
RUN curl -sL https://deb.nodesource.com/setup_14.x | bash -
RUN apt install -y git nodejs python build-essential
RUN chown -R seluser:seluser /usr/lib/node_modules /usr/bin /srv
USER seluser
WORKDIR /srv
COPY --chown=seluser:seluser package*.json ./
RUN npm ci
COPY --chown=seluser:seluser . .

FROM test as build
RUN npx ng build --prod

FROM nginx:1.19.1-alpine
COPY --from=build /srv/dist/com /usr/share/nginx/html
