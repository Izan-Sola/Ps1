function ask(){
Write-Host ""
[string]$Option = Read-Host "Do you want to convert another number (Y/N)"

    if($Option.Equals("Y")){
        Clear-Host
        choose
    }
    if($Option.Equals("N")){
    Write-Host ""
          Write-Host The console will now close.
          timeout /T 2
          exit
    }
  }

function writeMessage(){

Write-Host "---------------------------------"
Write-Host $message" = "$result
Write-Host "---------------------------------"
Write-Host "  "$text to decimal equals: $result
Write-Host "---------------------------------"
ask
  }


function convertFromBinary(){
Write-Host ""
$text = Read-Host Write a number in binary to convert it to decimal
Write-Host ""
[int64]$msgLength = $text.Length;

for($i=0; $i -lt $msgLength; $i++) {

    [string]$n = $text[$i]; 
    
    if($n -eq "1") {   
    
       [int64]$pow = $msgLength-$i-1;  
       $num = [Math]::Pow(2,$pow);
       $message += " + "+$num.ToString();
       $result += $num;
    }
}
writeMessage
}

function convertFromHexadecimal() {

Write-Host ""
$text = Read-Host Write a number in hexadecimal to convert it to decimal
Write-Host ""
[int64]$msgLength = $text.Length;

for($i=0; $i -lt $msgLength; $i++) {

    $n = $text[$i]; 

    switch ($n) {
                "A" {$n=10}
                "B" {$n=11}
                "C" {$n=12}
                "D" {$n=13}
                "E" {$n=14}
                "F" {$n=15}
                 * { }
    }
   
   [int64]$nInt = [convert]::ToInt64($n, 10);
        [int64]$pow = $msgLength-$i-1;  
        [int64]$num = [Math]::Pow(16,$pow);
        $num = $nInt*$num;
        $message += " + "+$num.ToString();
        $result += $num
}
writeMessage
}


function choose() {

 Write-Host -------------------------------------
 Write-Host ( 1 ) - Binary to Decimal
 Write-Host ( 2 ) - Hexadecimal to Decimal
 Write-Host -------------------------------------
 Write-Host ""
 [int64]$ConvertOption = Read-Host Choose one of the conversion options

 switch($ConvertOption) {

                    1 {convertFromBinary}
                    2 {convertFromHexadecimal}
 }
}
choose





