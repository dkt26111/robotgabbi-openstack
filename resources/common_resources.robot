*** Settings ***
Library             OperatingSystem
Library             SSHLibrary  timeout=10 seconds

*** Variables ***
# path relative robot file where gabbi test files are located
${GABBIT_PATH}          ../gabbits


*** Keywords ***
User can login with ssh
  [Arguments]     ${floating_ip}
  Open Connection   ${floating_ip}
  Login     cirros  cubswin:)