!include "nsProcess.nsh"

Name "Syncthing"
OutFile "Syncthing Installer.exe"
SetCompressor /FINAL lzma
Icon "${NSISDIR}\Contrib\Graphics\Icons\orange-install.ico"
SilentInstall silent

!define APPNAME "Syncthing"
!define APPREGNAME "Syncthing"

Section ""
  SetOutPath $APPDATA\Syncthing
  File syncthing.exe
  
  CreateShortCut "$SMSTARTUP\Syncthing.lnk" "$APPDATA\Syncthing\syncthing.exe" "-no-console"
  ExecShell "" "$SMSTARTUP\Syncthing.lnk"
  
  WriteRegStr HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\${APPREGNAME}" "DisplayName" "${APPNAME}"
  WriteRegStr HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\${APPREGNAME}" "UninstallString" '"$APPDATA\Syncthing\uninstall.exe"'
  WriteRegStr HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\${APPREGNAME}" "DisplayIcon" '"$APPDATA\Syncthing\Syncthing.exe"'
  WriteRegDWORD HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\${APPREGNAME}" "NoModify" 1
  WriteRegDWORD HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\${APPREGNAME}" "NoRepair" 1
  WriteUninstaller "$APPDATA\Syncthing\uninstall.exe"
SectionEnd

Section "Uninstall"
  ${nsProcess::KillProcess} "Syncthing.exe" $R0

  Delete "$SMSTARTUP\Syncthing.lnk"
  RMDir /r "$APPDATA\Syncthing"
  
  DeleteRegKey HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\${APPREGNAME}"
SectionEnd