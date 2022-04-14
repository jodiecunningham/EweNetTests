*** Settings ***
Library                 SSHLibrary
Suite Setup             Open Connection And Log In
Suite Teardown          Close All Connections

*** Variables ***
${SSHHOST}              10.0.38.235
${SSHUSERNAME}          testuser  
${DESTHOST}             142.251.32.164

*** Keywords ***
Open Connection And Log In
    Open Connection     ${SSHHOST}
    Login               ${SSHUSERNAME}  look_for_keys=True     


*** Test Cases ***
Ping Check
    [Documentation]     Check for successful ping to the DESTHOST
    ${rc}=                          Execute Command         ping -q -c4 -w 5 ${DESTHOST} >/dev/null  return_stdout=false  return_stderr=false  return_rc={$true}
    Should Be Equal As Integers     ${rc}                   0