#! /bin/bash
tblastn -query $1 -db nt -out temp_file.txt
blastn -query temp_file.txt -subject $2  -perc_identity 30 -qcov_hsp_perc 90 -outfmt 6  -out $3
number_match=$(grep -c '^' $3)
number_imperfect=$(awk '$5 != 0 {count++} END {print count}' $3)
final_perfect=$((number_match - number_imperfect))
echo $final_perfect
