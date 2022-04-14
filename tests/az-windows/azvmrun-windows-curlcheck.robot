*** Settings ***
Library    OperatingSystem

*** Variables ***
${VMHOST}              firstserver
${VMRG}                firstrg
${DESTHOST}            www.google.com
${DESTPORT}            80
${PROTO}               http

*** Test Cases ***
AZ CLI Windows VM run-command Curl Check
    [Documentation]     Checks Curl against given URI for valid response
    ${rc}  ${result}=                          Run And Return Rc And Output         az vm run-command invoke -g ${VMRG} -n ${VMHOST} --command-id RunPowerShellScript --scripts @Test-Curl.ps1 --parameters "DESTHOST=${DESTHOST}" "DESTPORT=${DESTPORT}" "PROTO=${PROTO}"
    ${actual}=                                 evaluate  json.loads('''${result}''')
    Should Be Equal                            ${actual["value"][0]["message"]}  True
