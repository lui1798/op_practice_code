@echo off
mode con lines=30 cols=60
%1 mshta vbscript:CreateObject("Shell.Application").ShellExecute("cmd.exe","/c %~s0 ::","","runas",1)(window.close)&&exit
cd /d "%~dp0"
:main
cls
color 2f
echo �̡�    �̡�  �̡̡�      �̡̡̡�  �̡̡̡̡�    �̡̡̡�
echo   ��    ��  ��      ��  ��      ��  ��  ��  ��  ��      ��
echo   ��    ��  ��      ��  ��              ��      ��
echo   �̡̡̡�  ��      ��    �̡�          ��        �̡�
echo   ��    ��  ��      ��        ��        ��            ��
echo   ��    ��  ��      ��          ��      ��              ��
echo   ��    ��  ��      ��  ��      ��      ��      ��      ��
echo �̡�    �̡�  �̡̡�    �̡̡̡�      �̡̡�    �̡̡̡�
echo.----------------------------------------------------------- 
echo.����360�����ԹܼҵȰ�ȫ�������ѣ��빴ѡ���������Ͳ������ѣ�
echo.
echo.���棺ִ�и����� ����hosts�����Զ��滻���ǣ�
echo.����ԭ�ȵ�hosts���Լ��޸Ĺ�����Ϣ���������ֶ��޸ģ�
echo.
color 2e
echo.-----------------------------------------------------------
echo.��ѡ��ʹ�ã�
echo.
echo. 1.ʹ�ñ�Ŀ¼��hosts�ļ���������������1��
echo.
echo. 2.��ԭ��hosts�Ͻ���׷�ӣ�������������2��
echo.
echo. 3.�ָ���ʼhosts��������������3��
echo.-----------------------------------------------------------

if exist "%SystemRoot%\System32\choice.exe" goto Win7Choice

set /p choice=���������ֲ����س���ȷ��:

echo.
if %choice%==1 goto host DNS
if %choice%==2 goto CL
cls
"set choice="
echo ����������������ѡ��
ping 127.0.1 -n "2">nul
goto main

:Win7Choice
choice /c 123 /n /m "��������Ӧ���֣�"
if errorlevel 3 goto CL
if errorlevel 2 goto append
if errorlevel 1 goto host DNS
cls
goto main

:host DNS
cls
color 2f
if not EXIST "hosts" (
echo ��Ŀ¼û��hosts�ļ�
goto end
)
copy /y "%SystemRoot%\System32\drivers\etc\hosts" "hosts_old"
copy /y "hosts" "%SystemRoot%\System32\drivers\etc\hosts"
ipconfig /flushdns
echo.-----------------------------------------------------------
echo.
echo ��ϲ�������Ǳ���hosts��ˢ�±���DNS��������ɹ�!
echo.
echo.
goto end

:append
cls
color 2f
copy /y "%SystemRoot%\System32\drivers\etc\hosts" "hosts_bak" 
type "hosts" >> %SystemRoot%\System32\drivers\etc\hosts
echo ��ϲ����hosts׷�ӳɹ�!
echo.
goto end

:CL
cls
color 2f
@echo 127.0.0.1 localhost > %SystemRoot%\System32\drivers\etc\hosts
echo ��ϲ����hosts�ָ���ʼ�ɹ�!
echo.
goto end

:end
echo �밴������˳���
@Pause>nul