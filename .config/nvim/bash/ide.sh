#!/bin/bash
tmux new-session -d bash
tmux split-window -h -p 50
tmux split-window -v -p 40
tmux split-window -h -p 50
#sends keys to first and second terminals
tmux send -t 0:1.0 "cd ror/lg-project-front" C-m
tmux send -t 0:1.1 "htop" C-m
tmux send -t 0:1.2 "cd ror/lg-project-front && yarn dev" C-m
tmux send -t 0:1.3 ". vpn" C-m
tmux -2 attach-session -d
#for f in `seq 1 10`; do
#if [[ $f -eq 1 ]]; then
#        tmux new-session -d -s my_session_name "watch -n1 tail -n5 file_${f}"
#    else
#        tmux split-window -d -t my_session_name:0 -p20 -v "watch -n1 tail -n5 file_${f}";
#    fi
#done
#tmux select-layout -t my_session_name:0 even-vertical
#tmux attach-session -t my_session_name
