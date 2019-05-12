#!/bin/sh
set -e

# config file location
config_file="/etc/supervisord.conf"

# Set env controlled variables
COMMAND=${COMMAND:-php /var/www/apps/laravel/artisan queue:work --sleep=3 --tries=3 --daemon}
PROCESSES=${PROCESSES:-4}
DEBUG=${DEBUG:-false}

# Supervisord config file contents
cat << EOF > $config_file
[supervisord]
nodaemon=true
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
EOF

if [ ! $DEBUG ]
then
  echo "Supervisord configuration completed, starting supervisord"
  /usr/bin/supervisord -n -c /etc/supervisord.conf
else
  echo "Debug environment detected, not starting supervisord. Have fun debugging!"
fi
