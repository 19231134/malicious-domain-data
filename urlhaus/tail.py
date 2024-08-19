def reverse_lines(input_file, output_file):
    # 读取文件并将内容按行存储在列表中
    with open(input_file, 'r') as infile:
        lines = infile.readlines()

    # 将列表内容倒序
    reversed_lines = lines[::-1]

    # 将倒序后的内容写入输出文件
    with open(output_file, 'w') as outfile:
        outfile.writelines(reversed_lines)

if __name__ == "__main__":
    input_file = "extracted_data.txt"  # 输入文件
    output_file = "reversed_output.txt"  # 输出文件
    reverse_lines(input_file, output_file)
