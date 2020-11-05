#!/bin/bash

ROOT_DIR="/Users/QiuMi/Code/Framework/ServiceFrame"
MODULE="$1"
PROPERTIES_FILE="$2"

echo
echo "###############################################################"
echo "############### $MODULE start ##################"
echo "###############################################################"

    ## 编译
    echo
    echo "---- package $MODULE ----"
    cd $MODULE

    /Library/Java/JavaVirtualMachines/jdk1.8.0_261.jdk/Contents/Home/bin/java -Dmaven.multiModuleProjectDirectory=$ROOT_DIR/$MODULE "-Dmaven.home=/Applications/IntelliJ IDEA.app/Contents/plugins/maven/lib/maven3" "-Dclassworlds.conf=/Applications/IntelliJ IDEA.app/Contents/plugins/maven/lib/maven3/bin/m2.conf" "-javaagent:/Applications/IntelliJ IDEA.app/Contents/lib/idea_rt.jar=60798:/Applications/IntelliJ IDEA.app/Contents/bin" -Dfile.encoding=UTF-8 -classpath "/Applications/IntelliJ IDEA.app/Contents/plugins/maven/lib/maven3/boot/plexus-classworlds-2.5.2.jar" org.codehaus.classworlds.Launcher -Didea.version=2018.1.7 package -f pom.xml

    cd ..

    ## 拷贝文件
    echo 
    echo "---- copy file $MODULE ----"
    ./copyfile.sh $MODULE/target/$MODULE-0.0.1-SNAPSHOT.jar /srv/framework/data/$MODULE.jar
    ./copyfile.sh $MODULE/src/main/resources/$PROPERTIES_FILE.properties /srv/framework/data/$MODULE.properties

    ## 启动服务
    echo 
    echo "---- docker restart $MODULE ----"
    ./docker-restart.sh $MODULE

echo
echo "###############################################################"
echo "############### $MODULE end ##################"
echo "###############################################################"

exit 1

