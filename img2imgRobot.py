
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
            print(line.strip())  # Print each line after removing leading/trailing whitespace
            unix_time = int(time.time())
            print(unix_time)
            os.system("./img2img.sh  \"%s\" \"%s\" \"%s\" \"%lu\""%(strength,steps,line.strip(),unix_time))
            os.system("mkdir -p  ./robotDataset/%u "%(i))
            os.system("cp outputs/img2img-samples/samples/*.png ./robotDataset/%u "%(i))
            os.system("echo \"%lu\" > ./robotDataset/%u "%(unix_time,i))
            i = i + 1
    #-------------------------------------------------------------------
    os.system("tar cvfjh \"robotDataset.tar.bz2\" ./robotDataset/*")

except FileNotFoundError:
    print("File not found.")
