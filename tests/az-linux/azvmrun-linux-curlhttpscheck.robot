*** Settings ***
Library    OperatingSystem
*** Variables ***
${VMHOST}               firstserver
${VMRG}                 firstlinuxrg
${DESTHOST}             www.google.com
${DESTPORT}             443

*** Test Cases ***
AZ CLI Linux VM run-command curl https check
    [Documentation]                     Checks https call against given host and port
    ${rc}  ${result}=             Run And Return Rc And Output    az vm run-command invoke -g ${VMRG} -n ${VMHOST} --command-id RunShellScript --scripts "curl -sSf -m 2 https://$1:$2 -q;echo $?" --parameters ${DESTHOST} ${DESTPORT}
    Should Contain    ${result}    0\\n\\n[stderr]