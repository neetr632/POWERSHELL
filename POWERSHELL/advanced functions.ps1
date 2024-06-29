function verb-noun {
    [cmdletBinding()]
    Param(
        [parameter(valuefrompipeline=$true)]
        [string]$myString
    )
    Begin {
        "Begin $myString" #execute only once --basically steps up the process
    }
    Process {
        "Process $myString" #executes the number of times value passed by the pipe 
    }
    End {
        "End $myString" #eecute only once clearing the leftovers
    }
}
