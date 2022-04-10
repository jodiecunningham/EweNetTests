*** Settings ***
Library    OperatingSystem

*** Variables ***
${VMHOST}              firstserver
${VMRG}                firstlinuxrg
${DESTHOST}            www.google.com
${DESTPORT}            80


*** Test Cases ***
AZ PS Linux VM run-command curl http check for expected failure
    [Documentation]     Checks curl response for expect fail
    ${rc}  ${result}=             Run And Return Rc And Output    powershell.exe -Command Invoke-AzVMRunCommand -ResourceGroup ${VMRG} -VMName ${VMHOST} -CommandId RunShellScript -ScriptPath linux-curlhttpcheck.sh -Parameter \@{desthost='${DESTHOST}';destport='${DESTPORT}'}
    Should Not Contain    ${result}    0\n\n[stderr]