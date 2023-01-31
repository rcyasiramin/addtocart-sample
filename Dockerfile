# stage 1

FROM node:16.17.0-alpine AS builder
WORKDIR /app
COPY . .
RUN npm install
RUN npm install -g @angular/cli@11.0.5
RUN ng build --configuration
#RUN npm install && npm run build --configuration=dev --base-href=/rc-teaf/

# stage 2


FROM nginx:1.17.5
COPY default.conf.template /etc/nginx/conf.d/default.conf.template
COPY nginx.conf /etc/nginx/nginx.conf
COPY --from=builder  /app/dist/my-first-app /usr/share/nginx/html 
CMD /bin/bash -c "envsubst '\$PORT' < /etc/nginx/conf.d/default.conf.template > /etc/nginx/conf.d/default.conf" && nginx -g 'daemon off;'
