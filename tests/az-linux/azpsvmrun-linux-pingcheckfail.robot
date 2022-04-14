*** Settings ***
Library    OperatingSystem

*** Variables ***
${VMHOST}              firstserver
${VMRG}                firstlinuxrg
${DESTHOST}            www.googlllllllle.com


*** Test Cases ***
AZ PS Linux VM run-command ping failure check
    [Documentation]     Checks ping to given host for expected failure
    ${rc}  ${result}=             Run And Return Rc And Output    powershell.exe -Command Invoke-AzVMRunCommand -ResourceGroup ${VMRG} -VMName ${VMHOST} -CommandId RunShellScript -ScriptPath linux-pingcheck.sh -Parameter \@{desthost='${DESTHOST}';}
    Should Not Contain    ${result}    0\n\n[stderr]