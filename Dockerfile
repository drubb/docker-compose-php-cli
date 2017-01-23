FROM php:7.0-alpine

RUN apk add --no-cache autoconf build-base git imagemagick imagemagick-dev libtool libmcrypt libmcrypt-dev libpng libpng-dev libssh2-dev zlib-dev libxml2-dev && \
    docker-php-ext-install bcmath gd mcrypt zip opcache pcntl pdo_mysql soap && \
    git clone https://github.com/Jan-E/uploadprogress && \
    cd uploadprogress && \
    pecl install package.xml imagick xdebug ssh2-1.0 && \
    docker-php-ext-enable imagick ssh2 uploadprogress xdebug && \
    apk del autoconf build-base git *-dev && \
    rm -rf /tmp/pear uploadprogress

CMD ["php", "-v"]
