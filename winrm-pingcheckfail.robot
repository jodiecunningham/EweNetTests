*** Settings ***
Library    WinRMLibrary

*** Variables ***
${WINHOST}              10.0.38.235
${WINUSERNAME}          testuser
${WINPASSWORD}          testpass
${DESTHOST}             142.251.32.164


*** Test Cases ***
Ping Failure Check
    [Documentation]  Check to ensure ping failed to the DESTHOST
    Create Session  server  ${WINHOST}  ${WINUSERNAME}  ${WINPASSWORD}
    ${result}=    Run Ps    server    (Test-NetConnection ${DESTHOST}).PingSucceeded
    Should Be Equal As Strings    ${result.std_out.rstrip()}    False
