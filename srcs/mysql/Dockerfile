FROM alpine:3.12.3
COPY start.sh my.cnf thjonelldb.sql telegraf.conf supervisord.conf ./
RUN apk update && apk upgrade && \
    apk add mysql mysql-client openrc supervisor && \
    apk add telegraf --repository http://dl-2.alpinelinux.org/alpine/edge/community && \
    mkdir -p /etc/telegraf && \
	mv telegraf.conf /etc/telegraf/ && \
	mv supervisord.conf /etc/supervisord.conf && \
	mkdir -p /run/mysqld && \
	mv my.cnf /etc/mysql/my.cnf && \
	chmod 755 start.sh
EXPOSE 3306
CMD supervisord -c /etc/supervisord.conf