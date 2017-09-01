*** Variables ***

#### OpenStack General settings ####
${BASE_URL}             http://10.0.20.10
${COMPUTE_SERVICE}      compute/v2.1
${KEYSTONE_SERVICE}     identity/v3
${NEUTRON_SERVICE}      :9696

${USER_NAME}            admin
${USER_PASSWORD}        secretsecret
${DOMAIN_NAME}          default
${PROJECT_NAME}         admin


#### Settings for Nova test cases ####
${SERVER_NAME}      new-server-one

${IMAGE_REF}        12b3fa7b-266d-4ead-b39a-183a0d4e518d
${FLAVOR_REF}       1
${PUBLIC_NETWORK}   0da66817-f900-411e-998a-bc81397a1471
${PRIVATE_NETWORK}  3900e06d-0c02-4fa4-ae40-47ea57a6cce4