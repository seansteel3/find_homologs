#! /bin/bash
makeblastdb -in $2 -dbtype nucl -out ./db/temp_db
tblastn -query $1 -db ./db/temp_db -out temp_file.txt -outfmt 6
awk '$3 > 30 && $4 > 90' temp_file.txt > $3
rm -r ./db
rm temp_file.txt
echo wc -l $3