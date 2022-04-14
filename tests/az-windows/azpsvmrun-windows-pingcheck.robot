*** Settings ***
Library    OperatingSystem

*** Variables ***
${VMHOST}              firstserver
${VMRG}                firstrg
${DESTHOST}            www.google.com


*** Test Cases ***
AZ PS Windows VM run-command Ping Check
    [Documentation]     Checks for successul ping to the DESTHOST
    ${rc}  ${result}=             Run And Return Rc And Output    powershell.exe -Command (Invoke-AzVMRunCommand -ResourceGroupName ${VMRG} -VMName ${VMHOST} -CommandId 'RunPowerShellScript' -ScriptPath 'Test-Ping.ps1' -Parameter \@{DESTHOST='${DESTHOST}'}).Value[0].Message    
    Should Contain    ${result}    True