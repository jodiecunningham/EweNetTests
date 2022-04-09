*** Settings ***
Library    OperatingSystem

*** Variables ***
${VMHOST}              firstserver
${VMRG}                firstlinuxrg
${DESTHOST}            www.google.com
${DESTPORT}            80


*** Test Cases ***
AZ PS Linux VM run-command TCP port check
    [Documentation]     Checks TCP status of given host and port
    ${rc}  ${result}=             Run And Return Rc And Output    powershell.exe -Command Invoke-AzVMRunCommand -ResourceGroup ${VMRG} -VMName ${VMHOST} -CommandId RunShellScript -ScriptPath linux-tcpcheck.sh -Parameter \@{desthost='${DESTHOST}';destport='${DESTPORT}'}
    Should Contain    ${result}    0\n\n[stderr]