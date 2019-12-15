#!/bin/bash
export SPRING_CONFIG_LOCATION=/opt/j/tahachi/application.properties
export DISPLAY=:0

. /home/afeltes/.sdkman/bin/sdkman-init.sh
sdk use java 11.ea.28-open
cd /opt/j/tahachi
java -jar tahachi-backend.jar 

