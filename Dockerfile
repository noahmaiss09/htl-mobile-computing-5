FROM node:12 AS build

COPY . /app/
WORKDIR /app
RUN npm install \
    && npm run build

FROM nginx:alpine
COPY --from=build /app/dist /usr/share/nginx/html
