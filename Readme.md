Apache ActiveMQ 5.15.4 RPM for RedHat/CentOS 6

Couldn't find a public RPM of this version so I attempted to make my own. (First time)
This creates a directory /opt/activemq and places all files there (minus the demo/sample files)
Init script placed in /etc/init.d I manually defined ACTIVEMQ_HOME within the script.
activemq user created.

yum repo install:
yum install apache-activemq

Apache ActiveMQ puppet module
Manages firewall rules and log4j.properties file points logs to /var/log/activemq.

Make sure you have the ActiveMQ RPM in your yum repository.