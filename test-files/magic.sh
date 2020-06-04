#!/bin/zsh
autoload -U colors 
colors 

userImageName=$1

echo "$fg[blue]Presented with file $userImageName${reset_color}\n"
echo "$fg[gray66]File detail below:" 
file $userImageName
# echo $bold_color$fg[red]bold red${reset_color}plain$'\e'$color[underline]munderlined
echo "Serial Killer,Date of Birth (ISO-8601),Day,Month,Year,Month and Day (ISO-8601)" > sep-list.csv;waifu2x -s 2 -n 0 -i $1 -o .tempWaif.png; tesseract 
.tempWaif.png stdout -l eng --oem 3 | sed -E '/^$/d' | sed -E -e 's/(( (—|-)? )|([a-z,A-Z] [0-9]))/,/' | sed -E -e 
's/([[:digit:]]{1,2})(th|th|rd|nd|st).+([A-Z][a-z]{2,8}).+([[:digit:]]{4})/\1 \3 \4,\1,\3,\4,--\3-\1/g' -e 's/January/1/g' -e 's/February/2/g' -e 
's/March/3/g' -e 's/April/4/g' -e 's/May/5/g' -e 's/June/6/g' -e 's/July/7/g' -e 's/August/8/g' -e 's/September/9/g' -e 's/October/8/g' -e 's/November/11/g' 
-e 's/December/12/g' -e 's/\,([[:digit:]]{1,2}) ([[:digit:]]{1,2}) ([[:digit:]]{4})/,\3\-\2\-\1/g' -e 's/\-([[:digit:]])(,|[^[:digit:]])/-0\1\2/g' -e 
's/\-([[:digit:]])$/-0\1/g' -e 's/([[:digit:]])\,$/\1/g'| grep -E -v -e '^\f$' | csvsort -H -c 6 | grep -v -E -e '^([a-z],)+[a-z]$' | >> sep-list.csv; mv 
sep-list.csv $userImageName.csv; open -a Numbers.app $userImageName.csv; echo "Cleaning up..."; rm .tempWaif.png; echo 
"${reset_color}$bold_color$fg[red]Done, 
launching your weird table now!${reset_color}"

