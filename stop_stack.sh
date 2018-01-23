#!/bin/bash

echo "Stoping all tmux process.."
total_tabs="$(tmux list-sessions | grep  -o '[1-9]' | head -1 | sed -e 's/^0\+//')"
for i in $(seq 0 $total_tabs);
do 
echo $i
if [ $i == $total_tabs ]; then
	break
fi
tmux send -t $i ^C ENTER
done
pkill -f tmux
