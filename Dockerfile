# build section 
FROM node:18-alpine as builder

WORKDIR /app
COPY package.json .
RUN npm install
COPY . .
CMD [ "npm", "run", "build" ]

# run section
FROM nginx
COPY --from=builder /app/build /usr/share/nginx/html
