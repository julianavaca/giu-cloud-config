#!/bin/bash

export LIQUIBASE_HOME=~/liquidbase/

export CLASSPATH=custom_lib/ojdbc6.jar:$CLASSPATH

$LIQUIBASE_HOME/liquibase --driver=oracle.jdbc.driver.OracleDriver \
     --classpath=$CLASSPATH \
     --changeLogFile=$1/liquibase.xml \
     --url="jdbc:oracle:thin:@argalephdbd1:1521:ALEPHDBD1" \
     --username=admlf \
     --password=ariaxs01 \
     --logLevel=DEBUG \
     migrate
