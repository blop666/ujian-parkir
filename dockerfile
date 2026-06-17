FROM php:8.2-fpm

RUN apt update && apt upgrade -y
RUN apt install -y libzip-dev zip unzip git mariadb-client
RUN docker-php-ext-install pdo pdo_mysql zip

WORKDIR /var/www/html

COPY . .

COPY --from=composer /usr/bin/composer /usr/bin/composer

CMD [ "php-fpm" ]