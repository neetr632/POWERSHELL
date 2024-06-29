Function Get-DiskInfo{
[Cmdletbinding()]
param(
[Parameter(Mandatory=$true)]
[string]$computername = "NEERAJ",
[string]$Drive = 'C:'
)
Get-WmiObject -Class win32_logicalDisk -Filter "DeviceID='$Drive'" -ComputerName $computername
      Select PSComputerName, DeviceID,
      @{n='Size(GB)';e={$_size/1gb -as [int]}},
      @{n='Free(GB)';e={$_Freespace /1gb -as[int]}}
}
