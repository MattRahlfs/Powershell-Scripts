﻿Invoke-Command -ComputerName wccn58m2 -ScriptBlock {










$a = New-ScheduledTaskAction -Execute "powershell.exe" -Argument "-nologo -windowstyle hidden & '$PSSCriptRoot\Get-ImprivataReminder.ps1' -ComputerName $ComputerName -UserName $UserName" -WorkingDirectory C:\MachineManager

$t = New-ScheduledTaskTrigger -Once -At (Get-Date).AddSeconds(2) -RepetitionDuration (New-TimeSpan -Days 1) -RepetitionInterval (New-TimeSpan -Hours 1)

$p = New-ScheduledTaskPrincipal -UserId "$env:USERNAME" -RunLevel Highest 

$s = New-ScheduledTaskSettingsSet -WakeToRun -AllowStartIfOnBatteries -DontStopIfGoingOnBatteries

Register-ScheduledTask -TaskName $ComputerName -Action $a -Trigger $t -Settings $s -Principal $p -Description "Checks if imprivata is installed on the computer $ComputerName"






















}