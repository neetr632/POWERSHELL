function verb-noun {
    [cmdletBinding()]
    Param(
        [parameter(valuefrompipeline=$true)]
        [string]$x
    )
    Begin {
        $total=0 #execute only once --basically steps up the process
    }
    Process {
        $total += $x #( $total=$total + $x ) 
                     #executes the number of times value passed by the pipe 
    }
    End {
        "total=$total" #xecute only once clearing the leftovers
    }
}
