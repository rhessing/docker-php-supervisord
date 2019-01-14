#!/bin/bash
set -e

# config file location
config_file="/etc/supervisord.conf"

# Set env controlled variables
IP=${IP:-0.0.0.0}
PORT=${PORT:-9001}
COMMAND=${COMMAND:-php /var/www/apps/laravel/artisan queue:work --sleep=3 --tries=3 --daemon}
PROCESSES=${PROCESSES:-4}

# Supervisord config file contents
cat << EOF > $config_file
[supervisord]
nodaemon=true
[supervisorctl]
[inet_http_server]
port = $IP:$PORT
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

echo "Supervisord configuration completed, starting supervisord"

/usr/bin/supervisord -n -c /etc/supervisord.conf