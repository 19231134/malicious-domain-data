import requests
from bs4 import BeautifulSoup

def fetch_and_save_content(url, output_file):
    # 获取网页内容
    response = requests.get(url)
    if response.status_code == 200:
        soup = BeautifulSoup(response.content, 'html.parser')

        # 提取整个网页的纯文本内容
        text_content = soup.get_text()

        # 将纯文本内容写入输出文件
        with open(output_file, 'w', encoding='utf-8') as file:
            file.write(text_content)
        # # 打开输出文件
        # with open(output_file, 'w') as file:
        #     # 找到所有包含条目的标签
        #     # 假设每个条目在 <tr> 标签中
        #     for row in soup.find_all('tr'):
        #         columns = row.find_all('td')
        #         if columns:
        #             # 将每个 <td> 的文本内容合并为一行
        #             line = ' | '.join(col.get_text(strip=True) for col in columns)
        #             file.write(line + '\n')

    else:
        print(f"Failed to retrieve the page. Status code: {response.status_code}")

if __name__ == "__main__":
    url = "https://cybercrime-tracker.net/all.php"
    output_file = "output.txt"
    fetch_and_save_content(url, output_file)
