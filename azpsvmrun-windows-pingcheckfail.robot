*** Settings ***
Library    OperatingSystem

*** Variables ***
${VMHOST}              firstserver
${VMRG}                firstrg
${DESTHOST}            www.googllllllllllle.com


*** Test Cases ***
AZ PS Windows VM run-command Ping Check Failure
    [Documentation]     Checks for successul ping to the DESTHOST for expected failure
    ${rc}  ${result}=             Run And Return Rc And Output    powershell.exe -Command (Invoke-AzVMRunCommand -ResourceGroupName ${VMRG} -VMName ${VMHOST} -CommandId 'RunPowerShellScript' -ScriptPath 'Test-Ping.ps1' -Parameter \@{DESTHOST='${DESTHOST}'}).Value[0].Message
    Should Not Contain    ${result}    True