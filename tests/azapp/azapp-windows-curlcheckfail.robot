*** Settings ***
Library    OperatingSystem

*** Variables ***
${AZAPP}               6d705cb2841e9eda
${AZAPPRG}             rg-network-eus
${DESTHOST}            www.google.com
${DESTPORT}            444
${PROTO}               http


*** Test Cases ***
AZAPP Windows curl failure check
    [Documentation]     Checks curl to the given proto://desthost:destport from the named App Service for expected failure
    ${rc}  ${result}=             Run And Return Rc And Output    powershell.exe -Command (./azapp-windows-curlcheck.ps1 -ResourceGroupName ${AZAPPRG} -AzAppServiceName ${AZAPP} -Proto ${PROTO} -DestHost ${DESTHOST} -DestPort ${DESTPORT} ).ExitCode
    Should Not Be Equal As Numbers    ${result.rstrip()}    0