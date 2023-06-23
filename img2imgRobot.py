
import os
import sys
import time


strength = "0.8"
steps    = "100"
filename = input("Enter the file name: ")

os.system("rm -rf ./robotDataset/*")
os.system("mkdir -p ./robotDataset/")

try:
    i = 0
    with open(filename, 'r') as file:
        for line in file:
            prompt = line.strip()
            print(prompt)  # Print each line after removing leading/trailing whitespace
            unix_time = int(time.time())
            print(unix_time)
            os.system("./img2img.sh  \"%s\" \"%s\" \"%s\" \"%lu\""%(strength,steps,prompt,unix_time))
            os.system("mkdir -p  ./robotDataset/%u "%(i))
            os.system("cp outputs/txt2img-samples/samples/*.png ./robotDataset/%u/ "%(i)) #everything goes to txt2img-samples
            os.system("echo \"%lu\" > ./robotDataset/%u/seed.txt "%(unix_time,i))
            os.system("echo \"%s\" > ./robotDataset/%u/prompt.txt "%(prompt,i))
            os.system("echo \"%s\" > ./robotDataset/%u/strength.txt "%(strength,i))
            os.system("echo \"%s\" > ./robotDataset/%u/steps.txt "%(steps,i))
            i = i + 1
    #-------------------------------------------------------------------
    os.system("tar cvfjh \"robotDataset.tar.bz2\" ./robotDataset/*")

except FileNotFoundError:
    print("File not found.")
