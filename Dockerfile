FROM php:8.2-alpine@sha256:671c309315113b73eba316bb175e130f376d3ba5e1a930794909ef5a1cb10fbc

ENV REVIEWDOG_VERSION=v0.14.1

RUN apk --no-cache add git
RUN wget -O - -q https://raw.githubusercontent.com/reviewdog/reviewdog/master/install.sh| sh -s -- -b /usr/local/bin/
RUN wget -c https://github.com/phpstan/phpstan/releases/latest/download/phpstan.phar && mv phpstan.phar /usr/local/bin

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
