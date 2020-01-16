FROM composer:1.9 as builder

WORKDIR /app

ADD composer.json .
ADD composer.lock .

RUN composer install

ADD . .

FROM php:7.4-cli-alpine

WORKDIR /app

COPY --from=builder /app .

EXPOSE 8080

CMD ["php", "-S", "0.0.0.0:8080", "-t", "public"]