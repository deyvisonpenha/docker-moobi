#
# Ubuntu Dockerfile for Moobi
#
# https://github.com/
#

FROM ubuntu

MAINTAINER Moobi Developers

RUN apt-get update && apt-get install -y software-properties-common && add-apt-repository ppa:ondrej/php && apt-get update && apt-get install -y nginx && apt-get install -y vim && apt-get install net-tools && apt-get install -y curl && apt-get install -y zip unzip && apt-get install -y php7.1 php7.1-gd php7.1-xml php7.1-json php7.1-opcache php7.1-curl php7.1-redis php7.1-mysql php7.1-mbstring php7.1-mcrypt php7.1-zip php7.1-fpm && apt-get clean

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/bin --filename=composer

LABEL Description = 'Moobi System'

COPY nginx.conf /etc/nginx/nginx.conf

VOLUME /app

# Definindo o diretório app como nosso diretório de trabalho
WORKDIR /app

# Create these folders and change its permissions:
RUN mkdir /var/nginx/ && mkdir /var/nginx/client_body_temp && mkdir /var/nginx/proxy_temp && chown -R www-data:www-data /var/nginx/client_body_temp/ && chown -R www-data:www-data /var/nginx/proxy_temp/ && chmod -R 755 /app

#EXPOSE 8080:8080
