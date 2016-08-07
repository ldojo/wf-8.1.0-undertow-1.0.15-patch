if [ -n "WILDFLY_HOME" ]; then
    echo "patching wildfly 8.1.0 in $WILDFLY_HOME";
    echo "making backup of $WILDFLY_HOME/modules/system/layers/base/io/undertow/servlet/main/undertow-servlet-1.0.15.Final.jar to $WILDFLY_HOME/modules/system/layers/base/io/undertow/servlet/main/undertow-servlet-1.0.15.Final.jar.backup";
    mv $WILDFLY_HOME/modules/system/layers/base/io/undertow/servlet/main/undertow-servlet-1.0.15.Final.jar $WILDFLY_HOME/modules/system/layers/base/io/undertow/servlet/main/undertow-servlet-1.0.15.Final.jar.backup
    wget https://github.com/ldojo/wf-8.1.0-undertow-1.0.15-patch/raw/master/undertow-servlet-1.0.15.Final.jar -P $WILDFLY_HOME/modules/system/layers/base/io/undertow/servlet/main/;
    echo "done.";
else 
  echo "WILDFLY_HOME is not set";
fi