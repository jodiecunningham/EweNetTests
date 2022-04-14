*** Settings ***
Library    WinRMLibrary

*** Variables ***
${WINHOST}              10.0.38.235
${WINUSERNAME}          testuser
${WINPASSWORD}          testpass
${DESTHOST}             142.251.32.164
${DESTPORT}             80

*** Test Cases ***
TCP Port Check
    [Documentation]  Check for successful TCP connection to the DESTHOST
    Create Session  server  ${WINHOST}  ${WINUSERNAME}  ${WINPASSWORD}
    ${result}=    Run Ps    server    (Test-NetConnection -ComputerName ${DESTHOST} -Port ${DESTPORT}).TcpTestSucceeded
    Should Be Equal As Strings    ${result.std_out.rstrip()}    True
