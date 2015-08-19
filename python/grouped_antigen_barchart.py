import os
import csv
import pandas as pd
import glob
# import numpy as np
# import matplotlib.pyplot as plt

path = "/Users/julielaffy/36Abs/results/rawdat_proabc"
os.chdir(path)
filenames = os.listdir(path)
print filenames

filename = glob.glob(filenames("*immh103MV2_NAIL120.csv*"))
print(pd.read_csv(path + "/" + filename))

# print(file_as_table.head())
# print(file_as_table.describe())
