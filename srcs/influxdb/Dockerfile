FROM alpine:3.12.3
COPY start.sh supervisord.conf telegraf.conf ./
RUN apk update && apk upgrade && \
    apk add supervisor && \
    apk add influxdb telegraf --repository http://dl-2.alpinelinux.org/alpine/edge/community && \
    mkdir -p /etc/telegraf && \
	mv telegraf.conf /etc/telegraf/ && \
    mv supervisord.conf /etc/supervisord.conf && \
    chmod +x /start.sh
EXPOSE 8086
CMD ./start.sh