#!/bin/bash

cat << EOF
===== [U-01] Remote Login Permission for the root User  =====
EOF

if [ -z "`grep pts /etc/securetty`" ]
then
        echo "securetty 안전"
else
        echo "securetty 취약"
fi


grep pts /etc/securetty > /dev/null 2>&1
if [ $? -eq 0 ] ; then
echo "securetty 비정상"
else
echo "securetty 정상"
fi

 

VALUE=$(cat /etc/ssh/sshd_config | grep 'PermitRootLogin' | awk {'print $2'} | sed '/the/d')

if [ $VALUE == "yes" ] ; then
        echo "root 직접 접속 허용"
else
        echo "root 직접 접속 불가"
fi
echo""
