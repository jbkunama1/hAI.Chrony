#!/bin/sh
set -e

UID_C=$(id -u _chrony 2>/dev/null || id -u chrony)
GID_C=$(id -g _chrony 2>/dev/null || id -g chrony)

mkdir -p /run/chrony /var/lib/chrony
chown -R "$UID_C:$GID_C" /run/chrony /var/lib/chrony
chmod 700 /run/chrony /var/lib/chrony
rm -f /run/chrony/chronyd.pid

exec chronyd -d -f /etc/chrony.conf
