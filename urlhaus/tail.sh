#!/bin/bash

# 定义输入和输出文件
INPUT_FILE="urlhaus.txt"
OUTPUT_FILE="output_file.txt"

# 给文件内容加上行号，按行号倒序排序，然后去掉行号并输出到目标文件
nl -ba $INPUT_FILE | sort -r | cut -f2- > $OUTPUT_FILE
