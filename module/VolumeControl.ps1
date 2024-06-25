$process = Get-Process -Name StarRail
$target_pid = "/" + $process.Id

# Write-Host "$target_pid"

# 使用 nircmd 控制音量
# （无效）Start-Process "nircmd" -ArgumentList "muteappvolume $target_pid 2"

& nircmd muteappvolume $target_pid 2