#!/usr/bin/env bash

PKDIR="/var/lib/ostack/packages/"

for MODULE in $(ls -1  $PKDIR)
do
    echo "`date`: finding source packages in $MODULE"
    for DIR in $(tree -L 1 -d  |awk '{ print $2 }'|grep  -v directory|grep -i [a-z])
    do  
        cd ${PKDIR}/${MODULE}/${DIR}
        cat setup.cfg |grep -i "name"
    done
done

