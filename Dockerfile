FROM node:alpine


WORKDIR '/app'
COPY package.json .
RUN npm install terser@3.14.1 --save-dev
 

COPY . .
RUN npm run build

FROM nginx
COPY --from=0 /app/build /usr/share/nginx/html