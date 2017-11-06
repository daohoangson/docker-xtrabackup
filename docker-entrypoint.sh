#!/bin/bash

set -e

# if command starts with an option, prepend xtrabackup
if [ "${1:0:1}" = '-' ]; then
	set -- xtrabackup "$@"
fi

exec "$@"
