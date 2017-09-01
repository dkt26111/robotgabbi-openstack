*** Settings ***
Suite Setup         User gets auth token

Resource            ../resources/common_resources.robot
Resource            ../resources/openstack_settings.robot

Resource            ../resources/identity_keywords.robot
Resource            ../resources/compute_keywords.robot
Resource            ../resources/network_keywords.robot

Library             GabbiLibrary  ${BASE_URL}/${COMPUTE_SERVICE}
...                               ${GABBIT_PATH}

*** Test Cases ***
Create Server
  Given compute service is available
  When user creates server
  Then server has been created
       and server is active
  [Teardown]    User deletes server

Verify SSH
  Given user creates server  ${PRIVATE_NETWORK}
        and server is active
  &{floating_ip}=    When user creates floating ip for server
                          and floating ip is accessible  ${floating_ip.address}
  Then user can login with ssh  ${floating_ip.address}
  [Teardown]    Run Keywords    User deletes server
  ...           AND   user deletes floating ip  ${floating_ip.id}


