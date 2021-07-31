# info
我的auto hotkeys脚本, 适用于windows系统


# 实现的功能
- 

# 其他
## 一些auto hotkeys基本知识
## 关于改键
改键最需要实现的功能是
- 同时按下`CapsLock+其他键`, remap成 `LCtrl+其他键`; 反之, 单按`CapsLock`键为`Esc`键; 单按`Esc`键为`CapsLock`键
- 同时按下`Enter+其他键`, remap成 `RCtrl+其他键`; 反之, 单按 `Enter` 键就是 `Enter`
- remap `shift+Backspace` 为 `delete`

### MacOS
有很方便的工具改键工具 [Karabiner Elements](https://github.com/pqrs-org/Karabiner-Elements). 其特性有
- 很方便设置, 很容易上手
- 可以导出设置
- 有多个profile, 比如一个是默认无修改的(方便别人使用自己的键盘), 一个是有修改
- 可以针对不同的键盘(自带键盘, usb外接键盘)分别配置方案

### Windows
- 方案1: [sharpkeys](https://github.com/randyrants/sharpkeys)修改全局的注册表.缺点有2
>1 全局方案, 不能根据不同的软件配置不同的remap
>2 写入了注册表, 所以需要重启/重新登陆
>3 最大的缺点: 只能**单键映射单键, 无法多键映射**

### linux
没有比得上 Karabiner Elements 的方案, 也没有 Autohotkeys 类似的方案; 

当然可以曲线救国: windows宿主机中使用AutoHotkeys, 远程主机使用linux, 那么通过本地windows远程链接linux后, 可以使用本地windows经过 AutoHotkeys 配置后的改键规则

实在不得已的方法, 