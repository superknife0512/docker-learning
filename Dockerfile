FROM node:alpine as theBuilder 
WORKDIR /home/app
COPY package.json .
RUN npm install
COPY . .
RUN npm run build 

FROM nginx
COPY --from=theBuilder /home/app/build /usr/share/nginx/html


