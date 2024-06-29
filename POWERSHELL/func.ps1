function Hello {
    param (
        [string]$name,
        [int]$age
        #these are two parameters that are passed into it.
    )
    Write-Host "your name is: $name and age is, $age" #print statement of the function
    #Hello does not have a specific return value.
}

$input1 = Read-Host "Enter your name here" #input lene hai user ka
$input2 = Read-Host "Enter your age here" #input lene hai user ka
#these are two variables used

# Invoke the function
Hello -name $input1 -age ([int]$input2) #incoation me parameters aur variables link karne hai
#FunctionName -Parameter1 Value1 -Parameter2 Value2 ...