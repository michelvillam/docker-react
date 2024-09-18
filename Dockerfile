FROM node:16-alpine as builder

WORKDIR '/app'

COPY package.json .
RUN npm install

COPY . .

#RUN chown -R node /app/node_modules

#USER node

#CMD [ "npm", "run", "start" ]
RUN npm run build
#will generate /app/build -- all we need to run our app

FROM nginx
EXPOSE 80
COPY --from=builder /app/build /usr/share/nginx/html
