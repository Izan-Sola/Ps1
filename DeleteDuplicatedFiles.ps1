
Set-Location C:\Users\$env:UserName

Write-Output "All the duplicated files with their directories are going to be shown."
Write-Output ""

pause

Write-Output ""

function DelOrNot ()
                  {
                   $YesNo = Read-Host -Prompt "Do you want to delete all the duplicated files? (Y/N)"

                   if ( ($YesNo -eq "N") -or ($YesNo -eq "n") )
                      {
                       Write-Output "You can now close the powershell."
                      }
                  
                   ElseIf ( ($YesNo -eq "Y") -or ($YesNo -eq "y") )
                          {
                           Get-ChildItem .\ -Name "*(?)*.*" -Recurse -File | Remove-Item 
                                 
                           Write-Output ""
                           Write-Output "All the duplicated files have been removed."
                          }
                    }

foreach ($file in Get-ChildItem .\ -Name "*(?)*.*" -Recurse -File)
        {
         Out-String -InputObject $file
        }

         if([string]::IsNullOrEmpty($file))
           {
             Write-Output "No files have been found."
             Write-Output ""
             Write-Output "You can now close the powershell."
           }
           else {
                 DelOrNot 
                }

Write-Output ""
pause