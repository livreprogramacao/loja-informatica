#!/bin/bash -x

echo "Exibe as tabelas do banco de dados"
mdb-tables -1 -t table /tmp/QBDados2.mdb > /tmp/qbdados-table.txt