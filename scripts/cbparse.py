'''
Doc

'''

import string
import sys
import os


def print_help():
    print ('Usage: python cbparse.py Option Arguments DirectoryPath')
    print ('Options: ')
    print ('    S: parse chasebench data dir - Source Instance')
    print ('        Arguments: timeline_size')
    print ('    T: parse chasebench dependecies dir - TGDs')
    print ('        Arguments: win_size percent_box percent_diam')
    print (' ')
    print ('Example: python cbparse.py D 1000 chasebench/scenarios/deep/100/data > out.stream')
    print ('Example: python cbparse.py T 3 20 50 chasebench/scenarios/deep/100/dependencies > out.laser')
    print (' ')


def validate_dir(dir_path):
    if not dir_path.endswith("/"): 
        return "%s/" % dir_path
    return dir_path


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


def print_source(timeline_size, source_instance):
    # on the first line, Star expects the first and last timepoint
    print("%d %d" % (1, timeline_size))
    for time_point in range(timeline_size):
        for fact in source_instance:
            # one fact per line; each line contains values separated by space
            # first value is the predicate followed by constants
            print(fact)
        # empty line marks the end of imput for the current time point
        print("")  


def parse_source(timeline_size, dir_path):
    source_instance = []
    for filename in os.listdir(dir_path):
        if filename.endswith(".csv"): 
            fact = parse_fact_csv(filename, dir_path)
            source_instance.append(fact)
    return source_instance


class Dependency:
    def __init__(self, line):
        self._parse_line(line)

    def __str__(self):
        head = ' && '.join(self._head)
        body = ' && '.join(self._body) 
        rule = head + ' := ' + body
        return rule

    def _parse_line(self, line):
        line = line.rstrip().replace('.','').replace('?','').replace(' ','')
        line_list = line.split('->') 
        body = line_list[0]
        head = line_list[1]
        self._body = self._parse_conjunction(body) 
        self._head = self._parse_conjunction(head) 

    def _parse_conjunction(self, conjunction):
        '''
        parse atoms (starts with alphanumeric, ends with ')')
        '''
        result = []
        atom_chars = []
        prev_char = ""
        for char in conjunction:
            if char == ',' and prev_char == ')':
                atom = ''.join(atom_chars) 
                atom_chars = []
                result.append(atom)
            else:
                atom_chars.append(char)
            prev_char = char
        if atom_chars:
            atom = ''.join(atom_chars) 
            result.append(atom)
        return result


def parse_tgds(win_size, percent_box, percent_diam, dir_path):
    dependencies = []
    for filename in os.listdir(dir_path):
        if filename.endswith("st-tgds.txt") or filename.endswith("t-tgds.txt"): 
            full_path = "%s%s" % (dir_path, filename)
            with open(full_path) as openfileobject:
                for line in openfileobject:
                    dependency = Dependency(line)
                    dependencies.append(dependency)
    '''
       TODO: randomly add window box or window diamond
    '''
    for dependency in dependencies:
        print(dependency)



def main():
    if (len(sys.argv) < 2):
        print_help()
    else:
        option = sys.argv[1]
        if option == 'S':
            if (len(sys.argv) == 4):
                timeline_size = int(sys.argv[2])
                dir_path = validate_dir(sys.argv[3])
                source_instance = parse_source(timeline_size, dir_path)
                print_source(timeline_size, source_instance)
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
