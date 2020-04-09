FROM node:latest
RUN apt-get update && apt-get install -y nginx
WORKDIR /app
COPY . /app/
EXPOSE 80
RUN  npm i -g yarn --registry=https://registry.npm.taobao.org && \
\ yarn config set registry https://registry.npm.taobao.org -g && \
\ yarn config set disturl https://npm.taobao.org/dist -g && \
\ yarn config set electron_mirror https://npm.taobao.org/mirrors/electron/ -g && \
\ yarn config set sass_binary_site https://npm.taobao.org/mirrors/node-sass/ -g && \
\ yarn config set phantomjs_cdnurl https://npm.taobao.org/mirrors/phantomjs/ -g && \
\ yarn config set chromedriver_cdnurl https://cdn.npm.taobao.org/dist/chromedriver -g && \
\ yarn config set operadriver_cdnurl https://cdn.npm.taobao.org/dist/operadriver -g && \
\ yarn config set fse_binary_host_mirror https://npm.taobao.org/mirrors/fsevents -g && \
\ yarn config set fse_binary_host_mirror https://npm.taobao.org/mirrors/pngquant-bin/ -g && \
\ yarn && yarn run build  && cp -r dist/* /var/www/html && cp custom.conf /etc/nginx/conf.d/ && rm -rf /app
CMD ["nginx","-g","daemon off;"]
