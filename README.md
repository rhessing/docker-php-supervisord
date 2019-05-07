# docker-php-supervisord
repo for supervisord used by docker


Worker

Uses:
Latest php 7.3
Mods:
 - mysqlnd
 - opcache
 - pdo
 - xml
 - apcu_bc
 - apcu
 - bcmath
 - bz2
 - calendar
 - ctype
 - curl
 - dba
 - dom
 - enchant
 - exif
 - fileinfo
 - ftp
 - gd
 - gettext
 - gmp
 - iconv
 - imap
 - interbase
 - intl
 - json
 - mbstring
 - mcrypt
 - mysqli
 - odbc
 - pcntl
 - pdo_firebird
 - pdo_mysql
 - pdo_odbc
 - pdo_sqlite
 - phar
 - posix
 - pspell
 - readline
 - shmop
 - simplexml
 - snmp
 - soap
 - sockets
 - sqlite3
 - sysvmsg
 - sysvsem
 - sysvshm
 - tidy
 - tokenizer
 - wddx
 - xmlreader
 - xmlrpc
 - xmlwriter
 - xsl
 - zip

Supervisord (for running job workers)

Options:
* COMMAND, default setting when not set is: php /var/www/apps/laravel/artisan queue:work --sleep=3 --tries=3 --daemon
* PROCESSES, default setting when not set is 4
* DEBUG, default setting when not set is false.

Debugging is handy for development purposes or if you need to debug your queue commands. Supervisord will not be started when debug is enabled giving you the option to manually run PHP scripts in the container.
