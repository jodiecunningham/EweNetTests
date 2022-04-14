*** Settings ***
Library    OperatingSystem

*** Variables ***
${VMHOST}              firstserver
${VMRG}                firstrg
${DESTHOST}            www.googlllllllllle.com

*** Test Cases ***
AZ CLI Windows VM run-command Ping Fail Check
    [Documentation]     Check for ping to the DESTHOST for expected failure
    ${rc}  ${result}=                          Run And Return Rc And Output         az vm run-command invoke -g ${VMRG} -n ${VMHOST} --command-id RunPowerShellScript --scripts @Test-Ping.ps1 --parameters DESTHOST=${DESTHOST}
    Should Not Contain                            ${result}  True
