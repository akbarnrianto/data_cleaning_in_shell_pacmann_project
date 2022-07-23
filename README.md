# data_cleaning_in_shell_pacmann_project

## tujuan pengerjaan project
untuk melakukan data_cleaning menggunakan linux terminal (wsl)

## deskripsi task :
### 1. file data.sh berisi syntax :
#### gabung data 
csvstack 2019-Nov-sample.csv 2019-Oct-sample.csv > gabung.csv

#### preview data hasil gabung
head gabung.csv | csvlook

#### pilih kolom yang digunakan
csvcut -c 2,3,4,5,6,7,8 gabung.csv > gabung_clean.csv

#### preview data hasil pilih kolom
head gabung_clean.csv | csvlook

#### filtering event_type purchase
csvgrep -c 2 -r "(purchase)" gabung_clean.csv > purchase.csv

#### preview data hasil filter purchase
head purchase.csv | csvlook

### 2. file split.py berisi syntax :
#### read data
import pandas as pd
data = pd.read_csv('purchase.csv')
data.tail()

#### splitting string with . delimiter
split = data["category_code"].str.split(".", n=2, expand=True)
split.tail()

##### fill none column 2 with column 1
fill = split[2].fillna(split[1])
fill.tail()

##### append column 2 with column fill
split[2] = fill
split.tail()


#### saving split column process into new data file
data["category"] = split[0]
data["product_name"] = split[2]
data.drop(columns=["category_code"], inplace = True)
data.to_csv('data_clean.csv', index=False)

### 3. file data_clean.sh berisi syntax :
#### previewing data_clean.csv
head data_clean.csv | csvlook

#### validating result word count
cat data_clean.csv | wc

#### validating result
cat data_clean.csv | grep electronics | grep smartphone | awk -F, '{print $5}' | sort | uniq -c | sort -nr
