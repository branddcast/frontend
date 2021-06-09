#------------------ DOCKER CONFIGURATION 1 ------------------ 
# FROM node:10-slim as build-step

# USER root
# RUN npm install -g http-server

# USER node
# RUN mkdir -p /app
# WORKDIR /app
# COPY package.json /app

# COPY --chown=node . .

# ENV NODE_OPTIONS=--max-old-space-size=500
# RUN echo "NodeJS $(node -v) memory config:" && node -p "v8.getHeapStatistics()"
# RUN npm i
# COPY . /app
# RUN npm run build --prod
# #RUN npm run build && mv dist/frontend /home/node/app && rm -fr /tmp/app

# COPY --from=build-step /app/dist/frontend /home/node/app

# WORKDIR /home/node/app

# EXPOSE 8080

# CMD [ "http-server", "dist/frontend" ]


#------------------ DOCKER CONFIGURATION 2 ------------------ 
#Primera Etapa
FROM node:10-alpine as build-step

RUN mkdir -p /app

WORKDIR /app

COPY package.json /app

RUN npm config set strict-ssl false

RUN npm config set registry http://registry.npmjs.org/

RUN npm install

COPY . /app

RUN npm run build --prod

#Segunda Etapa
FROM nginx:1.17.1-alpine
USER root
RUN chmod -R 755 /etc/nginx
RUN chmod -R 755 /var/cache/nginx
RUN chmod -R 755 /etc/nginx/nginx.conf
COPY --from=build-step /app/dist/frontend /usr/share/nginx/html