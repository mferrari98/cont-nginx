FROM nginx:alpine

COPY conf.d /etc/nginx/conf.d
COPY ssl /etc/nginx/ssl
COPY htpasswd /etc/nginx/htpasswd
