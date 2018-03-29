#!/bin/bash
echo "Creating links to submodules..."
mkdir -p ~/.tmux/plugins
ln -s "$(pwd)/tpm" ~/.tmux/plugins/tpm -f

echo "Installing nord theme..."
sh ./nord-gnome/src/nord.sh
