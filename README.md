# docker-php-supervisord

Supervisord (for running job workers) with the latest version of PHP 7

Please note that the default behavior expects a Laravel app to be mounted within /var/www. You can change this by using a different command then the default command as described below.

## Tags
- `latest`  Latest production release (8.0.x).
- `8.0`    Latest 8.0.x release.
- `7.4`    Latest 7.4.x release.
- `7.3`    Latest 7.3.x release.

## Options:
* COMMAND, default setting when not set is: php /var/www/apps/laravel/artisan queue:work --sleep=3 --tries=3 --daemon
* PROCESSES, default setting when not set is 4

## Usage
Quick run:
```sh
docker run -d \
  --name taskrunner \
  --mount type=bind,source="$(pwd)"/www,target=/var/www \
  rhessing/php-supervisord
```


Different amount of processes:
```sh
docker run -d \
  --name taskrunner \
  -e PROCESSES=8 \
  --mount type=bind,source="$(pwd)"/www,target=/var/www \
  rhessing/php-supervisord
```


Different command:
```sh
docker run -d \
  --name taskrunner \
  -e COMMAND="php /var/www/app/bin/console messenger:consume async --time-limit=3600"
  --mount type=bind,source="$(pwd)"/app,target=/var/www \
  rhessing/php-supervisord
```


Different command and amount of processes:
```sh
docker run -d \
  --name taskrunner \
  -e PROCESSES=1 \
  -e COMMAND="php /var/www/app/bin/console messenger:consume async --time-limit=3600"
  --mount type=bind,source="$(pwd)"/app,target=/var/www \
  rhessing/php-supervisord
```


If you want, you can use this image to debug your PHP code:
```sh
docker run -it \
  --rm \
  --name taskrunner \
  --mount type=bind,source="$(pwd)"/app,target=/var/www \
  rhessing/php-supervisord /bin/sh
```


Uses: latest version of PHP 7, (php:7-cli-alpine3.12)

GitHub: https://github.com/rhessing/docker-php-supervisord

Mods:
- bcmath
- bz2
- Core
- ctype
- curl
- date
- dom
- exif
- fileinfo
- filter
- ftp
- gd
- gettext
- gmp
- hash
- iconv
- intl
- json
- libxml
- mbstring
- mcrypt
- mysqli
- mysqlnd
- openssl
- pcre
- PDO
- pdo_sqlite
- Phar
- posix
- pspell
- readline
- redis
- Reflection
- session
- shmop
- SimpleXML
- sodium
- SPL
- sqlite3
- standard
- tidy
- tokenizer
- xml
- xmlreader
- xmlwriter
- zip
- zlib
