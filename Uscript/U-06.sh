#!/bin/bash

cat << EOF
===== [U-06] Find files and directories that do not have any owners  =====
EOF

# check root priv
if [ "$EUID" -ne 0 ]
        then echo "You need to ROOT priv!!"
        exit
fi

if test -f `find / \( -nouser -o -nogroup \) -xdev -ls 2>/dev/null`
        then
        echo "Files and directories without owner do not exist"
else
        echo "Files and directories without owner exists"
fi
