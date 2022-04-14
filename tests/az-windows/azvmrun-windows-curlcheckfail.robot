*** Settings ***
Library    OperatingSystem

*** Variables ***
${VMHOST}              firstserver
${VMRG}                firstrg
${DESTHOST}            www.google.com
${DESTPORT}            443
${PROTO}               http

*** Test Cases ***
AZ CLI Windows VM run-command Curl Fail Check 
    [Documentation]     Checks Curl against given PROTO://DESTHOST:DESTPORT for failure
    ${rc}  ${result}=                          Run And Return Rc And Output         az vm run-command invoke -g ${VMRG} -n ${VMHOST} --command-id RunPowerShellScript --scripts @Test-Curl.ps1 --parameters "DESTHOST=${DESTHOST}" "DESTPORT=${DESTPORT}" "PROTO=${PROTO}"
    Should Not Contain                            ${result}  True
