function Test-RobotNetTests {
    [CmdletBinding()]
    Param(
        [Parameter(Mandatory)]
        [string]$TestCSVFile
    )
    PROCESS { 
        try {
            $testrows = import-csv -path $TestCSVFile
        }
        catch {
            Write-Error "Couldn't open CSV file for reading."
        }

        foreach ($test in $testrows) {
            try {
                write-host robot -T ${test.testargs -split ' '} $test.testscript
                robot -T ($test.testargs -split ' ') $test.testscript
            }
            catch {
                Write-Warning "Couldn't run test"
            }
        }
        rebot --name EweNetOutput *.xml
    }
}

