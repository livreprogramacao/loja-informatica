#!/bin/bash

# informe a pasta que contem os scripts SQL que serão executados.
# Exemplo: ./config/bash/run-psql-execute.sh /tmp/qbdados/mdb-schema/primario

set -e
set -u

# Set these environmental variables to override them,
# but they have safe defaults.
export PGHOST=${PGHOST-localhost}
export PGPORT=${PGPORT-5432}
export PGDATABASE=${PGDATABASE-loja}
export PGUSER=${PGUSER-postgres}
export PGPASSWORD=${PGPASSWORD-postgres}

if [ $# != 1 ]; then
    echo "please enter a db host and a table suffix and a filename"
    exit 1
fi

TABLES=$(find $1/*.sql -type f)

for FILE in ${TABLES}
do
	psql -X -f $FILE #--echo-all --set AUTOCOMMIT=on --set ON_ERROR_STOP=on

	if [ $? != 0 ]; then
	    echo "psql failed while trying to run this sql script" 1>&2
	    exit $psql_exit_status
	fi

	echo "sql script successful >>> $FILE"
done
exit 0

