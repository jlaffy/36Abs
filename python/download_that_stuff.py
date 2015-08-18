import urllib
import urllib2
import re
import time


light_chains = {
    "NAIL120": "QSVLTQPPSASGTPGQRVTISCSGSSSNIGSNTVNWYQQLPGTAPKLLIYSNNQRPSGVPDRFSGSKSGTSASLAISGLQSEDEADYYCAAWDDSLNGVVFGGGTKLTVL",
    "IMML103": "QSVLTQPPSASGTPGQRVTISCSGSSSNIGSNTVNWYQQLPGTAPKLLIYSNNQRPSGVPDRFSGSKSGTSASLAISGLQSEDEADYYCAAWDDSLNGVVFGGGTKLTVL"
}

heavy_chains = {
    "immh103MV2": "EVQLVESGGGLVKPGGSLRLSCAASGFTFSNAWMSWVRQAPGKGLEWVGRIKSKTDGGTTDYAAPVKGRFTISRDDSKNTLYLQMNSLKTEDTAVYYCTTVRDIVVVPAAIGLNYYYGMDVWGQGTTVTVSS",
    "immh149MV5": "QVQLVESGGGVVQPGRSLRLSCAASGFTFSNAWMSWVRQAPGKGLEWVAVISYDGSNKYYADSVKGRFTISRDNSKNTLYLQMNSLRAEDTAVYYCAKDQFVAVVVPAAIHLGYYYGMDVWGQGTTVTVSS",
    "immh159MU5": "EVQLVESGGGLVKPGGSLRLSCAASGFMFSSYEMNWVRQAPGKGLEWVGRIKSKTDGGTTDYAAPVKGRFTISRDDSKNTLYLQMNSLKTEDTAVYYCTTDLFLRARVVPAAMAPYYYGMDVWGQGTTVTVSS",
    "naih111": "QVQLVESGGGVVQPGRSLRLSCAASGFTFSSYGMHWVRQAPGKGLEWVAVISYDGSNKYYADSVKGRFTISRDNSKNTLYLQMNSLRAEDTAVYYCAKTLLDVVVVPAATPQNYYYYGMDVWGQGTTVTVSS",
    "preh118": "QVQLVESGGGVVQPGRSLRLSCAASGFTFSTYPMHWVRQAPGKGLEWVAFLWHDGTEEFYADSVRGRFTISRDNSKNTLYLQMDGLRADDTALYYCARDTGVGGLVVPAATGDLAGYYYGMDVWGQGTTVTVSS",
    "preh119": "EVQLVESGGGLVKPGGSLRLSCAASGFTFSNAWMSWVRQAPGKGLEWVGRIKSKTDGGTTDYAAPVKGRFTISRDDSKNTLYLQMNSLKTEDTAVYYCTTHIVVVPAAIPSHYYYYYGMDVWGQGTTVTVSS",
    "preh138MV4": "EVQLVESGGGLVKPGGSLRLSCAASGFMFSSYEMNWVRQAPGKGLEWVGRIKSKTDGGTTDYAAPVKGRFTISRDDSKNTLYLQMNSLKTEDTAVYYCTTDLFLRARVVPAAMAPYYYGMDVWGQGTTVTVSS",
    "preh146": "QVQLVESGGGVVQPGRSLRLSCAASGFTFSSYAMSWVRQAPGKGLEWVAVISYDGSNKYYADSVKGRFTISRDNSKNTLYLQMNSLRAEDTAVYYCAKTASFVVVPAAISDGDGYYYYMDVWGKGTTVTVSS",
    "preh149MU5": "QVQLVESGGGVVQPGRSLRLSCAASGFTFSSYGMHWVRQAPGKGLEWVAVISYDGSNKYYADSVKGRFTISRDNSKNTLYLQMNSLRAEDTAVYYCAKGAPNIVVVPAAKSAHYYYGMDVWGQGTTVTVSS",
    "preh149MU7": "EVQLVESGGGLVKPGGSLRLSCAASGFTFSNAWMSWVRQAPGKGLEWVGRIKSKTDGGTTDYAAPVKGRFTISRDDSKNTLYLQMNSLKTEDTAVYYCTTDRWGIVVVPAAKLVSYYGMDVWGQGTTVTVSS",
    "preh159MV6": "EVQLVESGGGLVKPGGSLRLSCAASGFTFSNAWMSWVRQAPGKGLEWVGRIKSKTDGGTTDYAAPVKGRFTISRDDSKNTLYLQMNSLKTEDTAVYYCILVHIVVVPAAINGYYDFWSGWDVWGQGTTVTVSS"
}

base_url = "http://circe.med.uniroma1.it/proABC/"
results_url = base_url + "results.php"


def get_response(light_chain, heavy_chain):
    values = {
        'email': '',
        'name': '',
        'light': light_chain,
        'heavy': heavy_chain,
        'volume': 'no',
        'invio': 'Submit'
    }
    data = urllib.urlencode(values)
    req = urllib2.Request(results_url, data)
    response = urllib2.urlopen(req)
    return response.read()


def fetch_csv(csv_url, filename):
    dl_file = urllib.URLopener()
    url = base_url + csv_url
    try:
        dl_file.retrieve(url, filename)
        print("Fetched: " + filename)
    except IOError:
        print("Error retrieving: " + filename)
        print("Url: " + url)
        print("Retrieving in 7 seconds...")
        time.sleep(7)
        dl_file.retrieve(url, filename)
        print("Fetched: " + filename)

def get_csvs(html, light_name, heavy_name):
    light = re.search(r"<a href='(.+\/Prob_Light.csv)'>", html)
    heavy = re.search(r"<a href='(.+\/Prob_Heavy.csv)'>", html)
    name = light_name + "_" + heavy_name + "_"
    fetch_csv(light.group(1), name + "Prob_Light.csv")
    fetch_csv(heavy.group(1), name + "Prob_Heavy.csv")


def process(light_name, light_chain, heavy_name, heavy_chain):
    html = get_response(light_chain, heavy_chain)
    time.sleep(10)  # grim
    get_csvs(html, light_name, heavy_name)


for light_name, light_chain in light_chains.iteritems():
    for heavy_name, heavy_chain in heavy_chains.iteritems():
        process(light_name, light_chain, heavy_name, heavy_chain)
