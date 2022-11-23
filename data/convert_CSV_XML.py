import csv  
import pandas as pd 

df= pd.read_csv('data_CITES.csv')

with open('outputf.xml', 'w') as myfile: 
  myfile.write(df.to_xml())