FROM php:8.2-fpm

WORKDIR /var/www

RUN apt-get update
RUN apt-get install -y openssl zip unzip git curl
RUN apt-get install -y libzip-dev libonig-dev libicu-dev
RUN apt-get install -y autoconf pkg-config libssl-dev


RUN docker-php-ext-install bcmath mbstring intl opcache

RUN docker-php-ext-install pdo pdo_mysql mysqli

RUN docker-php-ext-install sockets

RUN pecl install mongodb && docker-php-ext-enable mongodb
#RUN echo "extension=mongodb.so" >> /usr/local/etc/php/conf.d/mongodb.ini

#RUN pecl install -o -f redis \
#&&  rm -rf /tmp/pear \
#&&  echo "extension=redis.so" > /usr/local/etc/php/conf.d/redis.ini
#RUN echo "extension=mongodb.so" >> /usr/local/etc/php/conf.d/mongodb.ini

#RUN apt-get clean && rm -rf /var/lib/apt/lists/*

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

#RUN groupadd -g 1000 www
#RUN useradd -u 1000 -ms /bin/bash -g www www

COPY ./app /var/www
#COPY --chown=www:www ./app /var/www
#COPY ./app/.env.staging /var/www/.env

USER root

RUN chmod -R 777 storage/
#RUN chmod -R 777 bootstrap/cache

COPY ./supervisord /etc/supervisor/conf.d

EXPOSE 9000
CMD ["php-fpm"]
