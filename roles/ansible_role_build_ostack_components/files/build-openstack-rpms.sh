#!/usr/bin/env bash

PKDIR="/var/lib/ostack/packages/"

for MODULE in $(ls -1  $PKDIR)
do
    echo "`date`: finding source packages in $MODULE"
    for DIR in $(tree -L 1 -d  |awk '{ print $2 }'|grep  -iv "directory|directories" |grep -i [a-z])
    do  
        cd ${PKDIR}/${MODULE}/${DIR}
        if [[ $? == 0 ]];
        if [[ -f setup.cfg ]];
        then    
            echo "`date`: Setup cfg file is missing"
            echo "name = openstackrpm-${MODULE}"
        else
            grep -i "^name =" setup.cfg >/dev/null 2>&1
            if [[ $? == 0 ]];
            then
                echo "`date`: We have the entry in the file"
            else
                exit
            fi
        fi
        grep -i "^name =" setup.cfg 2>/dev/null
    done
done

