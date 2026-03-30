# STAGE 0: test + dependencies
FROM node:24 AS base

WORKDIR /usr/src/app
COPY . .

RUN npm ci

# STAGE 1: test
FROM base AS test-stage

RUN npm test

# STAGE 2: build the frontend
FROM base AS build-stage

ARG VITE_BACKEND_URL=/api
ENV VITE_BACKEND_URL=$VITE_BACKEND_URL

RUN npm run build

# STAGE 3: prod image (Nginx)
FROM nginx:1.29-alpine

# Copy only the finished dist from the first stage
COPY --from=build-stage /usr/src/app/dist /usr/share/nginx/html 

# Nginx default port 80
EXPOSE 80

# Default CMD in Nginx already exists


# without ENV and .env
# docker build \
#   --build-arg VITE_BACKEND_URL=http://host.docker.internal:3001 \
#   -t todo-frontend .

# docker run -d -p 8000:80 todo-frontend

# view - http://localhost:8000/


# testing
# docker build --target test-stage -t node-docker-image-test .
# docker run --rm node-docker-image-test
# docker run node-docker-image-test npm test


# in more detail add flag --progress=plain
