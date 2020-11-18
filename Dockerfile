FROM praqma/network-multitool:latest

RUN apk add --no-cache apache2 php7-apache2 php-json sudo tcptraceroute tree httpie arpwatch nload tcpflow nethogs iftop vim nano
RUN addgroup apache root && echo "apache ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers

ENV LANG en_US.utf8
ENV APACHE_RUN_DIR /var/run/apache2
ENV APACHE_RUN_USER root
ENV APACHE_RUN_GROUP root
ENV APACHE_PID_FILE /var/run/apache2/apache2.pid
ENV APACHE_LOG_DIR /var/log/apache2

COPY shell.php /var/www/localhost/htdocs/shell.php

EXPOSE 80

CMD ["/usr/sbin/httpd", "-DFOREGROUND"]
