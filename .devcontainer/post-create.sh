#!/usr/bin/env bash
set -euo pipefail

# Fresh named volumes mount as root:root; chown so vscode can write.
sudo chown -R vscode:vscode /home/vscode/.claude

# Make bash functions available in both interactive and non-interactive shells.
# Strip CRLF in case the workspace was checked out on Windows.
for f in /workspace/.devcontainer/.bash_adb_functions /workspace/.devcontainer/.bashrc /workspace/.devcontainer/.bash_profile; do
  sed -i 's/\r$//' "$f"
done
cp /workspace/.devcontainer/.bash_adb_functions ~/.bash_adb_functions
cat /workspace/.devcontainer/.bashrc >> ~/.bashrc
cat /workspace/.devcontainer/.bash_profile >> ~/.bash_profile
