Name "Syncthing"
OutFile "Syncthing Installer.exe"
SetCompressor /FINAL lzma
Icon "${NSISDIR}\Contrib\Graphics\Icons\orange-install.ico"
SilentInstall silent

Section ""
  SetOutPath $APPDATA\Syncthing
  File syncthing.exe
  
  CreateShortCut "$SMSTARTUP\Syncthing.lnk" "$APPDATA\Syncthing\syncthing.exe" "-no-console"
  ExecShell "" "$SMSTARTUP\Syncthing.lnk"
SectionEnd