FROM alpine:3.12.3
COPY start.sh nginx.conf telegraf.conf supervisord.conf ./
RUN apk update && apk upgrade && \
    apk add nginx openssl supervisor && \
    apk add telegraf --repository http://dl-2.alpinelinux.org/alpine/edge/community && \
    mkdir -p /etc/telegraf && \
	mv telegraf.conf /etc/telegraf/ && \
	mv supervisord.conf /etc/supervisord.conf && \
	mkdir -p  /run/nginx && \
	mv nginx.conf /etc/nginx/conf.d/default.conf && \
	chmod +x /start.sh && \
	openssl req -x509 -nodes -new -newkey rsa:2048 \
    -keyout /etc/ssl/private/key.key -out /etc/ssl/certs/cert.crt \
    -subj "/C=RU/ST=TATARSTAN/L=Kazan/O=no/OU=no/CN=localhost"
EXPOSE 443 80
CMD ./start.sh