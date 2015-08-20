#!/bin/bash -x


echo "select * from $1" | \
mdb-sql -F -o /tmp/mdb-sql-select-$1.txt /home/tux/Downloads/Dropbox/projeto/waretech.com.br/QBDados.mdb
less  /tmp/mdb-sql-select-$1.txt
