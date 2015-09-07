import glob
from os.path import expanduser, basename
import pandas as pd
import collections
# import csv
import json

def nested_dict():
    """
    http://stackoverflow.com/a/16724937/2537053
    """
    return collections.defaultdict(nested_dict)

lightbar_dict = nested_dict()
antigenbar_dict = nested_dict()
heavy_ali_dict = nested_dict()

path_to_files = expanduser("~") + "/36Abs/results/rawdat_proabc/"

for filename in glob.glob(path_to_files + '*Prob_Heavy*'):
    cleaned = basename(filename.replace(".csv", "").replace("Prob_Heavy_", ""))
    heavy_name, light_name, antigen_name = cleaned.split("_")
    df = pd.read_csv(filename, nrows=2)
    sequence, contact_value_row = map(list, df.values)
    contact_values = contact_value_row[1:]
    lightbar_dict[heavy_name][antigen_name][light_name] = contact_values
    antigenbar_dict[heavy_name][light_name][antigen_name] = contact_values
    heavy_ali_dict[light_name][antigen_name][heavy_name] = contact_values

print json.dumps(lightbar_dict)
# with open('dict.csv', 'wb') as f:
#     w = csv.DictWriter(f, antigenbar_dict.keys())
#     w.writeheader()
#     w.writerow(antigenbar_dict)

# print antigenbar_dict
