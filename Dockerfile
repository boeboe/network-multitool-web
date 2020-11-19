FROM praqma/network-multitool:latest

RUN apk --update add --no-cache coreutils apache2 php7-apache2 php-json sudo tcptraceroute tree httpie arpwatch nload tcpflow nethogs iftop vim nano \
 && curl -LO "https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kubectl" \
 && sudo mv ./kubectl /usr/local/bin/kubectl && chmod +x /usr/local/bin/kubectl \
 && curl -sL https://istio.io/downloadIstioctl | sh - && mv $HOME/.istioctl/bin/istioctl /usr/local/bin && rm -rf $HOME/.istioctl \
 && curl https://raw.githubusercontent.com/helm/helm/master/scripts/get-helm-3 | bash \
 && addgroup apache root && echo "apache ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers \
 && sed -i 's/index.html/shell.php/g' /etc/apache2/httpd.conf

ENV LANG en_US.utf8
ENV APACHE_RUN_DIR /var/run/apache2
ENV APACHE_RUN_USER root
ENV APACHE_RUN_GROUP root
ENV APACHE_PID_FILE /var/run/apache2/apache2.pid
ENV APACHE_LOG_DIR /var/log/apache2

COPY shell.php /var/www/localhost/htdocs/shell.php

EXPOSE 80

CMD ["/usr/sbin/httpd", "-DFOREGROUND"]
