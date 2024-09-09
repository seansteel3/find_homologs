#! /bin/bash
makeblastdb -in $2 -dbtype nucl -out ./db/temp_db
tblastn -query $1 -db ./db/temp_db -out $3 -outfmt 6
awk '$3 > 30 && $4 > 90' $3 > $3
