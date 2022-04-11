*** Settings ***
Library    OperatingSystem

*** Variables ***
${VMHOST}              firstserver
${VMRG}                firstrg
${DESTHOST}            www.google.com
${DESTPORT}            80

*** Test Cases ***
AZ CLI Windows VM run-command TCP port check
    [Documentation]     Checks TCP status of given host and port
    ${rc}  ${result}=                          Run And Return Rc And Output         az vm run-command invoke -g ${VMRG} -n ${VMHOST} --command-id RunPowerShellScript --scripts @Test-TcpConnection.ps1 --parameters "DESTHOST=${DESTHOST}" "DESTPORT=${DESTPORT}"
    ${actual}=                                 evaluate  json.loads('''${result}''')
    Should Be Equal                            ${actual["value"][0]["message"]}  True
