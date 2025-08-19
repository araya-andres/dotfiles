# Remap Caps Lock to Escape
# https://ejmastnak.com/tutorials/arch/caps2esc/

FILE="/etc/udevmon.yaml"
if [-f $FILE]; the
    sudo cp $FILE $FILE.bak
fi
sudo cat >$FILE <<EOF
- JOB: "intercept -g \$DEVNODE | caps2esc | uinput -d \$DEVNODE"
  DEVICE:
    EVENTS:
      EV_KEY: [KEY_CAPSLOCK, KEY_ESC]
EOF

FILE="/etc/systemd/system/udevmon.service"
if [-f $FILE]; the
    sudo cp $FILE $FILE.bak
fi
sudo cat >$FILE <<EOF
[Unit]
Description=udevmon
Wants=systemd-udev-settle.service
After=systemd-udev-settle.service

[Service]
ExecStart=/usr/bin/nice -n -20 /usr/bin/udevmon -c /etc/udevmon.yaml

[Install]
WantedBy=multi-user.target
EOF

# Enable and start the `udevmon` service
sudo systemctl enable --now udevmon.service

# Optionally verify the `udevmon` service is active and running
systemctl status udevmon
