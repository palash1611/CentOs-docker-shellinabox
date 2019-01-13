#!/bin/bash

if [ -z "${USER}" ]
then
echo "Supervisor user is default (admin)"
else
sed -ri "s/admin/${USER}/g" /etc/supervisord.conf
fi


if [ -z "${PASSWORD}" ]
then
echo "Supervisor password is default (redhat)"
else
sed -ri "s/redhat/${PASSWORD}/g" /etc/supervisord.conf
fi

UI_DIR=/supervisor-ui
STATUS_FILE=`find /usr/lib | grep status.html`
SUPERVISOR_DIR=$(dirname "$STATUS_FILE")
/bin/cp -rf $UI_DIR/status.html $STATUS_FILE
sed -ri "s/\<9100\>/${SHELLINABOX_PORT}/g" $STATUS_FILE
sed -ri ':a;N;$!ba;s/\n/ /g' $STATUS_FILE
sed -ri 's|alt="Supervisor status" />|alt="Supervisor status" /><div><h2>Container hostname: '$HOSTNAME'</h2></div>|g' $STATUS_FILE

