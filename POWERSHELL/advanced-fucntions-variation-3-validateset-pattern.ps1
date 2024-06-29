<#
.SYNOPSIS
This function retrieves information about remote computers, including operating system details and disk space, and associates the provided IP address with the collected data.

.DESCRIPTION
The Get-Compinfo function allows you to collect data about remote computers by providing a list of computer names and an associated IP address. It connects to the remote computers, retrieves information about the operating system and disk space, and creates PowerShell objects with this data. The provided IP address is associated with the collected information.

.PARAMETER IPaddress
The IP address to associate with the collected data. It must be in the format of "X.X.X.X," where X is a number from 1 to 255.

.PARAMETER ComputerName
An array of computer names for which you want to collect information. This parameter accepts pipeline input and input by property name.

.EXAMPLE
Get-Compinfo -ComputerName "Computer1", "Computer2" -IPaddress "192.168.1.100"

This example collects information about "Computer1" and "Computer2" and associates the IP address "192.168.1.100" with the collected data.

.NOTES
File Name      : Get-Compinfo.ps1
Author         : Your Name
Prerequisite   : PowerShell v2
Copyright 2019 - Your Organization

#>
Function Get-Compinfo {
    [cmdletbinding()]
    param (
        [parameter(
            Mandatory=$true,
            ValueFromPipeline=$true,
            ValueFromPipelineByPropertyName=$true)]
        [ValidatePattern("\b\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3}\b")]
        [string]$IPaddress,
        
        [parameter(
            Mandatory=$true,
            ValueFromPipeline=$true,
            ValueFromPipelineByPropertyName=$true)]
        [string[]]$ComputerName
    )

    Begin {
        if ($PSBoundParameters['Errorlog']) {
            Write-Verbose 'Error logging turned on'
        } else {
            Write-Verbose 'Error logging turned off'
        }

        Foreach ($Computer in $ComputerName) {
            Write-Verbose "Computer: $Computer"
        }
    }

    Process {
        foreach ($Computer in $ComputerName) {
            $os = Get-WmiObject -ComputerName $Computer -Class win32_operatingSystem
            $disks = Get-WmiObject -ComputerName $Computer -Class win32_logicalDisk

            foreach ($disk in $disks) {
                $Prop = @{   #$Prop can be called a hashtable or a property bag
                    'ComputerName' = $Computer
                    'OS Name' = $os.Caption
                    'OS Build' = $os.BuildNumber
                    'Drive' = $disk.DeviceID
                    'FreeSpace' = [int]($disk.FreeSpace / 1gb)
                    'IP' = $IPaddress
                }
                $obj = New-Object -TypeName PSObject -Property $Prop
                Write-Output $obj
              
            }
        }
    }
}
