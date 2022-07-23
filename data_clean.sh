#!/bin/bash
## previewing data_clean.csv
head data_clean.csv | csvlook

## validating result word count
cat data_clean.csv | wc

## validating result
cat data_clean.csv | grep electronics | grep smartphone | awk -F, '{print $5}' | sort | uniq -c | sort -nr
