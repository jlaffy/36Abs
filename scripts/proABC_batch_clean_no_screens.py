# !usr/bin/python

import datetime
import traceback
import sys
import re
import json
import csv
import os, sys
from time import sleep
from selenium import webdriver
from selenium.webdriver.common.by import By
from selenium.webdriver.common.keys import Keys
from selenium.webdriver.support.ui import WebDriverWait # available since 2.4.0
from selenium.webdriver.support import expected_conditions as EC # available since 2.26.0

#exclude light_project names NAIL107 "EIVLTQSPATLSLSPGERATLSCRASQSVSSSYLAWYQQKPGQAPRLLIYGASSRATGIPDRFSGSGSGTDFTLTISRLEPEDFAVYYCQQYGSSPYTFGQGTKLEIK"

#exclude hvy_project_names[i] "immh103MU2". hvy_chain ""EVQLVESGGGLVKPGGSLRLSCAASGFTFSNAWMSWVRQAPGKGLEWVGRIKSKTDGGTTDYAAPVKGRFTISRDDSKNTLYLQMNSLKTEDTAVYYCTTAPINIVVVVPAAIKDRDYYYYGMDVWGQGTTVTVSS","
light_chains = ["QSVLTQPPSASGTPGQRVTISCSGSSSNIGSNTVNWYQQLPGTAPKLLIYSNNQRPSGVPDRFSGSKSGTSASLAISGLQSEDEADYYCAAWDDSLNGVVFGGGTKLTVL",
                "QSVLTQPPSASGTPGQRVTISCSGSSSNIGSNTVNWYQQLPGTAPKLLIYSNNQRPSGVPDRFSGSKSGTSASLAISGLQSEDEADYYCAAWDDSLNGVVFGGGTKLTVL"]
hvy_project_names = ["immh103MV2", "immh149MV5", "immh159MU5", "naih111", "preh118", "preh119", "preh138MV4", "preh146","preh149MU5", "preh149MU7", "preh159MV6"]
light_project_names = ["NAIL120", "IMML103"]
hvy_chains = ["EVQLVESGGGLVKPGGSLRLSCAASGFTFSNAWMSWVRQAPGKGLEWVGRIKSKTDGGTTDYAAPVKGRFTISRDDSKNTLYLQMNSLKTEDTAVYYCTTVRDIVVVPAAIGLNYYYGMDVWGQGTTVTVSS",
    "QVQLVESGGGVVQPGRSLRLSCAASGFTFSNAWMSWVRQAPGKGLEWVAVISYDGSNKYYADSVKGRFTISRDNSKNTLYLQMNSLRAEDTAVYYCAKDQFVAVVVPAAIHLGYYYGMDVWGQGTTVTVSS",
    "EVQLVESGGGLVKPGGSLRLSCAASGFMFSSYEMNWVRQAPGKGLEWVGRIKSKTDGGTTDYAAPVKGRFTISRDDSKNTLYLQMNSLKTEDTAVYYCTTDLFLRARVVPAAMAPYYYGMDVWGQGTTVTVSS",
    "QVQLVESGGGVVQPGRSLRLSCAASGFTFSSYGMHWVRQAPGKGLEWVAVISYDGSNKYYADSVKGRFTISRDNSKNTLYLQMNSLRAEDTAVYYCAKTLLDVVVVPAATPQNYYYYGMDVWGQGTTVTVSS",
    "QVQLVESGGGVVQPGRSLRLSCAASGFTFSTYPMHWVRQAPGKGLEWVAFLWHDGTEEFYADSVRGRFTISRDNSKNTLYLQMDGLRADDTALYYCARDTGVGGLVVPAATGDLAGYYYGMDVWGQGTTVTVSS",
    "EVQLVESGGGLVKPGGSLRLSCAASGFTFSNAWMSWVRQAPGKGLEWVGRIKSKTDGGTTDYAAPVKGRFTISRDDSKNTLYLQMNSLKTEDTAVYYCTTHIVVVPAAIPSHYYYYYGMDVWGQGTTVTVSS",
    "EVQLVESGGGLVKPGGSLRLSCAASGFMFSSYEMNWVRQAPGKGLEWVGRIKSKTDGGTTDYAAPVKGRFTISRDDSKNTLYLQMNSLKTEDTAVYYCTTDLFLRARVVPAAMAPYYYGMDVWGQGTTVTVSS",
    "QVQLVESGGGVVQPGRSLRLSCAASGFTFSSYAMSWVRQAPGKGLEWVAVISYDGSNKYYADSVKGRFTISRDNSKNTLYLQMNSLRAEDTAVYYCAKTASFVVVPAAISDGDGYYYYMDVWGKGTTVTVSS",
    "QVQLVESGGGVVQPGRSLRLSCAASGFTFSSYGMHWVRQAPGKGLEWVAVISYDGSNKYYADSVKGRFTISRDNSKNTLYLQMNSLRAEDTAVYYCAKGAPNIVVVPAAKSAHYYYGMDVWGQGTTVTVSS",
    "EVQLVESGGGLVKPGGSLRLSCAASGFTFSNAWMSWVRQAPGKGLEWVGRIKSKTDGGTTDYAAPVKGRFTISRDDSKNTLYLQMNSLKTEDTAVYYCTTDRWGIVVVPAAKLVSYYGMDVWGQGTTVTVSS",
    "EVQLVESGGGLVKPGGSLRLSCAASGFTFSNAWMSWVRQAPGKGLEWVGRIKSKTDGGTTDYAAPVKGRFTISRDDSKNTLYLQMNSLKTEDTAVYYCILVHIVVVPAAINGYYDFWSGWDVWGQGTTVTVSS"]


