#!/usr/bin/env python3

import sys

hw1 = 'Hello World!'
hw2 = 'Hello World!!'


def main():
    if sys.version_info[0] == 3 and sys.version_info[1] >= 6:
        print(f'{hw1}')
    elif sys.version_info[0] == 3:
        print("{0}".format(hw2))
    else:
        print('Hello World!!!')


if __name__ == '__main__':
    main()
