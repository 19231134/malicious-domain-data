# #!/bin/bash

# # 定义输入和输出文件
# INPUT_FILE="tmptmp.txt"
# OUTPUT_FILE="extracted_data.txt"

# # 清空输出文件
# > $OUTPUT_FILE

# # 从第10行开始处理，提取所需字段
# tail -n +10 $INPUT_FILE | while IFS= read -r line
# do
#     # 使用awk将每行内容按引号切分，提取需要的字段
#     url=$(echo "$line" | awk -F'","' '{print $3}')
#     url_status=$(echo "$line" | awk -F'","' '{print $4}')
#     last_online=$(echo "$line" | awk -F'","' '{print $5}')
#     threat=$(echo "$line" | awk -F'","' '{print $6}')
#     tags=$(echo "$line" | awk -F'","' '{print $7}')
#     urlhaus_link=$(echo "$line" | awk -F'","' '{print $8}')

#     # 写入到输出文件
#     echo "\"$url\",\"$url_status\",\"$last_online\",\"$threat\",\"$tags\",\"$urlhaus_link\"" >> $OUTPUT_FILE
# done

#!/bin/bash

# 定义输入和输出文件
INPUT_FILE="csv.txt"
OUTPUT_FILE="extracted_data.txt"

# 使用awk一次性处理整个文件，跳过前9行
awk -F'","' 'NR > 9 {
    # 去掉引号
    gsub(/"/, "", $2)
    gsub(/"/, "", $3)
    gsub(/"/, "", $4)
    gsub(/"/, "", $5)
    gsub(/"/, "", $6)
    gsub(/"/, "", $7)
    gsub(/"/, "", $8)
    # 打印需要的字段
    print "\"" $2 "\",\"" $3 "\",\"" $4 "\",\"" $5 "\",\"" $6 "\",\"" $7 "\",\"" $8 "\""
}' $INPUT_FILE > $OUTPUT_FILE
