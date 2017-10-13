robotgabbi-openstack
=========================================================

Overview
--------

`Robot Framework
<https://github.com/robotframework/robotframework>`_ is a test automation framework for acceptance testing.  In
Robot Framework a user can define custom test libraries to interact with the
system under test.  If the system under test is a RESTful web service, Robot
Framework offers a number of external HTTP test libraries.  While
it is entirely reasonable to write robot test cases using any of those
libraries, I wanted to explore the possibility of using gabbi as a test library
for Robot Framework.

`Gabbi <https://gabbi.readthedocs.io/>`_ is a tool that allows a user to write
HTTP tests using YAML format.  The main advantage of writing test cases in
Gabbi's YAML format is the simplicity and readability of the test case.

`robotframework-gabbilibrary <https://github.com/dkt26111/robotframework-gabbilibrary>`_
provides an implementation that creates dynamic keywords out of gabbi tests.

In this project I provide sample robot test suites that use robotframework-gabbilibrary
to test OpenStack scenarios.

Requirements
------------
The sample tests require the following:

* Robot Framework installed
* Gabbi tool installed
* OpenStack cloud (e.g. devstack) running

Usage
-----
To run the robot test suite, run robot against one of the test files under the
robot directory::

  robot compute_scenarios.robot

Configuration
-------------
A number of OpenStack related settings need to be modified for your cloud instance
in order for the testcases to work.  These settings are located in
resources/openstack_settings.robot:

===============================  ======================================================================================================================================
   Key                            Description
===============================  ======================================================================================================================================
BASE_URL                         URL of the OpenStack cloud instance
COMPUTE_SERVICE                  URL suffix of the compute service
KEYSTONE_SERVICE                 URL suffix of the keystone service
NEUTRON_SERVICE                  URL suffix of the neutron service
USER_NAME                        Name of user account with admin privileges
USER_PASSWORD                    Password of user account with admin privileges
DOMAIN_NAME                      Domain to use for testing
PROJECT_NAME                     Tenant to use for testing
SERVER_NAME                      The name given to the servers created during testing
IMAGE_REF                        The image ID to use for compute testing
FLAVOR_REF                       The flavor ID to use for compute testing
PUBLIC_NETWORK                   The network ID of a public network to use for compute testing
PRIVATE_NETWORK                  The network ID of a private network to use for compute testing
===============================  ======================================================================================================================================

Hints
-----
In order for the SSH test to work, you may need to consider the following:
* If you are running devstack in a VM, you have to execute the robot test suite from within your VM.
* By default the security groups in devstack do not allow ssh traffic.  You need to add the rule to allow ssh traffic.
