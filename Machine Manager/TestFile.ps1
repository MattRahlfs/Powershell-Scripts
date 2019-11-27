﻿param(
#computername variable
$Computername


)

#varaible getting the current date for use in the do until loop
$currentdate = Get-Date

#function that tests the connection to the computer and if it fails exits the script
function Is_Machine_Online{

Start-Sleep -Seconds 5

if(Test-Connection -ComputerName $Computername -Count 1){
return $true
}else{Throw "opps cannot connect"}

}


Try{
#runs the function that tests the computers connection until the date is equal or greater than the variable $currentdate
do{

Is_Machine_Online $Computername

}until((get-date) -ge ($currentdate).addseconds(30))

}

catch{

Write-Output "There was an error"

}

finally{

Write-Output "thanks for running the example ps1"

}