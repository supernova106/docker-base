FROM php:7.1-fpm-alpine
LABEL maintainer="Binh Nguyen" \
      description="Customized PHP docker image"

ARG INSTALL_REDIS=true
ARG INSTALL_GNUPG=true
ARG INSTALL_XDEBUG=false
ARG INSTALL_PGSQL=false

# Install gd extension
RUN echo "http://nl.alpinelinux.org/alpine/edge/testing" >> /etc/apk/repositories \
    && echo "http://nl.alpinelinux.org/alpine/edge/community" >> /etc/apk/repositories \
    && apk update \
    && apk add --no-cache \
    php7-pdo_pgsql \
    php7-opcache \
    freetype \
    gosu \
    libjpeg-turbo \
    libmcrypt \
    libpng \
    shadow \
    libmemcached \
    && apk add --no-cache --virtual .build-deps \
    postgresql-dev \
    autoconf \
    freetype-dev \
    g++ \
    libjpeg-turbo-dev \
    libmcrypt-dev \
    libpng-dev \
    make \
    zlib-dev \
    git \
    libmemcached-dev \
    cyrus-sasl-dev \
    && docker-php-source extract \
    ## memcache
    && git clone https://github.com/websupport-sk/pecl-memcache.git /usr/src/php/ext/memcache/ \
    && docker-php-ext-configure memcache \
    && docker-php-ext-install memcache \
    && rm -rf /usr/src/php/ext/memcache \
    ## memcached
    && pecl install memcached \
    && docker-php-ext-enable memcached \
    && docker-php-ext-install -j$(getconf _NPROCESSORS_ONLN) \
    iconv \
    mcrypt \
    && docker-php-ext-install \
    mysqli \
    pdo_mysql \
    zip \
    && docker-php-ext-configure gd \
    --enable-gd-native-ttf \
    --with-jpeg-dir=/usr/lib/x86_64-linux-gnu \
    --with-png-dir=/usr/lib/x86_64-linux-gnu \
    --with-freetype-dir=/usr/lib/x86_64-linux-gnu \
    && docker-php-ext-install -j$(getconf _NPROCESSORS_ONLN) gd \
    ## xdebug
    && if [ ${INSTALL_XDEBUG} = true ]; then \
    pecl install xdebug \
    && docker-php-ext-enable xdebug \
    ;fi \
    ## redis
    && if [ ${INSTALL_REDIS} = true ]; then \
    printf "\n" | pecl install -o -f redis \
    &&  rm -rf /tmp/pear \
    && docker-php-ext-enable redis \
    ;fi \
    ## gnupg
    && if [ ${INSTALL_GNUPG} = true ]; then \
    apk add --no-cache \
    gnupg \
    gpgme-dev \
    && pecl install gnupg \
    && docker-php-ext-enable gnupg \
    ;fi \
    ## pgsql
    && if [ ${INSTALL_PGSQL} = true ]; then \
    docker-php-ext-install pgsql \
    ;fi \
    ## pdo_pgsql
    && docker-php-ext-install pdo pdo_pgsql \
    ## opcache
    && docker-php-ext-enable \
    opcache \
    pdo_pgsql \
    && docker-php-source delete \
    && apk del --force .build-deps

# Install the ldap extension
RUN apk add --no-cache --virtual .persistent-deps \
    libldap
RUN apk add --no-cache --virtual .build-deps $PHPIZE_DEPS icu-dev openldap-dev \
    && docker-php-ext-install ldap \
    && apk del .build-deps \
    && rm -rf /tmp/* /var/cache/apk/*

RUN usermod -u 1000 www-data 

# Support usc user
RUN addgroup -g 1024 -S usc
RUN adduser -u 1024 -S -D -G usc usc

WORKDIR /var/www

EXPOSE 9000

CMD ["php-fpm"]
