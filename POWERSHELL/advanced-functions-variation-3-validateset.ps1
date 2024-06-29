Function Get-Compinfo {
    [cmdletbinding()]
    param (
        [parameter(
            Mandatory=$true,
            ValueFromPipeline=$true, # This allows input from the pipeline.
            ValueFromPipelineByPropertyName=$true)]
        [Validateset('NEERAJ')]
        [string[]]$ComputerName
    )

    Begin {
        if ($errorlog) {
            Write-Verbose 'Error logging turned on'
        } else {
            Write-Verbose 'Error logging turned off'
        }

        Foreach ($Computer in $ComputerName) {
            Write-Verbose "computer: $Computer"
        }
    }

    Process {
        foreach ($Computer in $ComputerName) {
            $os = Get-WmiObject -ComputerName $Computer -Class win32_operatingSystem
            $disks = Get-WmiObject -ComputerName $Computer -Class win32_logicalDisk

            foreach ($disk in $disks) {
                $Prop = @{
                    'ComputerName' = $Computer
                    'OS Name' = $os.caption
                    'OS Build' = $os.buildnumber
                    'Drive' = $disk.DeviceID
                    'FreeSpace' = $disk.freespace / 1gb -as [int]
                }
                $obj = New-Object -TypeName PSObject -Property $Prop
                Write-Output $obj
            }
        }
    }
}
