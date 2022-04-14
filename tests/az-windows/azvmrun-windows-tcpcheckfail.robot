*** Settings ***
Library    OperatingSystem

*** Variables ***
${VMHOST}              firstserver
${VMRG}                firstrg
${DESTHOST}            www.google.com
${DESTPORT}            82

*** Test Cases ***
AZ CLI Windows VM run-command TCP port fail check
    [Documentation]     Checks TCP status of given host and port for expected failure
    ${rc}  ${result}=                          Run And Return Rc And Output         az vm run-command invoke -g ${VMRG} -n ${VMHOST} --command-id RunPowerShellScript --scripts @Test-TcpConnection.ps1 --parameters "DESTHOST=${DESTHOST}" "DESTPORT=${DESTPORT}"
    Should Not Contain                         ${result}  True
