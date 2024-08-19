#!/bin/bash

# 定义变量
TODAY=$(date +"%Y-%m-%d")
FILE_URL="https://urlhaus.abuse.ch/downloads/csv/"
ZIP_FILE="file.zip"
CSV_FILE="csv.txt"
TMP_FILE="tmptmp.txt"
ONLINE_TMP="online_tmp.txt"
EXTRACT_FILE="extracted_data.txt"
RESERVED_FILE="reversed_output.txt"
OUTPUT_FILE="urlhaus.txt"
ONLINE_FILE="online_urls.txt"

echo $TODAY
# # 下载CSV文件
# wget $FILE_URL -O $ZIP_FILE

# # 解压文件
# unzip -o $ZIP_FILE

# 筛选当日新增数据并更新列表
# cat $CSV_FILE | grep $TODAY >> $TMP_FILE
# awk -F',' -v today="$TODAY" '$2 ~ today {print}' $CSV_FILE >> $TMP_FILE

    
#提取相关列
# bash extract.sh

# # 倒序输出
# python tail.py

# # 检查是否online
# python check.py

# # 将结果追加到输出文件
# tail -n +2 $EXTRACT_FILE >> $OUTPUT_FILE
# tail -n +2 $EXTRACT_FILE >> $ONLINE_FILE

# 删除临时文件
rm $TMP_FILE $ZIP_FILE $ONLINE_TMP $RESERVED_FILE $EXTRACT_FILE
