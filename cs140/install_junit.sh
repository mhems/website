#!/bin/bash

wget "http://search.maven.org/remotecontent?filepath=junit/junit/4.12/junit-4.12.jar"
wget "http://search.maven.org/remotecontent?filepath=org/hamcrest/hamcrest-core/1.3/hamcrest-core-1.3.jar"
echo 'Libraries fetched sucecssfully'

mkdir -p ~/lib
mv *junit-4.12.jar ~/lib/junit-4.12.jar
mv *hamcrest-core-1.3.jar ~/lib/hamcrest-core-1.3.jar

echo 'export CLASSPATH="~/lib/junit-4.12.jar:~/lib/hamcrest-core-1.3.jar:$CLASSPATH"' >> .bashrc
echo 'alias junit='"'"'java -cp $CLASSPATH:. org.junit.runner.JUnitCore'"'"           >> .bashrc
echo 'export PATH=$PATH:~/bin' >> .bashrc
echo; echo; echo;
echo '*********************************************'
echo 'Environment successfully configured for junit'
echo '*********************************************'
