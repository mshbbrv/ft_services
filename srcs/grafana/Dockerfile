FROM alpine:3.12.3
COPY start.sh supervisord.conf telegraf.conf ./
COPY grafana.db /usr/share/grafana/data/grafana.db
RUN apk update && apk upgrade && \
    apk add supervisor && \
    apk add telegraf grafana --repository http://dl-2.alpinelinux.org/alpine/edge/community && \
    mkdir -p /etc/telegraf && \
	mv telegraf.conf /etc/telegraf/ && \
    mv supervisord.conf /etc/supervisord.conf && \
    chmod +x /start.sh
EXPOSE 3000
CMD ./start.sh