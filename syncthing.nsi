Name "Syncthing"
OutFile "Syncthing Installer.exe"
SetCompressor /FINAL lzma
Icon "${NSISDIR}\Contrib\Graphics\Icons\orange-install.ico"
SilentInstall silent

Section ""
  SetOutPath $DOCUMENTS\Syncthing
  File syncthing.exe
  
  CreateShortCut "$SMSTARTUP\Syncthing.lnk" "$DOCUMENTS\Syncthing\syncthing.exe" "-no-console"
  ExecShell "" "$SMSTARTUP\Syncthing.lnk"
SectionEnd