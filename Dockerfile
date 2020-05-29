FROM node:latest
RUN apt-get update && apt-get install -y nginx
WORKDIR /app
COPY . /app/
EXPOSE 80
RUN yarn && yarn build  && cp -r dist/* /var/www/html && cp nginx.conf /etc/nginx/conf.d/ && rm -f /etc/nginx/sites-enabled/default && rm -rf /app
CMD ["nginx","-g","daemon off;"]
