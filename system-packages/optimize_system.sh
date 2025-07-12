# Runs memory cleanup, dropped caches, clears temp
# Triggered from: Smart UI – "Optimize Now"
#!/bin/bash
echo "Optimizing system..."

# Sync & drop caches
sync
sudo sh -c 'echo 3 > /proc/sys/vm/drop_caches'

# Remove temp files
sudo rm -rf /tmp/*
sudo rm -rf /var/tmp/*

echo "✅ System optimized."
