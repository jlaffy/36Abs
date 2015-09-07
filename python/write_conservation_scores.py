import csv
import math
from collections import Counter
import numpy as np

with open('contact_probs_rescaled_aligned.csv', 'rb') as csvfile:
    spamreader = csv.reader(csvfile, delimiter=',')
    newrows = []

    for row in spamreader:
        newrow = []
        for value in row:
            if value == '-':
                value = np.nan
            newrow.append(value)
        newrows.append(newrow)
#
#     # for each sequence
# #     for row in spamreader:
# #         newrow = []
# #
# #         # for each value in the sequence
# #         for value in row:
# #             letter = any(char.isalpha() for char in value)
# #             # if there are no letters in the value
# #             if letter is False:
# #                 # else cast to float, divide by ten, floor and append
# #                 if value == '-':
# #                     value = np.nan
# #                 else:
# #                     value = float(value)
# #                     value = value / 10
# #                     value = math.floor(value)
# #             # append the value this row's array
# #             newrow.append(value)
# #         # collect row arrays into array of arrays
# #         newrows.append(newrow)
#
#
# for i in range(1, len(newrows[1])):
#     tmplist = []
#     # for each sequence
#     for sequence in newrows:
#         # append the value at index i to the list
#         tmplist.append(sequence[i])
#     # count the fequency of the values in the array
#     counts = Counter(tmplist)
#     for sequence in newrows:
#         if math.isnan(float(sequence[i])) is True:
#             pass
#         else:
#             count = counts[sequence[i]]
#             sequence[i] = 9*(float(count)/10)
#             sequence[i] = math.floor(sequence[i])
#
# writer = csv.writer(open(
#     # 'heavy_aln_NAIL120_unknown_rescaled_contactValues.csv',
#     'heavy_aln_NAIL120_unknown_aligned_conservations.csv',
#     'w'
# ))
# writer.writerows(newrows)
