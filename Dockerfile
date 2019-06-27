FROM node:alpine as builder
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

#/app/build -->this is the final folder we needed

FROM nginx
COPY --from=builder /app/build /usr/share/nginx/html
#No need to write something to run nginx. When we start nginx container, it automatically take care of it.