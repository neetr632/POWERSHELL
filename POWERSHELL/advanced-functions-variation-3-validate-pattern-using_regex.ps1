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
                $Prop = [ordered]@{
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
