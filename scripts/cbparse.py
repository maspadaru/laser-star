'''
Doc

'''

import string
import sys
import os


class Fact:
    def __init__(self, predicate, values):
        self._predicate = predicate 
        self._values = values 

    def __str__(self):
        var = ' '.join(self._values)
        return "%s %s" % (self._predicate, var)


def parse_fact_csv(filename, dir_path):
    # each file is a fact: <predicate>.csv
    predicate = filename.replace(".csv","")
    full_path = "%s%s" % (dir_path, filename)
    data_file = open(full_path)
    # each file contains a single line
    line = data_file.readline()
    # Eliminating tailing new line. Removing "" around string vlaues.
    values = line.rstrip().replace('"','').split(',')
    fact = Fact(predicate, values)
    return fact


def parse_data(timeline_size, dir_path):
    source_instance = []
    for filename in os.listdir(dir_path):
        if filename.endswith(".csv"): 
            fact = parse_fact_csv(filename, dir_path)
            source_instance.append(fact)
    for time_point in range(timeline_size):
        for fact in source_instance:
            # one fact per line; each line contains values separated by space
            # first value is the predicate followed by constants
            print(fact)
        # empty line marks the end of imput for the current time point
        print("")


def parse_tgds(win_size, percent_box, percent_diam, dir_path):
    '''
    path to rule folder
    get all files in rule folder
    for each file <name>.st-tgds.txt or <name>.t-tgds.txt:
        open file
        for each line:
            separate head and body 
            parse atoms (starts with alphanumeric, ends with ')')
            all atoms remove '?'
            randomly add window box or window diamond
            convert to string in laser format:
            " head_atom && head_atom := body_atom && body_atom"
    '''


def validate_dir(dir_path):
    if not dir_path.endswith("/"): 
        return "%s/" % dir_path
    return dir_path


def print_help():
    print ('Usage: python cbparse.py Option Arguments DirectoryPath')
    print ('Options: ')
    print ('    D: parse chasebench data dir ')
    print ('        Arguments: timeline_size')
    print ('    T: parse chasebench dependecies dir ')
    print ('        Arguments: win_size percent_box percent_diam')
    print (' ')
    print ('Example: python cbparse.py D 1000 chasebench/scenarios/deep/100/data > out.stream')
    print ('Example: python cbparse.py T 3 20 50 chasebench/scenarios/deep/100/dependencies > out.laser')
    print (' ')


def main():
    print(len(sys.argv))
    if (len(sys.argv) < 2):
        print_help()
    else:
        option = sys.argv[1]
        if option == 'D':
            if (len(sys.argv) == 4):
                timeline_size = int(sys.argv[2])
                dir_path = validate_dir(sys.argv[3])
                parse_data(timeline_size, dir_path)
        elif option == 'T': 
            if (len(sys.argv) == 6):
                win_size = int(sys.argv[2])
                percent_box = int(sys.argv[3])
                percent_diam = int(sys.argv[4])
                dir_path = validate_dir(sys.argv[5])
                parse_tgds(win_size, percent_box, percent_diam, dir_path)
        else:
            print_help()


if __name__ == '__main__':
    main()
