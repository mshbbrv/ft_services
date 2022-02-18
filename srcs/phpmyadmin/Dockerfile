FROM alpine:3.12.3
COPY start.sh nginx.conf config.inc.php supervisord.conf telegraf.conf ./
RUN apk update && apk upgrade && \
    apk add nginx supervisor && \
    apk add php7 php7-fpm php7-opcache php7-ctype && \
    apk add php7-gd php7-mysqli php7-zlib php7-curl php7-mbstring php7-json php7-session && \
    apk add telegraf --repository http://dl-2.alpinelinux.org/alpine/edge/community && \
    mkdir -p /etc/telegraf && \
	mv telegraf.conf /etc/telegraf/ && \
	mv supervisord.conf /etc/supervisord.conf && \
    mkdir -p  /var/run/nginx && \
    mkdir -p /var/run/phpmyadmin && \
    mv nginx.conf /etc/nginx/conf.d/default.conf && \
    chmod +x /start.sh
ADD https://files.phpmyadmin.net/phpMyAdmin/5.0.4/phpMyAdmin-5.0.4-english.tar.gz .
RUN tar xvf phpMyAdmin-5.0.4-english.tar.gz && \
    mv phpMyAdmin-5.0.4-english /var/www/phpmyadmin && \
    mv config.inc.php /var/www/phpmyadmin/ && \
    rm -rf phpMyAdmin-5.0.4-english.tar.gz
EXPOSE 5000
CMD ./start.sh