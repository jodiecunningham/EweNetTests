*** Settings ***
Library    OperatingSystem

*** Variables ***
${VMHOST}              firstserver
${VMRG}                firstlinuxrg
${DESTHOST}            www.google.com
${DESTPORT}            443


*** Test Cases ***
AZ PS Linux VM run-command curl https check
    [Documentation]     Checks curl https connection and response
    ${rc}  ${result}=             Run And Return Rc And Output    powershell.exe -Command Invoke-AzVMRunCommand -ResourceGroup ${VMRG} -VMName ${VMHOST} -CommandId RunShellScript -ScriptPath linux-curlhttpscheck.sh -Parameter \@{desthost='${DESTHOST}';destport='${DESTPORT}'}
    Should Contain    ${result}    0\n\n[stderr]