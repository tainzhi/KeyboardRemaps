@echo off
@REM https://bbs.pcbeta.com/viewthread-1959786-1-1.html
@REM 下面的方法会导致启动两个terminal
@REM cmd启动速度是快于terminal的
@REM 从windows terminal打开改bat, reference: https://blog.csdn.net/weixin_45610260/article/details/117933344
@REM if not defined bflag set bflag=1 && start wt --title "Keyboard Remap" %0 && exit 
cd /d %~dp0

set CURRENT_DIR=%cd%
%CURRENT_DIR%\kanata_wintercept_cmd_allowed.exe --cfg %CURRENT_DIR%\kanata.kbd

@REM C:\Users\muqing\Documents\KeyboardRemaps\kanata_wintercept_cmd_allowed.exe --cfg C:\Users\muqing\Documents\KeyboardRemaps\kanata.kbd