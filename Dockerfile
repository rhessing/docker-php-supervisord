#
#--------------------------------------------------------------------------
# Image Setup
#--------------------------------------------------------------------------
#

FROM php:7.2.2-cli-alpine3.7

MAINTAINER R. Hessing

RUN apk --update add \
        freetype-dev \
        libjpeg-turbo-dev \
        libpng-dev \
        libmcrypt-dev \
        bzip2-dev \
        gettext-asprintf \
        libintl \
        libunistring \
        gettext-libs \
        libgomp \
        gettext \
        gettext-dev \
        gmp-dev \
        icu-dev \
        aspell-dev \
        tidyhtml-dev \
        supervisor \
        autoconf make g++ \
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

RUN pecl channel-update pecl.php.net && pecl install mcrypt-1.0.1 && docker-php-ext-enable mcrypt

RUN rm /var/cache/apk/* \
    && mkdir -p /var/www

#
#--------------------------------------------------------------------------
# Optional Supervisord Configuration
#--------------------------------------------------------------------------
#
# Modify the ./supervisor.conf file to match your App's requirements.
# Make sure you rebuild your container with every change.
#

COPY supervisord.conf /etc/supervisord.conf

ENTRYPOINT ["/usr/bin/supervisord", "-n", "-c",  "/etc/supervisord.conf"]

#
#--------------------------------------------------------------------------
# Optional Software's Installation
#--------------------------------------------------------------------------
#
# If you need to modify this image, feel free to do it right here.
#
    # -- Your awesome modifications go here -- #

#
#--------------------------------------------------------------------------
# Check PHP version
#--------------------------------------------------------------------------
#

RUN php -v | head -n 1 | grep -q "PHP 7.2."

#
#--------------------------------------------------------------------------
# Final Touch
#--------------------------------------------------------------------------
#

WORKDIR /etc/supervisor/conf.d/
