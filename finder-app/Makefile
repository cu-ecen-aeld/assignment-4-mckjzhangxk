# 编译器和工具
CC := $(CROSS_COMPILE)gcc
LD := $(CROSS_COMPILE)ld
AR := $(CROSS_COMPILE)ar
OBJDUMP := $(CROSS_COMPILE)objdump
OBJCOPY := $(CROSS_COMPILE)objcopy

# 目标文件和源文件
TARGET := writer
SRC := writer.c
OBJ := $(SRC:.c=.o)

# 编译器选项
CFLAGS := -Wall -Wextra -g

# 默认目标
all: $(TARGET)

# 链接目标程序
$(TARGET): $(OBJ)
	$(CC) $(CFLAGS) -o $@ $^

# 编译目标文件
%.o: %.c
	$(CC) $(CFLAGS) -c -o $@ $<

# 清理目标
.PHONY: clean
clean:
	rm -f $(TARGET) $(OBJ)

