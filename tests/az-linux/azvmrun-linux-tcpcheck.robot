*** Settings ***
Library    OperatingSystem

*** Variables ***
${VMHOST}              firstserver
${VMRG}                firstlinuxrg
${DESTHOST}            www.google.com
${DESTPORT}            80


*** Test Cases ***
AZ CLI Linux VM run-command TCP port check
    [Documentation]     Checks TCP status of given host and port
    ${rc}  ${result}=                          Run And Return Rc And Output         az vm run-command invoke -g ${VMRG} -n ${VMHOST} --command-id RunShellScript --scripts "nc -w 2 -z $1 $2;echo $?" --parameters ${DESTHOST} ${DESTPORT} 
    Should Contain    ${result}    0\\n\\n[stderr]