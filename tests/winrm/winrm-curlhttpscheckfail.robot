*** Settings ***
Library    WinRMLibrary

*** Variables ***
${WINHOST}              10.0.38.235
${WINUSERNAME}          testuser
${WINPASSWORD}          testpass
${DESTHOST}             142.251.32.164
${DESTPORT}             443

*** Test Cases ***
Curl HTTPS Fail Check
    [Documentation]  Invalid or failed HTTPS request from DESTHOST:DESTPORT
    Create Session  server  ${WINHOST}  ${WINUSERNAME}  ${WINPASSWORD}
    ${result}=    Run Ps    server    (Invoke-WebRequest https://${DESTHOST}:${DESTPORT} -UseBasicParsing -TimeoutSec 10).StatusCode -lt 400
    Should Not Be Equal As Strings    ${result.std_out.rstrip()}    True
