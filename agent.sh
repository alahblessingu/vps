#!/bin/sh

SSH_CONFIG="$HOME/.ssh/config"
VPS_IP="103.164.227.249"
VPS_USER="root"

# Tạo file config nếu chưa có
if [ ! -f "$SSH_CONFIG" ]; then
    touch "$SSH_CONFIG"
    chmod 600 "$SSH_CONFIG"
fi

# Kiểm tra đã có cấu hình chưa
if grep -q "$VPS_IP" "$SSH_CONFIG"; then
    echo "Đã có cấu hình cho $VPS_IP trong $SSH_CONFIG."
else
    echo "Thêm cấu hình ForwardAgent vào $SSH_CONFIG"
    cat <<EOF >> "$SSH_CONFIG"

Host $VPS_IP
    HostName $VPS_IP
    User $VPS_USER
    ForwardAgent yes

EOF
    echo "Đã thêm ForwardAgent cho $VPS_IP."
fi
