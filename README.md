# Powershell - Custom Prompts
It's just my custom prompt for Powershell

```
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
```
Here is the output

![image](https://user-images.githubusercontent.com/34964920/167357091-5d484e88-b460-44ea-973d-330eef8c24fa.png)


Feel free to use or modify it.

You can learn about Powershell Prompts here:
https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.core/about/about_prompts

If you don't know where to put profile file, you can find out about it here:
https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.core/about/about_profiles
