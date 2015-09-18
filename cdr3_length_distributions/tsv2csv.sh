#!/bin/bash

tsv_to_csv () {
    sed 's/ /,/g' cdr3_sabdab_all_organisms.tsv > cdr3_sabdab_all_organisms.csv

    cat header.txt cdr3_sabdab_all_organisms.csv > cdr3_sabdab_all_organisms.csv.tmp && mv cdr3_sabdab_all_organisms.csv.tmp cdr3_sabdab_all_organisms.csv

}

tsv_to_csv
