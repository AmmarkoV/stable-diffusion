
import os
import sys
import time


strength = "0.8"
steps    = "100"
filename = input("Enter the file name: ")

try:
    with open(filename, 'r') as file:
        for line in file:
            print(line.strip())  # Print each line after removing leading/trailing whitespace
            unix_time = int(time.time())
            print(unix_time)
            os.system("./img2img.sh  %s %s %s %lu"%(strength,steps,line.strip(),unix_time))

except FileNotFoundError:
    print("File not found.")
