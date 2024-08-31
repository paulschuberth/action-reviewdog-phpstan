FROM php:8.3-alpine@sha256:d71287b85f521a68f6e5e5ada616ea3a52e15a49fc82cd59260af8d940916944

ENV REVIEWDOG_VERSION=v0.14.1

RUN apk --no-cache add git
RUN wget -O - -q https://raw.githubusercontent.com/reviewdog/reviewdog/master/install.sh| sh -s -- -b /usr/local/bin/
RUN wget -c https://github.com/phpstan/phpstan/releases/latest/download/phpstan.phar && mv phpstan.phar /usr/local/bin

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
