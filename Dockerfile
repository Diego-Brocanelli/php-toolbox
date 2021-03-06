FROM php:7.0-cli

MAINTAINER Davi Marcondes Moreira <davi.marcondes.moreira@gmail.com>

LABEL org.label-schema.vcs-url="https://github.com/devdrops/php-toolbox"

RUN curl --silent https://getcomposer.org/installer | php > /dev/null 2>&1 && \
    mv ./composer.phar /usr/local/bin/composer > /dev/null 2>&1

RUN apt-get update > /dev/null 2>&1
RUN apt-get -y install \
    vim \
    curl \
    git \
    zip \
    unzip > /dev/null 2>&1

RUN composer global require \
    phpunit/phpunit \
    squizlabs/php_codesniffer \
    fabpot/php-cs-fixer \
    phpmd/phpmd > /dev/null 2>&1

RUN ln -s /root/.composer/vendor/bin/* /usr/local/bin/ > /dev/null 2>&1
