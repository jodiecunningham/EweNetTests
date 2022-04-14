*** Settings ***
Library                 SSHLibrary
Suite Setup             Open Connection And Log In
Suite Teardown          Close All Connections

*** Variables ***
${SSHHOST}              10.0.38.235
${SSHUSERNAME}          testuser   
${DESTHOST}             142.251.32.164
${DESTPORT}             443

*** Keywords ***
Open Connection And Log In
    Open Connection     ${SSHHOST}
    Login               ${SSHUSERNAME}  look_for_keys=True     


*** Test Cases ***
curl https fail check
    [Documentation]                         Checks https call against given host and port for expected failure
    ${rc}=                                  Execute Command          curl -sSf -m 2 https://${DESTHOST}:${DESTPORT} >/dev/null     return_stdout=false   return_stderr=false  return_rc=${true}
    Should Not Be Equal As Integers         ${rc}                    0