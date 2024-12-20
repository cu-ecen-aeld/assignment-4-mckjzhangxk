#include <stdio.h>
#include <string.h>
#include <fcntl.h>
#include <unistd.h>
#include <sys/stat.h>
#include <errno.h>
#include <syslog.h>

int main(int argc, char *argv[]) {
    // 检查参数是否完整
    if (argc != 3) {
        write(STDERR_FILENO, "Error: Two arguments are required.\n", 35);
        write(STDERR_FILENO, "Usage: ./writer <writefile> <writestr>\n", 40);
        return 1;
    }
    openlog(0,0,LOG_USER);
    const char *writefile = argv[1];
    const char *writestr = argv[2];

    // 提取路径目录部分
    char dirpath[4096];
    strncpy(dirpath, writefile, sizeof(dirpath));
    dirpath[sizeof(dirpath) - 1] = '\0'; // 确保字符串结尾

    // 找到路径中最后一个斜杠的位置
    char *last_slash = strrchr(dirpath, '/');
    if (last_slash != NULL) {
        *last_slash = '\0'; // 截断字符串以获取目录路径

        // 创建目录路径（包括父目录）
        if (mkdir(dirpath, 0755) == -1 && errno != EEXIST) {
            perror("Error creating directory");
            return 1;
        }
    }

    // 打开文件进行写入（覆盖模式）
    int fd = open(writefile, O_WRONLY | O_CREAT | O_TRUNC, 0644);
    if (fd == -1) {
        perror("Error opening file");
        return 1;
    }

    // 写入内容到文件
    if (write(fd, writestr, strlen(writestr)) == -1) {
        perror("Error writing to file");
        close(fd);
        return 1;
    }

    // 关闭文件
    close(fd);

    // 成功完成
    syslog(LOG_INFO,"Writing %s to %s",writestr,writefile);
    closelog();
    return 0;
}

