import pandas as pd
import glob
import os
import csv

root_path = "/Users/julielaffy/36Abs/results/rawdat_proabc/"
os.chdir(root_path)


def get_heavy_chains(heavy_name, light_name):
    filenames = glob.glob(light_name + '/*' + heavy_name + '*Heavy*')

    result = {
        "heavy_name": heavy_name,
        "light_name": light_name
    }

    for filename in filenames:
        df = pd.read_csv(filename, nrows=2)
        sequence, contact_value_row = map(list, df.values)
        contact_values = contact_value_row[1:]

        if "sequence" not in result:
            result["sequence"] = sequence[1:]

        if "big" in filename:
            result["big"] = contact_values
        elif "small" in filename:
            result["small"] = contact_values
        else:
            result["unknown"] = contact_values

    return result


def get_all_heavy_chains():
    heavy_chains = [
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

    light_chains = [
        "NAIL107",
        "NAIL120",
        "IMML103"
    ]

    return [get_heavy_chains(heavy_name, light_name)
            for light_name in light_chains
            for heavy_name in heavy_chains]


all_chains = get_all_heavy_chains()


def find_chain_by_heavy(heavy_name):
    return [chain for chain in all_chains if chain["heavy_name"] == heavy_name]


def get_heavy_antigens(heavy_name):
    heavy_light_chain_combos = find_chain_by_heavy(heavy_name)

    result = {
        "name": heavy_name,
        "sequence": heavy_light_chain_combos[0]["sequence"]
    }

    for chain in heavy_light_chain_combos:
        result[chain["light_name"]] = {}
        for size in ["big", "small", "unknown"]:
            result[chain["light_name"]][size] = chain[size]

    return result


def write_antigen_varies_csv(heavy_result, light_name):
    output_file = open(heavy_result["name"] + "_" + light_name + ".csv", 'wb')
    writer = csv.writer(output_file)
    sequence = heavy_result["sequence"]
    light = "light_name" + heavy_result[light_name]
    data = [range(len(sequence) + 1)[1:],
            sequence,
            light["big"],
            light["small"],
            light["unknown"]]
    writer.writerows(data)
    output_file.close()

write_antigen_varies_csv(get_heavy_antigens("preh149MU7"), "NAIL107")
