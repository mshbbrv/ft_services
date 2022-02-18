FROM alpine:3.12.3
COPY start.sh supervisord.conf telegraf.conf vsftpd.conf file.txt ./
RUN apk update && apk upgrade && \
    apk add supervisor vsftpd openssl && \
    mv file.txt /home/ && \
    mv supervisord.conf /etc/supervisord.conf && \
    mv vsftpd.conf /etc/vsftpd/vsftpd.conf && \
    apk add telegraf --repository http://dl-2.alpinelinux.org/alpine/edge/community && \
    mkdir -p /etc/telegraf && \
	mv telegraf.conf /etc/telegraf/ && \
	openssl req -x509 -nodes -new -newkey rsa:2048 \
    -keyout /etc/ssl/private/key.key -out /etc/ssl/certs/cert.crt \
    -subj "/C=RU/ST=TATARSTAN/L=Kazan/O=no/OU=no/CN=localhost" && \
    chmod +x /start.sh && \
    echo "root:root" | chpasswd
EXPOSE 21 20 10000
CMD ./start.sh