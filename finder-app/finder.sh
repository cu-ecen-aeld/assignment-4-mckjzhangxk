#!/bin/sh

# 检查参数是否完整
if [ $# -ne 2 ]; then
    echo "Error: Two arguments are required."
    echo "Usage: $0 <filesdir> <searchstr>"
    exit 1
fi

filesdir=$1
searchstr=$2

# 检查filesdir是否为目录
if [ ! -d "$filesdir" ]; then
    echo "Error: '$filesdir' is not a directory."
    exit 1
fi

# 统计文件数
file_count=$(find "$filesdir" -type f | wc -l)

# 统计匹配行数
match_count=$(grep -r "$searchstr" "$filesdir" 2>/dev/null | wc -l)
# 打印结果
echo "The number of files are ${file_count} and the number of matching lines are ${match_count}"
exit 0
