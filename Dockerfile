FROM node:latest
RUN apt-get update && apt-get install -y nginx
WORKDIR /app
COPY . /app/
EXPOSE 80
RUN  npm i --registry=https://registry.npm.taobao.org && npm run build  && cp -r dist/* /var/www/html && cp custom.conf /etc/nginx/conf.d/ && rm -rf /app
CMD ["nginx","-g","daemon off;"]
