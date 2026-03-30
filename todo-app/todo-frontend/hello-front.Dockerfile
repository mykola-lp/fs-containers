FROM node:24

WORKDIR /usr/src/app

COPY . .

RUN npm ci
RUN npm run build

RUN npm install -g serve
CMD ["serve", "-n", "dist"]

# docker build -f hello-front.Dockerfile -t hello-front .

# - only on http://172.17.0.2:3000
# docker run -it hello-front bash  AND  serve -n dist
# OR

# - and http://localhost:5001
# docker run -it -p 5001:3000 hello-front 

# docker start -ai <container_id>