# stage 1
FROM node:16.17.0-alpine AS builder
WORKDIR /app
COPY . .
ENV ENVIRON=production
RUN npm install
RUN npm install -g @angular/cli@12.2.18
RUN ng build --aot --configuration=$ENVIRON
#RUN npm install && npm run build --configuration=production --base-href=/rc-teaf/



# stage 2


FROM nginx:alpine
COPY --from=builder /app/dist/io-example /usr/share/nginx/html
EXPOSE 80
EXPOSE 4300
