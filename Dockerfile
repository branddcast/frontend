FROM node:10-slim

USER root
RUN npm install -g http-server

USER node
RUN mkdir -p /home/node/app /tmp/app
WORKDIR /tmp/app

COPY --chown=node . .

ENV NODE_OPTIONS=--max-old-space-size=500
RUN echo "NodeJS $(node -v) memory config:" && node -p "v8.getHeapStatistics()"
RUN npm i
RUN npm run build && mv dist /home/node/app && rm -fr /tmp/app

WORKDIR /home/node/app

EXPOSE 8080

CMD [ "http-server", "dist" ]

##Primera Etapa
# FROM node:10-alpine as build-step

# RUN mkdir -p /app

# WORKDIR /app

# COPY package.json /app

# RUN npm config set strict-ssl false

# RUN npm config set registry http://registry.npmjs.org/

# RUN npm install

# COPY . /app

# RUN npm run build --prod

# #Segunda Etapa
# FROM nginx:1.17.1-alpine
# 	#Si estas utilizando otra aplicacion cambia PokeApp por el nombre de tu app
# COPY --from=build-step /app/dist/frontend /usr/share/nginx/html