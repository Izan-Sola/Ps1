


# # THIS SHIT STINKS!! CHECK "DeleteDuplicatedFilesBUTactuallyGood" instead


# Set-Location $Env:UserProfile

# function askHost() {

#   $winver = Read-Host "Which windows version are you using? ( 11 or 10 )"
#   Write-Output "All the duplicatedList files are going to be shown."
#   Write-Output ""

#   if($winver -eq "11") { searchFile(".*\-\ copy\..*") }
#   elseif ($winver -eq "10") { searchFile(".*\([0-9]?[0-9]\)\.[A-z,0-9]{2,4}") }
#   else {
#       Write-Output "Invalid windows version"
#       askHost
#  }
# }
# Write-Output ""

# function DelOrNot ($duplicatedList) {
#                    $YesNo = Read-Host -Prompt "Do you want to delete all the duplicated files? (Y/N)"

#                   if ($YesNo -eq "Y") {
#                     foreach ($duplicated in $duplicatedList) {
#                       Remove-Item $duplicated
#                     }
#                     Write-Output "All the duplicated files have been removed"
#                   } 
#                     Write-Output "You can now close the powershell."

#                     }

# function searchFile($regExpression) {

#   $duplicatedList = @()
#       foreach ($file in Get-ChildItem .\ -Recurse -File | 
#                 Where-Object { $_.Name -match $regExpression } | Select-Object -ExpandProperty FullName) {

#                 $duplicatedList+=$file
              
#               }
#                 Write-Output $duplicatedList

#               if([string]::IsNullOrEmpty($file)) {
#                   Write-Output "No files have been found."
#                   Write-Output ""
#                   Write-Output "You can now close the powershell."
#                 }
#                 else { DelOrNot($duplicatedList)}
# }
# Write-Output ""
# askHost

# pause


