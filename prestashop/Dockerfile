FROM prestashop/prestashop:1.7-7.3-fpm
ENV PHP_MEMORY_LIMIT=2048M

COPY   ./html/  /var/www/html/import


# Use development php.ini
RUN cp "$PHP_INI_DIR/php.ini-development" "$PHP_INI_DIR/php.ini"

# XDebug extension
RUN pecl install xdebug \
    && docker-php-ext-enable xdebug

# Enable XDebug
#RUN echo '[XDebug] \n\
#    xdebug.remote_enable=1 \n\
#    xdebug.remote_host=host.docker.internal' >> /usr/local/etc/php/php.ini

COPY --from=composer:latest /usr/bin/composer /usr/local/bin/composer
RUN apt-get update && apt-get install -y git && git clone https://github.com/electrocom/ec_xmlfeed.git /tmp/data-ps/prestashop/modules/ec_xmlfeed


