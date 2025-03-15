#!/usr/bin/env bash

SESH="Main"
WINDOW="home"
PBX_DIR="/home/bobby/pbx/"


 # If session already exists, attach it otherwise create it
if tmux has-session -t ${SESH} 2>/dev/null
then
    echo "Session Exists, entering..."
    tmux attach-session -t ${SESH} &>/dev/null
else
    # WINDOW 1
    echo "Building Session..."
      
    tmux start-server

    # Build home window
    tmux new-session -d -s $SESH -n ${WINDOW}
    tmux select-window -t ${SESH}:${WINDOW}
    
    # Navigate to my_repos dir
    tmux send-keys -t ${SESH}:${WINDOW}.1 "cd /home/bobby/my_repos/" ENTER

    # Split window into two vertical (50% width each)
    tmux split-window -h -p 50


    # WINDOW 2 (nvim)
    WINDOW="nvim"
    tmux new-window -t ${SESH} -n ${WINDOW}
    tmux send-keys -t ${SESH}:${WINDOW}.1 "cd ${PBX_DIR} && nvim ." ENTER

    # WINDOW 3 (alpha)
    WINDOW="alpha"
    tmux new-window -t ${SESH} -n ${WINDOW}
    tmux split-window -h -p 50
    tmux send-keys -t ${SESH}:${WINDOW}.1 "cd ${PBX_DIR}www" ENTER
    tmux send-keys -t ${SESH}:${WINDOW}.2 "cd ${PBX_DIR}" ENTER

    
    # WINDOW 4 (sql)
    WINDOW="sql"
    tmux new-window -t ${SESH} -n ${WINDOW}
    # tmux split-window -h -p 50
    tmux send-keys -t ${SESH}:${WINDOW}.1 "nvim" ENTER
    tmux send-keys -t ${SESH}:${WINDOW}.1 Space
    tmux send-keys -t ${SESH}:${WINDOW}.1 "D" ENTER     # Open dadbodui
    tmux send-keys -t ${SESH}:${WINDOW}.1 ":only" ENTER     # Quit all other windows


    
    # WINDOW 5 (api-client)
    WINDOW="api-client"
    tmux new-window -t ${SESH} -n ${WINDOW}
    tmux send-keys -t ${SESH}:${WINDOW}.1 "posting" ENTER


    # WINDOW 6 (servers)
    WINDOW="servers"
    tmux new-window -t ${SESH} -n ${WINDOW}
    tmux split-window -h
    tmux split-window -h
    # tmux send-keys -t ${SESH}:${WINDOW}.1 "ssh hive01" ENTER
    # tmux send-keys -t ${SESH}:${WINDOW}.2 "ssh hive02" ENTER
    # tmux send-keys -t ${SESH}:${WINDOW}.3 "ssh hive03" ENTER

    
    # Finish off by returning to window 2
    tmux select-window -t "home"

fi
