FROM php:8.1-apache

# Install dependency PHP
RUN apt-get update && apt-get install -y \
    libicu-dev libpng-dev libxml2-dev libzip-dev unzip git \
    && docker-php-ext-install intl gd mysqli pdo pdo_mysql xml zip \
    && docker-php-ext-enable intl gd mysqli pdo pdo_mysql xml zip

# Enable Apache rewrite
RUN a2enmod rewrite

# Set permission untuk OJS
WORKDIR /var/www/html
RUN chown -R www-data:www-data /var/www/html
