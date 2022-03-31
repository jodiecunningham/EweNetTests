*** Settings ***
Library                 SSHLibrary
Suite Setup             Open Connection And Log In
Suite Teardown          Close All Connections

*** Variables ***
${SSHHOST}              10.0.38.235
${SSHUSERNAME}          testuser
${SSHPASSWORD}          testpass
${DESTHOST}             142.251.32.164
${DESTPORT}             443

*** Keywords ***
Open Connection And Log In
    Open Connection     ${SSHHOST}
    Login               ${SSHUSERNAME}     ${SSHPASSWORD}


*** Test Cases ***
TCP port check
    [Documentation]     Checks TCP status of given host and port
    ${output}=          Execute Command         nc -v -w 2 -z ${DESTHOST} ${DESTPORT} 2>&1
    Should Contain      ${output}               succeeded