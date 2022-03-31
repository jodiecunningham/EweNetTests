*** Settings ***
Library                 SSHLibrary
Suite Setup             Open Connection And Log In
Suite Teardown          Close All Connections

*** Variables ***
${SSHHOST}              10.0.38.235
${SSHUSERNAME}          testuser
${SSHPASSWORD}          testpass
${DESTHOST}             142.251.32.164
${DESTPORT}             80

*** Keywords ***
Open Connection And Log In
    Open Connection     ${SSHHOST}
    Login               ${SSHUSERNAME}     ${SSHPASSWORD}


*** Test Cases ***
curl http fail check
    [Documentation]                         Checks http call against given host and port
    ${rc}=                                  Execute Command          curl -sSf -m 2 http://${DESTHOST}:${DESTPORT} >/dev/null     return_stdout=false   return_stderr=false  return_rc=${true}
    Should Not Be Equal As Integers         ${rc}                    0