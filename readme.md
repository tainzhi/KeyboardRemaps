# info
我的auto hotkeys脚本, 适用于windows系统


# 其他
## 一些auto hotkeys基本知识
## 关于改键
改键最需要实现的功能是
- 同时按下`CapsLock+其他键`, remap成 `LCtrl+其他键`; 反之, 单按`CapsLock`键为`Esc`键; 单按`Esc`键为`CapsLock`键
- 同时按下`Enter+其他键`, remap成 `RCtrl+其他键`; 反之, 单按 `Enter` 键就是 `Enter`
- remap `shift+Backspace` 为 `delete`

### vim切换中英文
- vscode + vim plugin搭配 [im-select](daipeihust/im-select: Switch your input method through terminal) , 注意: im-select只有windows和macOS支持, 而Linux 可以使用 [fcitx-remote](daipeihust/im-select: Switch your input method through terminal)
- ha/vim-xkbswitch: vim plugin for automatic keyboard layout switching in insert mode (github.com)
- vim切换规则
>- 只有在insert state输入中文, 所以在normal state切换到中文输入法应该自动进入 insert state
>- 在 insert state里关闭输入法的目的可能是要输入英文, 所以应该呆在 insert state
>- 在 insert state按 Esc 键, 意味着切换回 Normal state, 这时自动关闭输入法


### MacOS
有很方便的工具改键工具 [Karabiner Elements](https://github.com/pqrs-org/Karabiner-Elements). 其特性有
- 很方便设置, 很容易上手
- 可以导出设置
- 有多个profile, 比如一个是默认无修改的(方便别人使用自己的键盘), 一个是有修改
- 可以针对不同的键盘(自带键盘, usb外接键盘)分别配置方案

### Windows

#### 方案2：[AutoHotkey]
[Autohotkey自动切换输入法](https://github.com/lspcieee/lspcieee_ahk)
实现的功能有：
- 左Ctrl切换大小写
- CapsLock单按是Esc键，和其他键组合是左Ctrl键
- Enter单按是Enter, 和其他键组合是右Ctrl键
- 在QQ/weixin等工具里面使用中文输入法，在其他编辑器中使用英文输入法

开机启动：把`main.ahk`的快捷方式放在`C:\ProgramData\Microsoft\Windows\Start Menu\Programs\StartUp`


- 缺点：对Remote Desktop Connection中的远程系统无效

#### 方案3: [sharpkeys](https://github.com/randyrants/sharpkeys)修改全局的注册表，可以导出配置。缺点有2
>1 全局方案, 不能根据不同的软件配置不同的remap
>2 写入了注册表, 所以需要重启/重新登陆
>3 最大的缺点: 只能**单键映射单键, 无法多键映射**

#### 方案4：[uncap](https://github.com/susam/uncap)

[参考: 「AutoHotkey 之美」内容导读](https://zhuanlan.zhihu.com/p/19829548)
[基于AutoHotkey的脚本录制工具](https://www.macrocreator.com/)

### linux
Linux系统，每个输入设备（ls -l /dev/input）都有如下过程
/keyboard ->  scancode -> /input driver  ->  keycode  ->  /X server XKB  ->   keysym


没有比得上 Karabiner Elements 的方案, 也没有 Autohotkeys 类似的方案; 


实在不得已的方法, 使用以下工具
- [xmodmap](https://wiki.archlinux.org/title/Xmodmap)
- [xkeysnail: python开发的工具](https://github.com/mooz/xkeysnail)
- [kmonad: Haskell编写，需要编译构建；可以支持windows/linux/macOS](https://github.com/kmonad/kmonad)

linux的一些命令
```shell
# 查看virtual keyboard
xinput --list
```

`/dev/input/event*`的一些介绍
https://unix.stackexchange.com/questions/478638/laptop-keyboard-drivers-event-handlers-in-linux

xmodmap功能很强大，支持windows/linux/macOS，单键多键改键，vim式按键等等。
xmodmap在linux下是通过kernel层input server的交互才完成的改键，而xrdp是直接把按键转递给X server, 故不能用xmodmap

通过[xev](https://www.cnblogs.com/yinheyi/p/10146900.html)工具获取keycode编码，比如
Enter，keycode 36; CapsLock keycode 66; Esc keycode 9
此处的keycode是10进制的
通过命令`xmodmap -pm`查看所有修饰符，执行改键之前
```
xmodmap:  up to 4 keys per modifier, (keycodes in parentheses):

shift       Shift_L (0x32),  Shift_R (0x3e)
lock        Caps_Lock (0x42)
xmodmap:  up to 4 keys per modifier, (keycodes in parentheses):
```
改键之后
```
xmodmap:  up to 4 keys per modifier, (keycodes in parentheses):

shift       Shift_L (0x32),  Shift_R (0x3e)
lock        Caps_Lock (0x9)
control     Control_L (0x25),  Control_R (0x6d)
```
显然，把Esc keycode 9改成CapsLock键了


清除所有的改键，要么重启，要么执行` setxkbmap -option ''`

### linux最终改键方案
实现的改键功能为
#### 方法1：xrdp的远程桌面
使用脚本`./remap_keys.sh`, 每次启动时 `sh ./remap_keys.sh`

实现的改键功能有
- 左Ctrl切换大小写
- CapsLock单按是Esc键，和其他键组合是左Ctrl键
- Enter单按是Enter, 和其他键组合是右Ctrl键

#### 方法2：本地linux主机使用kmonad
- [参考：开启启动kmond脚本](https://github.com/kmonad/kmonad/tree/master/startup)
