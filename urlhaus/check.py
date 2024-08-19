import requests
def isalive(url):
    """
    安全地检测URL是否可以访问，使用HEAD请求，禁用重定向，并捕获异常。
    """
    try:
        response = requests.head(url, timeout=5, allow_redirects=False)
        if response.status_code == 200:
            return True
        else:
            # print(f"Not Accessible (Status Code: {response.status_code})")
            return False
    except requests.exceptions.Timeout:
        # print("Not Accessible (Timeout)")
        return False
    except requests.exceptions.TooManyRedirects:
        # print("Not Accessible (Too Many Redirects)")
        return False
    except requests.exceptions.RequestException as e:
        # print(f"Not Accessible ({str(e)})")
        return False
    
def extract_online_urls(input_file, output_file):
    with open(input_file, 'r') as infile, open(output_file, 'w') as outfile:
        for line in infile:
            # 移除行尾的换行符并分割成各字段
            parts = line.strip().split('","')
            if len(parts) > 1:
                url_status = parts[2].strip().replace('"', '')
                # print(url_status)
                url = parts[1].strip().replace('"', '')
                # 判断是否为online状态
                if url_status == "online":
                    
                    # 将结果写入输出文件
                    if isalive(url):
                        # print(line)
                        outfile.write(line)

if __name__ == "__main__":
    input_file = "urlhaus.txt"  # 输入文件
    output_file = "online_tmp.txt"  # 输出文件
    # input_file = "reversed_output.txt"  # 输入文件
    # output_file = "online_tmp.txt"  # 输出文件
    extract_online_urls(input_file, output_file)
