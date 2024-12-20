#!/bin/bash

# 检查参数是否完整
if [ $# -ne 2 ]; then
    echo "Error: Two arguments are required."
    echo "Usage: $0 <writefile> <writestr>"
    exit 1
fi

writefile=$1
writestr=$2

# 获取文件路径的目录部分
dirpath=$(dirname "$writefile")

# 尝试创建路径（如果不存在）
if ! mkdir -p "$dirpath"; then
    echo "Error: Failed to create directory path '$dirpath'."
    exit 1
fi

# 尝试写入内容
if ! echo "$writestr" > "$writefile"; then
    echo "Error: Failed to write to file '$writefile'."
    exit 1
fi

echo "Success: File '$writefile' created with content."
exit 0
