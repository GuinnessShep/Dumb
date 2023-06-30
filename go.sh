#!/bin/bash

# define the paths to your scripts
script1="1.sh"
script2="2.sh"

# run the first script in the background and redirect its output
bash "$script1" > output1.txt &

# run the second script in the background and redirect its output
bash "$script2" > output2.txt &

# monitor the output of the scripts
tail -f output1.txt output2.txt
