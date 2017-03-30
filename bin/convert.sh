#!/bin/bash

cd `dirname $0`

SRC=../src
OUTPUT=../output
COMMAND=../node_modules/aglio/bin/aglio.js
FILES=($(ls ${SRC}))

cd ${SRC}
echo 'FORMAT: 1A' > api.md || exit $?
cat ${FILES[@]} | sed -e '/^FORMAT: 1A/d' >> api.md || exit $?
mkdir -p ${OUTPUT} 2>/dev/null
${COMMAND} -i api.md -o ${OUTPUT}/api.html || exit $?

exit 0
