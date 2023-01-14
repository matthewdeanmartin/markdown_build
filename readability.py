from textstat import textstat
import sys

file_name = sys.argv[1]

with open(file_name, 'r') as file:
    text = file.read()

reading_level = textstat.flesch_reading_ease(text)
print(file_name)
print(reading_level)