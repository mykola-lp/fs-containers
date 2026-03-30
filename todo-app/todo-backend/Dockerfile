FROM node:22-bullseye-slim

RUN apt-get update && apt-get install -y --no-install-recommends dumb-init

WORKDIR /usr/src/app

COPY package*.json ./
RUN npm ci --omit=dev

COPY . .

ENV NODE_ENV=production

USER node

EXPOSE 3001

ENTRYPOINT ["dumb-init", "--"]
CMD ["npm", "start"]