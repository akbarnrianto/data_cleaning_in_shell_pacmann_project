#!/bin/bash
#gabung data
csvstack 2019-Nov-sample.csv 2019-Oct-sample.csv > gabung.csv

#preview data hasil gabung
head gabung.csv | csvlook

#pilih kolom yang digunakan
csvcut -c 2,3,4,5,6,7,8 gabung.csv > gabung_clean.csv

#preview data hasil pilih kolom
head gabung_clean.csv | csvlook

#filtering event_type purchase
csvgrep -c 2 -r "(purchase)" gabung_clean.csv > purchase.csv

#preview data hasil filter purchase
head purchase.csv | csvlook
