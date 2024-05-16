
FROM node

ENV PORT 19006
EXPOSE 19006 19001 19002

ENV NPM_CONFIG_PREFIX=/home/node/.npm-global
ENV PATH /home/node/.npm-global/bin:$PATH
RUN npm i --unsafe-perm --allow-root -g npm@latest expo-cli@latest

WORKDIR /opt
ENV PATH /opt/.bin:$PATH
COPY ./package.json ./package-lock.json ./
RUN npm install

WORKDIR /opt/app
COPY . .

ENTRYPOINT ["npm", "run"]
CMD ["web"]