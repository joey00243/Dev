FROM ubuntu:latest
LABEL "Author"="JoMab"
LABEL "Project"="Soft"
ENV DEBIAN_FRONTEND=noninteractive
RUN apt update && apt install git -y
RUN apt install apache2 -y
CMD ["/usr/sbin/apache2ctl", "-D", "FOREGROUND"]
EXPOSE 80
WORKDIR /var/www/html
VOLUME /var/log/apache2
ADD soft.tar.gz /var/www/html