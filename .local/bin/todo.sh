#!/bin/bash

function num(){
	echo `sed -n '$=' ${1}`
}

function lst(){

for line in `cat ${1}`

do

    echo "\${alignr}${line}"
    

done
}

function usage(){
	echo 'Usage:'
	echo "todo.sh num|lst file"
}

if [ -z $1 ]
then
    usage
fi

if [ -z $2 ]
then
    usage
fi

if [ ! -f $2 ]
then
    touch $2
fi

$1 $2