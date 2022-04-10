*** Settings ***
Library    OperatingSystem

*** Variables ***
${VMHOST}              firstserver
${VMRG}                firstlinuxrg
${DESTHOST}            www.google.com


*** Test Cases ***
AZ PS Linux VM run-command ping check
    [Documentation]     Checks ping to given host
    ${rc}  ${result}=             Run And Return Rc And Output    powershell.exe -Command Invoke-AzVMRunCommand -ResourceGroup ${VMRG} -VMName ${VMHOST} -CommandId RunShellScript -ScriptPath linux-pingcheck.sh -Parameter \@{desthost='${DESTHOST}';}
    Should Contain    ${result}    0\n\n[stderr]