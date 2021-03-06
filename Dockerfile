#------------------ DOCKER CONFIGURATION 1 ------------------ 
# FROM node:10-slim as build-step

# USER root
# RUN npm install -g http-server

# USER node
# RUN mkdir -p /home/node/app /tmp/app
# WORKDIR /tmp/app

# COPY --chown=node . .

# ENV NODE_OPTIONS=--max-old-space-size=900
# RUN echo "NodeJS $(node -v) memory config:" && node -p "v8.getHeapStatistics()"
# RUN npm i

# RUN npm run build && mv dist/frontend /home/node/app && rm -fr /tmp/app
# #RUN npm run build && mv dist/frontend /home/node/app && rm -fr /tmp/app

# #COPY --from=build-step /app/dist/frontend /home/node/app

# WORKDIR /home/node/app

# EXPOSE 8080

# CMD [ "http-server", "dist/frontend" ]


#------------------ DOCKER CONFIGURATION 2 ------------------ 
#Primera Etapa
FROM node:slim as build-step

RUN mkdir -p /app

WORKDIR /app

COPY package.json /app

RUN npm install npm@7.17.0

#ENV NODE_OPTIONS=--max-old-space-size=900 

#RUN npm config set strict-ssl false

#RUN npm config set registry http://registry.npmjs.org/

RUN npm install

COPY . /app

RUN npm run build
#RUN cp -r ./dist/frontend/. /usr/share/nginx/html

#Segunda Etapa
#FROM nginxinc/nginx-unprivileged
FROM nginxinc/nginx-unprivileged

USER root

COPY --from=build-step /app/dist/frontend /usr/share/nginx/html

# RUN chgrp -R root /var/cache/nginx /var/run /var/log/nginx && \
#     chmod -R 770 /var/cache/nginx /var/run /var/log/nginx


#------------------ DOCKER CONFIGURATION 3 ------------------ 
# #Primera Etapa
# FROM quay.io/branddcast/nodejs as build-step

# RUN mkdir -p /app

# WORKDIR /app

# COPY package.json /app

# #ENV NODE_OPTIONS=--max-old-space-size=900 

# #RUN npm config set strict-ssl false

# #RUN npm config set registry http://registry.npmjs.org/

# RUN npm install

# COPY . /app

# RUN npm run build --prod
# #RUN cp -r ./dist/frontend/. /usr/share/nginx/html

# #Segunda Etapa
# #FROM nginxinc/nginx-unprivileged
# FROM quay.io/branddcast/nginx

# USER root

# COPY --from=build-step /app/dist/frontend /usr/share/nginx/html

# # RUN chgrp -R root /var/cache/nginx /var/run /var/log/nginx && \
# #     chmod -R 770 /var/cache/nginx /var/run /var/log/nginx