#volume = ["small", "big"]


for j in range(len(light_chains)):

    #for vol in volume:
    for i in range(len(hvy_chains)):

        try:

            print "Starting " + str(i)

            results_file = "~/36Abs/results/rawdat_proabc/"+light_project_names[j]+"/"

            fp = webdriver.FirefoxProfile()
            fp.set_preference("browser.download.folderList",2)
            fp.set_preference("browser.download.manager.showWhenStarting",False)
            fp.set_preference("browser.download.dir", results_file)
            fp.set_preference("browser.helperApps.neverAsk.saveToDisk","text/csv")

            driver = webdriver.Firefox(firefox_profile=fp)
            driver.set_window_size(1024, 768)
            driver.implicitly_wait(40)

            #get page
            driver.get("http://circe.med.uniroma1.it/proABC/")
            element = WebDriverWait(driver, 20).until(EC.presence_of_element_located((By.ID, "invio")))
            print "Got page..."

            #fill form
            driver.find_element_by_name("name").send_keys(hvy_project_names[i])
            driver.find_element_by_name("email").send_keys("jlaffy7@gmail.com")
            driver.find_element_by_id("light").send_keys(light_chains[j])
            driver.find_element_by_id("heavy").send_keys(hvy_chains[i])
            #driver.find_element_by_xpath("//select[@name='volume']/option[@value='"+vol+"']").click)
            driver.find_element_by_id("invio").click()
            print "Filled form..."

            #goes to the Plot tab as default
            element = WebDriverWait(driver, 60).until(EC.presence_of_element_located((By.ID, "IDgoogleTable")))

            ##SUMMARY TAB
            #download heavy and light csvs
            driver.find_element_by_link_text("Summary").click()
            element = WebDriverWait(driver, 60).until(EC.presence_of_element_located((By.ID, "summary_table")))
            driver.find_element_by_link_text("Download Heavy Chain Table").click()
            driver.find_element_by_link_text("Download Light Chain Table").click()
            print "Saved csvs to file..."
            oldheavy = "Prob_Heavy.csv"
            oldlight = "Prob_Light.csv"
            newheavy =  light_project_names[j]+"_"+hvy_project_names[i]+"_Prob_Heavy.csv"
            newlight =  light_project_names[j]+"_"+hvy_project_names[i]+"_Prob_Light.csv"
            path = "~/36Abs/results/rawdat_proabc/"+light_project_names[i]+"/"
            print path
            os.rename(os.path.join(path, oldheavy), os.path.join(path, newheavy))
            # The light and heavy are different in each loop because one has
            # Prob_light and the other has Prob_heavy. Between loops, the files
            # are different because the loop goes through the hvy_project_names
            # list. eg first two files are immh103MV2 and second 2 are
            # immh149MV5

            ##pdb model (B value replaced with contact probabilities (higher prob = darker colour))
            ##driver.find_element_by_link_text("Download 3D Model").click()
            ##sleep 3 seconds to give you time to click "ok"
            ##sleep(3)
            ##print "Saved PDB model..."

            print ("Bye!")

        except Exception, e:
            driver.save_screenshot("exception_screen" + datetime.date.today().strftime('%d-%b-%Y') + '.png')
            print "Saved exception screenshot."
            traceback.print_exc(file=sys.stdout)

        finally:
            driver.close()
