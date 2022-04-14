*** Settings ***
Library    OperatingSystem

*** Variables ***
${VMHOST}              firstserver
${VMRG}                firstrg
${DESTHOST}            www.google.com
${DESTPORT}            80


*** Test Cases ***
AZ PS Windows VM run-command TCP port fail check
    [Documentation]     Checks TCP status of given host and port for expected failure
    ${rc}  ${result}=             Run And Return Rc And Output    powershell.exe -Command (Invoke-AzVMRunCommand -ResourceGroupName ${VMRG} -VMName ${VMHOST} -CommandId 'RunPowerShellScript' -ScriptPath 'Test-TcpConnection.ps1' -Parameter \@{DESTHOST='${DESTHOST}';DESTPORT='${DESTPORT}'}).Value[0].Message
    Should Not Contain    ${result}    True