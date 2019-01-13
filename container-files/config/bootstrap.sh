#!/bin/bash

set -e
set -u

SUPERVISOR_PARAMS='-c /etc/supervisord.conf'

mkdir -p /data/conf /data/run /data/logs
chmod 711 /data/conf /data/run /data/logs

if [ "$(ls /config/init/)" ]; then
  for init in /config/init/*.sh; do
    . $init
  done
fi

if test -t 0; then
  supervisord $SUPERVISOR_PARAMS
  
  if [[ $@ ]]; then 
    eval $@
  else 
    export PS1='[\u@\h : \w]\$ '
    /bin/bash
  fi

else
  if [[ $@ ]]; then 
    eval $@
  fi
  supervisord -n $SUPERVISOR_PARAMS
fi
