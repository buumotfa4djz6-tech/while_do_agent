# 无限循环运行Claude的PowerShell脚本
# 每次循环都会读取prompt.md并执行，然后休眠指定时间

while ($true) {
    Write-Host "=========================================="
    Write-Host "开始新的Claude执行循环"
    Write-Host "时间: $(Get-Date)"
    Write-Host "=========================================="

    # 执行Claude命令
    $result = claude --dangerously-skip-permissions -p ./prompt.md

    # 检查执行结果
    if ($LASTEXITCODE -eq 0) {
        Write-Host "Claude执行成功"
    } else {
        Write-Host "Claude执行失败，错误代码: $LASTEXITCODE"
    }

    # 休眠时间（秒）- 可以根据需要调整
    $SLEEP_TIME = 30
    Write-Host "休眠 $SLEEP_TIME 秒..."
    Start-Sleep -Seconds $SLEEP_TIME

    Write-Host ""
}
