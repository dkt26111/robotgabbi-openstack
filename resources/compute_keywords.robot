*** Keywords ***
Compute service is available
  get compute api versions  COMPUTE_SERVICE=${COMPUTE_SERVICE}

User creates server
  [Arguments]   ${network}=${PUBLIC_NETWORK}
  &{RESP}=  create server   SERVER_NAME=${SERVER_NAME}  IMAGE_REF=${IMAGE_REF}
  ...                       FLAVOR_REF=${FLAVOR_REF}  NETWORK_REF=${network}
  set suite variable  ${server_id}    ${RESP.server_id}

User deletes server
  delete server   SERVER_ID=${server_id}

Server has been created
  verify server name  SERVER_ID=${server_id}  SERVER_NAME=${SERVER_NAME}

Server is active
  wait until keyword succeeds   1 min   5 sec
  ...                    check server status is active  SERVER_ID=${server_id}

