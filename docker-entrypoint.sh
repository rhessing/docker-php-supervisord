#!/bin/sh
set -e

# config file location
config_file="/etc/supervisord.conf"

# Set env controlled variables
COMMAND=${COMMAND:-php /var/www/apps/laravel/artisan queue:work --sleep=3 --tries=3 --daemon}
PROCESSES=${PROCESSES:-4}

# Supervisord config file contents
cat << EOF > $config_file
[supervisord]
nodaemon=true
user=root
[supervisorctl]
[rpcinterface:supervisor]
supervisor.rpcinterface_factory = supervisor.rpcinterface:make_main_rpcinterface

[program:laravel-worker]
process_name=%(program_name)s_%(process_num)02d
command=$COMMAND
autostart=false
autorestart=false
numprocs=$PROCESSES
redirect_stderr=true
stdout_logfile=/dev/stdout
stdout_logfile_maxbytes = 0
EOF

echo "Supervisord configuration completed, starting supervisord"
/usr/bin/supervisord -n -c /etc/supervisord.conf
