#!/usr/bin/env bash

# Kill any running sessions
tmux kill-session

# Update the server
git pull

# Rebuild the server
./acore.sh compiler build

# Start a new tmux session named "my_session" and detach immediately
tmux new-session -d -s server

# Split the window into two vertical panes
tmux split-window -h -t server

# Run commands in each pane
tmux send-keys -t server:0.0 "./acore.sh run-worldserver" C-m  # Replace with your command for the left pane
tmux send-keys -t server:0.1 "./acore.sh run-authserver" C-m  # Replace with your command for the right pane

# Attach to the session
tmux attach -t server
