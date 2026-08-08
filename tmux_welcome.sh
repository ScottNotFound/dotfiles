#!/bin/bash


for i in {10..1}; do
    clear
    echo '*** New tmux session started. ***'
    echo ''
    echo '--> Press prefix -> ctrl-r to restore from last saved session or press escape to close this popup.'
    echo ''
    echo '# this popup will close in '"${i}"
    sleep 1
done

