*** Settings ***
Library    OperatingSystem

*** Variables ***
${AZAPP}               6d705cb2841e9eda
${AZAPPRG}             rg-network-eus
${DESTHOST}            www.google.com
${DESTPORT}            80


*** Test Cases ***
AZAPP Windows TCP Port check
    [Documentation]     Checks TCP Connection to the given desthost and destport from the named App Service
    ${rc}  ${result}=             Run And Return Rc And Output    powershell.exe -Command (./azapp-windows-tcpcheck.ps1 -ResourceGroupName ${AZAPPRG} -AzAppServiceName ${AZAPP} -DestHost ${DESTHOST} -DestPort ${DESTPORT} ).ExitCode
    Should Be Equal As Numbers    ${result.rstrip()}    0