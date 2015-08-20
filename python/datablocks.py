import os
import csv
import glob
import pandas as pd

antigen_names = [
    "small",
    "big",
    "unknown"
]

light_names = [
    "NAIL120",
    "IMML103",
    "NAIL107"
]

heavy_names = [
    "immh103MV2",
    "immh149MV5",
    "immh159MU5",
    "naih111",
    "preh118",
    "preh119",
    "preh138MV4",
    "preh146",
    "preh149MU5",
    "preh149MU7"
]

lightbar_dict = {}
antigenbar_dict = {}
heavy_ali_dict = {}

path_to_files = "/Users/julielaffy/36Abs/results/rawdat_proabc/"
os.chdir(path_to_files)

for filename in filenames:
    if light_name in light_names and light_name in filename:
    if antigen_name in antigen_names and antigen_name in filename:
    if heavy_name in heavy_names and heavy_name in filename:
        lightbar_dict[heavy_name][antigen_name][light_name] = contact_values
        antigenbar_dict

