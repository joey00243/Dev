#!/bin/bash

MYUSERS="aplha beta gamma"

for usr in $MYUSERS
do
    echo "Adding user $usr"
    useradd $usr
    id $usr
    echo "####################################"
done

