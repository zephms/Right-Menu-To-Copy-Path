$exePath = "D:\xxx\rightClick.exe"

#region 以管理员权限运行,UAC提权
$currentWi = [Security.Principal.WindowsIdentity]::GetCurrent()
$currentWp = [Security.Principal.WindowsPrincipal]$currentWi
 
if( -not $currentWp.IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator))
{
  $boundPara = ($MyInvocation.BoundParameters.Keys | foreach{
     '-{0} {1}' -f  $_ ,$MyInvocation.BoundParameters[$_]} ) -join ' '
  $currentFile = (Resolve-Path  $MyInvocation.InvocationName).Path
 
 $fullPara = $boundPara + ' ' + $args -join ' '
 Start-Process "$psHome\powershell.exe"   -ArgumentList "$currentFile $fullPara"   -verb runas
 return
}
#endregion

# 文件的右键菜单
reg.exe add hkcr\*\shell\Path /v SubCommands /t REG_SZ
reg.exe add hkcr\*\shell\Path\shell\"File Name"\command /ve /t REG_SZ /d $exePath" name '%1' " /f
reg.exe add hkcr\*\shell\Path\shell\"Full Path up(反斜杠)"\command /ve /t REG_SZ /d $exePath" pathu '%1 " /f
reg.exe add hkcr\*\shell\Path\shell\"Full Path down(斜杠)"\command /ve /t REG_SZ /d $exePath" pathd '%1' " /f


# 文件夹的右键菜单
reg.exe add hkcr\Directory\shell\Path /v SubCommands /t REG_SZ
reg.exe add hkcr\Directory\shell\Path\shell\"Dir Name"\command /ve /t REG_SZ /d $exePath" name '%1' " /f
reg.exe add hkcr\Directory\shell\Path\shell\"Full Path up(反斜杠)"\command /ve /t REG_SZ /d $exePath" pathu '%1' " /f
reg.exe add hkcr\Directory\shell\Path\shell\"Full Path down(斜杠)"\command /ve /t REG_SZ /d $exePath" pathd '%1' " /f


