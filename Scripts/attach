#!/bin/bash

# check for existing tmux instances
existing_sessions=$(tmux list-sessions | head -n1 | cut -d ":" -f 1)

# if an instance doesn't exist, create one. Otherwise, attach to the existing one.
if [ -z "$existing_sessions" ]
  then
    st -e tmux
  else
    st -e tmux new-session -t $existing_sessions
fi
