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
TCP port connect failure
    [Documentation]         Expects failure to connect to this port via TCP
    ${output}=              Execute Command         nc -v -w 2 -z ${DESTHOST} ${DESTPORT} 2>&1
    Should Not Contain      ${output}               succeeded