FROM nginx:alpine

RUN apk add --no-cache logrotate

COPY conf.d /etc/nginx/conf.d
COPY ssl /etc/nginx/ssl
COPY htpasswd /etc/nginx/htpasswd
COPY logrotate-nginx.conf /etc/logrotate.d/nginx
COPY crontab-root /etc/crontabs/root
COPY start-nginx.sh /usr/local/bin/start-nginx
RUN chmod +x /usr/local/bin/start-nginx

CMD ["start-nginx"]
