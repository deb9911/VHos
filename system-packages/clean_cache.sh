# Clears APT cache, pip cache, thumbnail cache etc.
# Triggered from: Smart UI – "Clean Cache"
#!/bin/bash
echo "Cleaning system caches..."

# APT cache
sudo apt-get clean
sudo apt-get autoclean

# pip cache
rm -rf ~/.cache/pip

# Thumbnail cache
rm -rf ~/.cache/thumbnails/*

echo "✅ Cache cleanup completed."
