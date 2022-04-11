*** Settings ***
Library    OperatingSystem

*** Variables ***
${VMHOST}              firstserver
${VMRG}                firstrg
${DESTHOST}            www.google.com

*** Test Cases ***
AZ CLI Windows VM run-command Ping Check
    [Documentation]     Check for successful ping to the DESTHOST
    ${rc}  ${result}=                          Run And Return Rc And Output         az vm run-command invoke -g ${VMRG} -n ${VMHOST} --command-id RunPowerShellScript --scripts @Test-Ping.ps1 --parameters DESTHOST=${DESTHOST}
    ${actual}=                                 evaluate  json.loads('''${result}''')
    Should Be Equal                            ${actual["value"][0]["message"]}  True
