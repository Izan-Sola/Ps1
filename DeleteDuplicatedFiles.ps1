
Set-Location C:\Users\2smra

Write-Output "All the duplicated files with their directories are going to be shown."
Write-Output ""

pause

Write-Output ""

function DelOrNot () {
                   $YesNo = Read-Host -Prompt "Do you want to delete all the duplicated files? (Y/N)"

                   if ( ($YesNo -eq "N") -or ($YesNo -eq "n") ) { Write-Output "You can now close the powershell." }
                   ElseIf ( ($YesNo -eq "Y") -or ($YesNo -eq "y") ) {

                           Get-ChildItem .\ -Recurse -File | 
                           Where-Object { $_.Name -match ".*\([0-9]?[0-9]?[0-9]\)\.[A-z,0-9]{2,4}" } |
                           Remove-Item
    
                            Write-Output "All the duplicated files have been removed."
                          }
                    }

foreach ($file in Get-ChildItem .\ -Recurse -File | 
          Where-Object { $_.Name -match ".*\([0-9]?[0-9]?[0-9]\)\.[A-z,0-9]{2,4}" }) {

          Write-Output $file
        }

         if([string]::IsNullOrEmpty($file)) {
             Write-Output "No files have been found."
             Write-Output ""
             Write-Output "You can now close the powershell."
           }
           else { DelOrNot}

Write-Output ""
pause