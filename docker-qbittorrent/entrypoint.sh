#!/bin/sh -e

# Default configuration file
if [ ! -d /qBittorrent ]
then
	mkdir /qBittorrent
fi
if [ ! -d /qBittorrent/config ]
then
	mkdir /qBittorrent/config
fi
chown -R tang:tang /qBittorrent
if [ ! -f /qBittorrent/config/qBittorrent.conf ]
then
	cp /default/qBittorrent.conf /qBittorrent/config/qBittorrent.conf
fi

if [ -z "${RUN_AS_USER}" ]; then
	"$@"
else
	setpriv --reuid "${RUN_AS_USER}" "$@"
fi
