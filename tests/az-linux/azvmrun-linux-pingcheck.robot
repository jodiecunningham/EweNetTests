*** Settings ***
Library    OperatingSystem

*** Variables ***
${VMHOST}              firstserver
${VMRG}                firstlinuxrg
${DESTHOST}            www.google.com

*** Test Cases ***
AZ CLI Linux VM run-command Ping Check
    [Documentation]     Check for successful ping to the DESTHOST
    ${rc}  ${result}=                          Run And Return Rc And Output         az vm run-command invoke -g ${VMRG} -n ${VMHOST} --command-id RunShellScript --scripts "ping -q -c4 -w 5 $1;echo $?" --parameters ${DESTHOST}
    Should Contain    ${result}    0\\n\\n[stderr]