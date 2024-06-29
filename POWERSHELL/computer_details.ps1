Get-ComputerInfo > C:\Users\neham\OneDrive\Desktop\SystemInfo.txt
Get-CimInstance -ClassName Win32_Battery > C:\Users\neham\OneDrive\Desktop\BatteryInfo_Command.txt
Get-WmiObject -Class Win32_UserAccount > C:\Users\neham\OneDrive\Desktop\UserInfo_Command.txt
Get-NetAdapter > C:\Users\neham\OneDrive\Desktop\NetworkAdapterInfo_Command.txt
Test-Connection -ComputerName example.com > C:\Users\neham\OneDrive\Desktop\PingInfo_Command.txt
Get-WmiObject -Class Win32_Product > C:\Users\neham\OneDrive\Desktop\SoftwareInfo_Command.txt
Get-WmiObject -Class Win32_Service > C:\Users\neham\OneDrive\Desktop\ServiceInfo_Command.txt
Get-WmiObject -Class Win32_ComputerSystem > C:\Users\neham\OneDrive\Desktop\HardwareInfo_Command.txt
Get-WmiObject -Class Win32_Processor > C:\Users\neham\OneDrive\Desktop\ProcessorInfo_Command.txt
Get-WmiObject -Class Win32_BIOS > C:\Users\neham\OneDrive\Desktop\BIOSInfo_Command.txt
Get-WmiObject -Class Win32_PhysicalMemory > C:\Users\neham\OneDrive\Desktop\MemoryInfo_Command.txt
Get-WmiObject -Class Win32_DiskDrive > C:\Users\neham\OneDrive\Desktop\DiskDriveInfo_Command.txt
Get-WmiObject -Class Win32_VideoController > C:\Users\neham\OneDrive\Desktop\VideoInfo_Command.txt
Get-WmiObject -Class Win32_NetworkAdapter > C:\Users\neham\OneDrive\Desktop\NetworkInfo_Command.txt
Get-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion" > C:\Users\neham\OneDrive\Desktop\RegistryInfo_Command.txt
Get-CimInstance -ClassName Win32_OperatingSystem > C:\Users\neham\OneDrive\Desktop\OSInfo_Command.txt
