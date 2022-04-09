*** Settings ***
Library    OperatingSystem

*** Variables ***
${VMHOST}              firstserver
${VMRG}                firstlinuxrg
${DESTHOST}            www.googgggggle.com


*** Test Cases ***
AZ CLI Linux VM run-command Ping Failure Check
    [Documentation]     Check to ensure ping failed to the DESTHOST
    ${rc}  ${result}=                          Run And Return Rc And Output         az vm run-command invoke -g ${VMRG} -n ${VMHOST} --command-id RunShellScript --scripts "ping -q -c4 -w 5 $1;echo $?" --parameters ${DESTHOST}
    Should Not Contain    ${result}    0\\n\\n[stderr]