;表示该脚本一直执行
#Persistent
SetTitleMatchMode RegEx

if not A_IsAdmin
{
   Run *RunAs "%A_ScriptFullPath%"  ; Requires v1.0.92.01+
   ExitApp
}

#Include ime.ahk
#Include keymap.ahk
#Include CapsLockCtrlEscape.ahk
#Include EnterRCtrl.ahk