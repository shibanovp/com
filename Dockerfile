FROM selenium/standalone-chrome:3.141.59
USER root
RUN curl -sL https://deb.nodesource.com/setup_13.x | bash -
RUN apt install -y nodejs python build-essential
RUN chown -R seluser /usr/lib/node_modules /usr/bin /srv
USER seluser
WORKDIR /srv
COPY package*.json ./
RUN npm i -g @angular/cli@$(node -p "require('./package-lock.json').dependencies['@angular/cli'].version")
RUN npm ci
COPY . .
