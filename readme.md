## info
我的改建脚本, 使用 [kanata](https://github.com/jtroo/kanata) 适用于windows/linux/macOS系统

## 关于改键, 最核心的功能需求
改键最需要实现的功能是
- 同时按下`CapsLock+其他键`, remap成 `LCtrl+其他键`; 反之, 单按`CapsLock`键为`Esc`键; 单按`Esc`键为`CapsLock`键
- 同时按下`Enter+其他键`, remap成 `RCtrl+其他键`; 反之, 单按 `Enter` 键就是 `Enter`
- remap `shift+Backspace` 为 `delete`


## 不同系统的改建方案

### MacOS
有很方便的工具改键工具 [Karabiner Elements](https://github.com/pqrs-org/Karabiner-Elements) (当然也可以使用 kanata, 是跨平台的，我还没有在MacOS测试使用). 其特性有
- 很方便设置, 很容易上手
- 可以导出设置
- 有多个profile, 比如一个是默认无修改的(方便别人使用自己的键盘), 一个是有修改
- 可以针对不同的键盘(自带键盘, usb外接键盘)分别配置方案

### Windows(在远程桌面rdp也能生效)

#### 方案1：[kanata](https://github.com/kmonad/kmonad)
- windows下该软件的实现原理和power toys一样，通过截获键盘挂钩实现的：同时也支持从driver层改键，这样就能支持remote desktop
- linux下该方法从驱动层实现，功能强大。

注意：kanata为了能从系统层面hook按键，安装了相关的driver interception
如果需要卸载这个driver，那么管理员权限进入 `interception/command line installer`目录
```bash
install-interception.exe /install
```
然后重启
有时，在笔记本上多次睡眠模式重启之后会出现键盘实效的情况，重启笔记本即可。


使用：~~不再使用 `kanata_winterept_cmd_allowed.exe`，从shell cmd启动~~。使用 `kanata_gui_winterept_cmd_allowed.exe`，直接刷机启动GUI版，其会读取当前目录下`kanata.kbd`，然后以状态栏图标显示，无需cmd窗口。

**建议：把`kanata_gui_winterept_cmd_allowed.exe`的快捷方式放在`%APPDATA%\Microsoft\Windows\Start Menu\Programs\Startup`中，这样开机会自动启动**

实现的功能有：
- 左ctrl改为CapsLock
- CapsLock改为，在组合按键的时候改为左ctrl，单按为Esc
- Enter，在组合按键时改为右Ctrl，单按为Enter
- Alt + I  切换输入法
- Alt + Backspace 实现Delete功能，即后删除
- Alt + J Down方向键
- Alt + K UP方向键
- Alt + L Right方向键
- Alt + H Left方向键
- Alt + E End键
- Alt + A Home键
- Alt + W 下一个word开始
- Alt + B 上一个word开始

#### ~~方案2：[Deprecated][AutoHotkey] [Autohotkey自动切换输入法](https://github.com/lspcieee/lspcieee_ahk)~~
实现的功能有：
- 左Ctrl切换大小写
- CapsLock单按是Esc键，和其他键组合是左Ctrl键
- Enter单按是Enter, 和其他键组合是右Ctrl键
- 在QQ/weixin等工具里面使用中文输入法，在其他编辑器中使用英文输入法

开机启动：把`main.ahk`的快捷方式放在`C:\ProgramData\Microsoft\Windows\Start Menu\Programs\StartUp`


- 缺点：对Remote Desktop Connection中的远程系统无效

#### ~~方案3: [Deprecated][sharpkeys](https://github.com/randyrants/sharpkeys)修改全局的注册表，可以导出配置。缺点有2~~
>1 全局方案, 不能根据不同的软件配置不同的remap
>2 写入了注册表, 所以需要重启/重新登陆
>3 最大的缺点: 只能**单键映射单键, 无法多键映射**

#### ~~方案4：[Deprecated][uncap](https://github.com/susam/uncap)~~

[参考: 「AutoHotkey 之美」内容导读](https://zhuanlan.zhihu.com/p/19829548)
[基于AutoHotkey的脚本录制工具](https://www.macrocreator.com/)

#### ~~方案5：[Deprecated][废弃][kmonad](https://github.com/kmonad/kmonad)~~
废弃的原因
1. 项目长久没有更新，用haskell语言实现的也不会修改
2. 相比于kanata在windows terminal下会导致按键错乱，也不支持remote deskop。

### linux
使用 [kanata](https://github.com/jtroo/kanata)。我的配置还没有在linux下测试，应该是可用的。具体参考 kanata 在windows下的配置

## 其他
### ~~[deprecated]linux键盘映射系统知识~~
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

**linux最终改键方案**： 
使用脚本`./remap_keys.sh`, 每次启动时 `sh ./remap_keys.sh`
