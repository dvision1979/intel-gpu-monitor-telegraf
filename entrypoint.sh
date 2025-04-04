#!/bin/bash
set -e

if [ "${1:0:1}" = '-' ]; then
    set -- telegraf "$@"
fi

if [ $EUID -ne 0 ]; then
    exec "$@"
else
    # Allow telegraf to send ICMP packets and bind to privileged ports
    setcap cap_net_raw,cap_net_bind_service+ep /usr/bin/telegraf || echo "Failed to set additional capabilities on /usr/bin/telegraf"

    # OPTION 1: Run as root (skip dropping privileges)
    echo "Running telegraf as root (privileges preserved)"
    exec "$@"

    # OPTION 2: If you want to restore dropping to 'telegraf' user, comment above and uncomment below
    # export HOME=$(getent passwd telegraf | cut -d : -f 6)
    # groups="telegraf"
    # extra_groups="$(id -Gn || true)"
    # for group in $extra_groups; do
    #     case "$group" in
    #         root | telegraf) ;;
    #         *) groups="$groups,$group" ;;
    #     esac
    # done
    # exec setpriv --reuid telegraf --regid telegraf --groups "$groups" "$@"
fi
