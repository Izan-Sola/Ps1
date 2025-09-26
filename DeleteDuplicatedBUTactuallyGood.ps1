cd $env:UserProfile

Write-Output "All the duplicated files with their path are going to be shown, please wait.`n"

$duplicatedFiles = Get-ChildItem -Exclude ".*" | Get-ChildItem -Recurse | Get-FileHash |
                 Select-Object Path,Hash |Group-Object { $_.Hash } |
                 Where-Object { $_.Count -gt 1}

$removableList = @()

foreach ($group in $duplicatedFiles) {
     foreach ($file in $group.Group) {
         $removableList+=$file.Path | Where-Object { $_ -Match "(.*\-\ copy\..*)|(.*\([0-9]?[0-9]\)\.[A-z,0-9]{2,4})" }
     }
}

 Write-Output $removableList
if([String]::IsNullOrEmpty($removableList[0])) {
    Write-Output "No files have been found.`n"
} else {
        $YesNo = Read-Host -Prompt "`nDo you want to delete all the duplicated files? (Y/N)`n"

        if ($YesNo -eq "Y") {
            foreach ($file in $removableList) {
                        Remove-Item $file
            }
            Write-Output "All the duplicated files have been removed.`n"
        } 
}

    Write-Output "You can now close the powershell.`n"

pause


#Regex for later: ".*\-\ copia\..*"

# ".*\([0-9]?[0-9]\)\.[A-z,0-9]{2,4}"

