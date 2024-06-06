####################
# stage1: build
####################
FROM node:20.11.0-alpine as build
WORKDIR '/app'
COPY . .
RUN yarn
RUN yarn build

####################
# stage2: production 
####################
FROM nginx:1.27.0-alpine as prod
COPY --from=build /app/build /usr/share/nginx/html
CMD ["nginx", "-g", "daemon off;"]
