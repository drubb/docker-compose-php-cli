FROM php:7.0-alpine
RUN apk add --no-cache autoconf build-base git imagemagick imagemagick-dev libtool libmcrypt libmcrypt-dev libpng libpng-dev zlib-dev libxml2-dev && \
    docker-php-ext-install bcmath gd mcrypt zip opcache pcntl pdo_mysql soap && \
    git clone https://github.com/Jan-E/uploadprogress && \
    cd uploadprogress && \
    pecl install package.xml imagick xdebug && \
    docker-php-ext-enable imagick uploadprogress xdebug && \
    apk del autoconf build-base git *-dev && \
    rm -rf /tmp/pear uploadprogress

CMD ["php", "-v"]