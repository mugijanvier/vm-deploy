FROM node:alpine as build
WORKDIR /app
COPY . .
RUN npm install 
RUN npm run build 

FROM nginx:alpine 
COPY --from=build /app/dist/devops-ng /usr/share/nginx/html
EXPOSE 80