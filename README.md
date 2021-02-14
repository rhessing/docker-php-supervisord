# docker-php-supervisord

Supervisord (for running job workers) with the latest version of PHP 7

Please note that the default behavior expects a Laravel app to be mounted within /var/www. You can change this by using a different command then the default command as described below.

Options:
* COMMAND, default setting when not set is: php /var/www/apps/laravel/artisan queue:work --sleep=3 --tries=3 --daemon
* PROCESSES, default setting when not set is 4
* DEBUG, default setting when not set is false.

Debugging is handy for development purposes or if you need to debug your queue commands. Supervisord will not be started when debug is enabled giving you the option to manually run PHP scripts in the container.

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


