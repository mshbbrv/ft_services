FROM alpine:3.12.3
RUN apk update && apk upgrade
COPY start.sh nginx.conf wp-config.php supervisord.conf telegraf.conf ./
RUN apk add nginx supervisor php7 php7-fpm php7-opcache php7-ctype && \
    apk add php7-gd php7-mysqli php7-zlib php7-curl php7-mbstring php7-json php7-session && \
    apk add telegraf --repository http://dl-2.alpinelinux.org/alpine/edge/community && \
    mkdir -p /etc/telegraf && \
    mv telegraf.conf /etc/telegraf/ && \
    mv supervisord.conf /etc/supervisord.conf && \
    mv nginx.conf /etc/nginx/conf.d/default.conf && \
    mkdir -p  /var/run/nginx && \
    mkdir -p /var/run/phpmyadmin && \
    chmod +x /start.sh
ADD https://wordpress.org/latest.tar.gz .
RUN tar xzvf latest.tar.gz && \
    rm -rf latest.tar.gz && \
    mv wordpress/ /var/www/wordpress && \
    mv wp-config.php var/www/wordpress/wp-config.php
EXPOSE 5050
CMD ./start.sh