*** Settings ***
Library    OperatingSystem

*** Variables ***
${VMHOST}              firstserver
${VMRG}                firstrg
${DESTHOST}            www.google.com
${DESTPORT}            80
${PROTO}               http


*** Test Cases ***
AZ PS Windows VM run-command curl check of host and port with given proto
    [Documentation]     Checks curl check on host, port and proto
    ${rc}  ${result}=             Run And Return Rc And Output    powershell.exe -Command (Invoke-AzVMRunCommand -ResourceGroupName ${VMRG} -VMName ${VMHOST} -CommandId 'RunPowerShellScript' -ScriptPath 'Test-Curl.ps1' -Parameter \@{DESTHOST='${DESTHOST}';DESTPORT='${DESTPORT}';PROTO='${PROTO}'}).Value[0].Message
    Should Be Equal As Strings    ${result.rstrip()}    True