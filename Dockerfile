FROM node:14.15.2-alpine AS builder
WORKDIR /app
COPY . .
RUN npm install
RUN npm install -g @angular/cli@11.0.5
RUN ng build --configuration
#RUN npm install && npm run build --configuration=dev --base-href=/rc-teaf/