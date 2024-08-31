FROM php:8.2-alpine@sha256:09ffc3f76403029a2426dfac2712acd96b17700a75c258561717d30e46df8096

ENV REVIEWDOG_VERSION=v0.14.1

RUN apk --no-cache add git
RUN wget -O - -q https://raw.githubusercontent.com/reviewdog/reviewdog/master/install.sh| sh -s -- -b /usr/local/bin/
RUN wget -c https://github.com/phpstan/phpstan/releases/latest/download/phpstan.phar && mv phpstan.phar /usr/local/bin

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
