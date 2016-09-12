#!/bin/bash

echo 'export CLASSPATH="/usr/share/java/junit.jar:/usr/share/java/hamcrest-core.jar:$CLASSPATH"' >> ~/.bashrc
echo 'alias junit='"'"'java -cp .:$CLASSPATH org.junit.runner.JUnitCore'"'" >> ~/.bashrc
echo 'Environment successfully configured for junit'
