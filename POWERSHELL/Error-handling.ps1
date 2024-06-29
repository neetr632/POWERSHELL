$ErrorActionPreference
Get-WmiObject win32_bios -ComputerName NEERAJ,notonline,client -EA SilentlyContinue -EV MyError
Get-WmiObject win32_bios -ComputerName NEERAJ,notonline,client -EA Stop
Get-WmiObject win32_bios -ComputerName NEERAJ,notonline,client -EA Inquire