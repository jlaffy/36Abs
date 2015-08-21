import glob
from os.path import expanduser, basename
import pandas as pd
import collections
import numpy as np
import matplotlib.pyplot as plt


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

names = lightbar_dict["preh146"]["small"].keys()

lighties = lightbar_dict["preh146"]["small"].values()

n_groups = len(lighties[0])

light1 = map(float, lighties[0])

light2 = map(float, lighties[1])

light3 = map(float, lighties[2])

fig, ax = plt.subplots()

index = np.arange(n_groups)
bar_width = 0.20

opacity = 0.4

rects1 = plt.bar(index, light1, bar_width,
                 alpha=opacity,
                 color='b',
                 label=names[0])

rects2 = plt.bar(index + bar_width, light2, bar_width,
                 alpha=opacity,
                 color='r',
                 label=names[1])

rects3 = plt.bar(index + bar_width + bar_width, light3, bar_width,
                 alpha=opacity,
                 color='g',
                 label=names[2])

plt.xlabel('Group')
plt.ylabel('Scores')
plt.title('3 chainz')
plt.xticks(index + bar_width + bar_width, range(n_groups))
plt.legend()

plt.tight_layout()
plt.show()
