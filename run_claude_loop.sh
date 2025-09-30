#!/bin/bash

# 无限循环运行Claude的脚本
# 每次循环都会读取prompt.md并执行，然后休眠指定时间

while true; do
    echo "=========================================="
    echo "开始新的Claude执行循环"
    echo "时间: $(date)"
    echo "=========================================="

    # 执行Claude命令
    claude --dangerously-skip-permissions -p ./prompt.md

    # 检查执行结果
    if [ $? -eq 0 ]; then
        echo "Claude执行成功"
    else
        echo "Claude执行失败，错误代码: $?"
    fi

    # 休眠时间（秒）- 可以根据需要调整
    SLEEP_TIME=30
    echo "休眠 $SLEEP_TIME 秒..."
    sleep $SLEEP_TIME

    echo ""
done