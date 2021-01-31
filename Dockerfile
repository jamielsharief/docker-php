#
# OriginPHP Framework
# Copyright 2018 - 2021 Jamiel Sharief.
#
# Licensed under The MIT License
# The above copyright notice and this permission notice shall be included in all copies or substantial
# portions of the Software.
#
# @copyright    Copyright (c) Jamiel Sharief
# @link         https://www.originphp.com
# @license      https://opensource.org/licenses/mit-license.php MIT License
#
FROM ubuntu:20.04
LABEL maintainer="Jamiel Sharief"
LABEL version="2.1.0"

# Setup Enviroment
ENV DATE_TIMEZONE UTC
ENV DEBIAN_FRONTEND=noninteractive

# Best Practice : Cache Busting - Prevent cache issues run as one command
# @link https://docs.docker.com/develop/develop-images/dockerfile_best-practices/

RUN apt-get update && apt-get install -y \
    curl \
    git \
    mysql-client \
    unzip \
    zip \
    libapache2-mod-php \
    php \
    php-apcu \
    php-cli \
    php-common \
    php-curl \
    php-imap \
    php-intl \
    php-json \
    php-mailparse \
    php-mbstring \
    php-mysql \
    php-opcache \
    php-pear \
    php-readline \
    php-soap \
    php-xml \
    php-zip \
    php-dev \
    postgresql-client \
    php-pgsql \
    php-memcached \
    sqlite3 \ 
    php-sqlite3 \
    php-redis \
    php-xdebug \
 && rm -rf /var/lib/apt/lists/*

# Install Composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer