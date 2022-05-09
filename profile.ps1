function prompt {
   # our theme
   $cline = [ConsoleColor]::DarkGray
   $chost = [ConsoleColor]::Green
   $cloc = [ConsoleColor]::Cyan
   $cwait = [ConsoleColor]::Red

   write-host '┌(' -n -f $cline
   write-host ([System.Security.Principal.WindowsIdentity]::GetCurrent().Name) -n -f $chost
   write-host ')—————(' -n -f $cline
   write-host (shorten-path (pwd).Path) -n -f $cloc
   write-host ')' -f $cline
   write-host "└> " -n -f $cline
   write-host "$([char]0x0A7) " -n -f $cwait

   return ' '
}
function shorten-path([string] $path) {
   $loc = $path.Replace($HOME, '~')
   # remove prefix for UNC paths
   $loc = $loc -replace '^[^:]+::', ''
   # make path shorter like tabs in Vim,
   # handle paths starting with \\ and . correctly
   return ($loc -replace '\\(\.?)([^\\])[^\\]*(?=\\)','\$1$2')
}