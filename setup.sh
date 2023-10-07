#!/usr/bin/env bash

ALLOW_EXTERNAL_ACCESS=true
BIND_IP="0.0.0.0"
SECURITY="authorization"

ADMIN_USERNAME=''
ADMIN_PASSWORD=''

for arg in "$@"; do
    if [ "$arg" == "--allow-external-access" ]; then
        ALLOW_EXTERNAL_ACCESS=true
    fi
done

while [[ "$#" -gt 0 ]]; do
    case $1 in
        -u|--username)
            ADMIN_USERNAME="$2";
            shift 2;;
        -p|--password)
            ADMIN_PASSWORD="$2";
            shift 2;;
        *)
            echo "Unknown argument: $1";
            shift 1;;
    esac
done

if $ALLOW_EXTERNAL_ACCESS && ! grep -Fq "$BIND_IP" /etc/mongod.conf; then
    sed -i "s/127.0.0.1/$BIND_IP/g" /etc/mongod.conf
fi

if ! grep -Fq "$SECURITY" /etc/mongod.conf; then
    echo -e "security:\n  authorization: 'enabled'" >> /etc/mongod.conf
fi

USER_EXIST=$(mongosh --quiet --eval "use admin; db.getUser('$ADMIN_USERNAME') ? true : false;")

if [ "$USER_EXIST" == "true" ]; then
mongosh <<EOF
    use admin
    db.createUser({
        user: "$ADMIN_USERNAME",
        pwd: "$ADMIN_PASSWORD",
        roles: [{role: "userAdminAnyDatabase", db: "admin" }]
    })
EOF
fi
