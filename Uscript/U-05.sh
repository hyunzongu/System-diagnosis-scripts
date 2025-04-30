#!/bin/sh

cat << EOF
===== [U-05] Root directory permission check  =====
EOF

ROOTPERM="drwx------"
CHECKPERM=`ls -l /../ | awk '{print $1" "$8" "$9}' | grep root | awk '{print $1}'`   

echo "Recommand root directory permission : "${ROOTPERM}
echo "Checked   root directory permission : "${CHECKPERM}
echo ""

if [ ${CHECKPERM} = ${ROOTPERM} ]; then    
        echo "ROOT directory permission OK!"
else
        echo "ROOT directory permission BAD!!"
fi

unset ROOTPERM 
unset CHECKPERM
