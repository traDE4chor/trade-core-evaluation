# -*- coding: utf-8 -*-
"""
Created on Thu Feb 26 14:11:59 2015

@author: hahnml
"""
import sys

arguments = sys.argv

file = arguments[1]

def read_File(file):  
    with open(file, "rb") as f:
        f.readline()             # Read the first line.
        second = f.readline()    # Read the second line. 
        for line in f:           # Move to the end of the file...
            pass
        last = line              # Read the last line.

    fValues = second.split()
    lValues = last.split()
    
    return [float(fValues[1])+0.01, float(lValues[1])+0.01, float(fValues[3]), float(lValues[3])]

print(read_File(file))
