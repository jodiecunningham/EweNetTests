*** Settings ***
Library    WinRMLibrary

*** Variables ***
${WINHOST}              10.0.38.235
${WINUSERNAME}          testuser
${WINPASSWORD}          testpass
${DESTHOST}             142.251.32.164
${DESTPORT}             80

*** Test Cases ***
Curl HTTP Check
    [Documentation]  Valid HTTP response <400 from DESTHOST:DESTPORT
    Create Session  server  ${WINHOST}  ${WINUSERNAME}  ${WINPASSWORD}
    ${result}=    Run Ps    server    (Invoke-WebRequest http://${DESTHOST}:${DESTPORT} -UseBasicParsing).StatusCode -lt 400
    Should Be Equal As Strings    ${result.std_out.rstrip()}    True