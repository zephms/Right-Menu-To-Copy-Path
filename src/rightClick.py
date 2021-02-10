import sys
import win32clipboard as w

if len(sys.argv)<3:
    quit()

args = sys.argv
fullPathName = args[2][1:-1]
# 当最后一个是斜杠的时候会有问题,但是暂时没出现最后是斜杠的情况
if args[1]=="name":
    cp = fullPathName.split("\\")[-1]
elif args[1]=="pathu":
    cp = fullPathName
elif args[1]=="pathd":
    cp = fullPathName.replace("\\","/")

# print(cp)

w.OpenClipboard()
w.EmptyClipboard()
w.SetClipboardText(cp)
w.CloseClipboard()


