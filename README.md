# Right-Menu-To-Copy-Path
在右键菜单中添加复制文件名或者路径的功能

### 使用方法:

下载release中的压缩文件并解压,将exe文件放在一个合适的位置(可以根据需要更改文件名)

然后用记事本或其他文本编辑器打开install.ps1,将下面引号中的exe路径改为上一步放的位置

```powershell
$exePath = "D:\xxx\rightClick.exe"
```

在install.ps1所在目录启动powershell,输入:

```powershell
./install.ps1
```

若没有报错的话,就已经安装好了,exe文件不要随意动,如果动了,需要重新更改install脚本中的文件路径,并安装,不过此时会提示覆盖安装,选择yes就好了. 至于install和uninstall两个脚本,动倒无所谓,别丢了就行,还得下载



### 卸载:

用和install.ps1同样的方法,执行uninstall

```powershell
./uninstall.ps1
```



### 注意

目前,多文件选中时,仅复制一个文件的文件名,有啥建议可以提issue :)

