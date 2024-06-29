[Cmdletbinding()]
param(
[string]$computername ='client',
[string]$Drive = 'C:'
)
Get-WmiObject -Class win32_logicalDisk -Filter "DeviceID='C:'" -ComputerName 'localhost'
