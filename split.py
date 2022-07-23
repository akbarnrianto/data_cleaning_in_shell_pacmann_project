## read data
import pandas as pd
data = pd.read_csv('purchase.csv')
data.tail()

## splitting string with . delimiter
split = data["category_code"].str.split(".", n=2, expand=True)
split.tail()

## fill none column 2 with column 1
fill = split[2].fillna(split[1])
fill.tail()

## append column 2 with column fill
split[2] = fill
split.tail()


## saving split column process into new data file
data["category"] = split[0]
data["product_name"] = split[2]
data.drop(columns=["category_code"], inplace = True)
data.to_csv('data_clean.csv', index=False)