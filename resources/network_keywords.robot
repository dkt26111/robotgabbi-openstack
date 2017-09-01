*** Keywords ***
Get server port id
  ${port_id}=  list active ports   url=${BASE_URL}${NEUTRON_SERVICE}
  ...                           SERVER_ID=${server_id}
  [Return]  ${port_id}

User creates floating ip for server
  &{RESP}=  list active ports   url=${BASE_URL}${NEUTRON_SERVICE}
  ...                           SERVER_ID=${server_id}
  &{RESP}=  create floating ip    url=${BASE_URL}${NEUTRON_SERVICE}
  ...                             EXTERNAL_NET_ID=${PUBLIC_NETWORK}
  ...                             PORT_ID=${RESP.port_id}
  [Return]  &{RESP}

User deletes floating ip
  [Arguments]   ${floating_ip_id}
  delete floating ip    url=${BASE_URL}${NEUTRON_SERVICE}
  ...                   FLOATING_IP_ID=${floating_ip_id}

Floating ip is accessible
  [Arguments]   ${floating_ip}
  wait until keyword succeeds   1 min   10 sec
  ...         verify floating ip in server addresses    SERVER_ID=${server_id}
  ...                                                   FLOATING_IP=${floating_ip}