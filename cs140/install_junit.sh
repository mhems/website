#!/bin/bash

echo 'export CLASSPATH="/usr/share/java/junit.jar:$CLASSPATH"'              >> .bashrc
echo 'alias junit='"'"'java -cp .:$CLASSPATH org.junit.runner.JUnitCore'"'" >> .bashrc
echo 'Environment successfully configured for junit'
