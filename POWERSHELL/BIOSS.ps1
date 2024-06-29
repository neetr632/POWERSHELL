Get-WmiObject -Class win32_logicalDisk -Filter "DeviceID='C:'" -ComputerName 'localhost'
select PScomputerName, DeviceID,
   @{n='SIZE(GB)';e={$_.size/1gb -as[int]}},
   @{n='Free(GB)';e={$_.Freespace/1gb -as [int]}}