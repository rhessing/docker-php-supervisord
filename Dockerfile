FROM php:7.1.29-cli-alpine3.9

MAINTAINER R. Hessing

RUN apk --update add \
        aspell-dev \
        autoconf \
        bzip2-dev \
        composer \
        coreutils \
        freetype-dev \
        g++ \
        gettext \
        gettext-asprintf \
        gettext-dev \
        gettext-libs \
        git \
        gmp-dev \
        libgomp \
        libintl \
        libjpeg-turbo-dev \
        libmcrypt-dev \
        libpng-dev \
        libunistring \
        make \
        icu-dev \
        supervisor \
        tidyhtml-dev \
        tini \
        unzip \
        zip \
    && docker-php-ext-install -j$(nproc) iconv \
    && docker-php-ext-configure gd --with-gd --with-freetype-dir=/usr/include/ --with-png-dir=/usr/include/ --with-jpeg-dir=/usr/include/ \
    && docker-php-ext-install -j$(nproc) gd \
    && docker-php-ext-configure bcmath --with-bcmath \
    && docker-php-ext-install -j$(nproc) bcmath \
    && docker-php-ext-configure bz2 --with-bz2 \
    && docker-php-ext-install -j$(nproc) bz2 \
    && docker-php-ext-configure exif --with-exif \
    && docker-php-ext-install -j$(nproc) exif \
    && docker-php-ext-configure gettext --with-gettext \
    && docker-php-ext-install -j$(nproc) gettext \
    && docker-php-ext-configure gmp --with-gmp \
    && docker-php-ext-install -j$(nproc) gmp \
    && docker-php-ext-configure intl --with-intl \
    && docker-php-ext-install -j$(nproc) intl \
    && docker-php-ext-configure mysqli --with-mysqli \
    && docker-php-ext-install -j$(nproc) mysqli \
    && docker-php-ext-configure pspell --with-pspell \
    && docker-php-ext-install -j$(nproc) pspell \
    && docker-php-ext-configure shmop --with-shmop \
    && docker-php-ext-install -j$(nproc) shmop \
    && docker-php-ext-configure tidy --with-tidy \
    && docker-php-ext-install -j$(nproc) tidy \
    && docker-php-ext-configure zip --with-zip \
    && docker-php-ext-install -j$(nproc) zip

RUN pecl channel-update pecl.php.net && pecl install mcrypt-1.0.1 && pecl install cassandra && docker-php-ext-enable mcrypt

RUN rm /var/cache/apk/* \
    && mkdir -p /var/www

CMD ["/usr/local/bin/docker-entrypoint.sh"]
