FROM php:7.4.15-apache

LABEL maintainer="irumdev <irum94@kakao.com>"

# Install APT Package
RUN apt-get update -y; \
    apt-get install -y vim tar zip unzip net-tools iputils-ping

# Install NodeJs
RUN apt update -y; \
    curl -fsSL https://deb.nodesource.com/setup_lts.x | bash -; \
    apt-get install -y nodejs;

# Install PHP Modules
RUN docker-php-ext-install mysqli; \
    docker-php-ext-install pdo_mysql; \
    docker-php-ext-enable mysqli; \
    docker-php-ext-enable pdo_mysql;

# Enable Apache modules
RUN a2enmod ssl; \
    a2enmod rewrite

# Install PHP Composer
WORKDIR "/bin"
RUN php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
RUN php composer-setup.php
RUN php -r "unlink('composer-setup.php');"