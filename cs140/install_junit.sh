#!/bin/bash

wget "http://search.maven.org/remotecontent?filepath=junit/junit/4.12/junit-4.12.jar"
wget "http://search.maven.org/remotecontent?filepath=org/hamcrest/hamcrest-core/1.3/hamcrest-core-1.3.jar"
echo 'Libraries fetched sucecssfully.'

mkdir -p ~/bin ~/lib
mv *junit-4.12.jar ~/lib/junit-4.12.jar
mv *hamcrest-core-1.3.jar ~/lib/hamcrest-core-1.3.jar

echo 'export CLASSPATH=~/lib/junit-4.12.jar:~/lib/hamcrest-core-1.3.jar:$CLASSPATH' >> .bashrc
echo 'java -cp $CLASSPATH:. org.junit.runner.JUnitCore "$@"' > ~/bin/junit
chmod u+x ~/bin/junit
echo 'export PATH=$PATH:~/bin' >> .bashrc
echo '\n\n\n*********************************************'
echo 'Environment successfully configured for junit'
echo '*********************************************'
