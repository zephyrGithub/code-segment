#! /bin//ash
APP_DEPLOY_HOME=/opt/api/webapp
GINKGO_HOST=10.11.157.26

#### Set CLASSPATH ########################
case $1 in
  start|restart)
  #start)
rm -rf $APP_DEPLOY_HOME/twitter-open-push-reply/classes
rm -rf $APP_DEPLOY_HOME/twitter-open-push-reply/lib
tar xvf $APP_DEPLOY_HOME/twitter-open-push-reply-1.0-SNAPSHOT-dist.tar.gz -C $APP_DEPLOY_HOME/twitter-open-push-reply
;;
esac

CLASSPATH=$APP_DEPLOY_HOME/twitter-open-push-reply/classes
for i in $APP_DEPLOY_HOME/twitter-open-push-reply/lib/*.jar
do
    CLASSPATH="$i:$CLASSPATH"
done

#### Start The Server ######################
case $1 in
 start)
exec "/usr/local/jdk/bin/java" -server -Xmx4096m -Xms4096m -Xmn800m -XX:PermSize=128m -XX:MaxPermSize=128m -Xnoclassgc -XX:+DisableExplicitGC -XX:CMSInitiatingOccupancyFraction=75 -XX:+UseCMSCompactAtFullCollection -XX:CMSFullGCsBeforeCompaction=10 -DlogDir=/opt/api/logs/reply -Dginkgo.client.host=$GINKGO_HOST -Dginkgo.client.whoami=InternalApi -Drmi.zk_env=api_online -Dginkgo.localcache=true -classpath $CLASSPATH com.sohu.twitter.open.push.reply.Main 1>>/opt/api/logs/reply/push-reply.log 2>>/opt/api/logs/reply/push-reply.err &
echo $! > /opt/api/twitter-open-push-reply.pid
;;
 stop)
kill `cat /opt/api/twitter-open-push-reply.pid`
;;
 restart)
kill `cat /opt/api/twitter-open-push-reply.pid`
sleep 2

exec "/usr/local/jdk/bin/java" -server -Xmx4096m -Xms4096m -Xmn800m -XX:PermSize=128m -XX:MaxPermSize=128m -Xnoclassgc -XX:+DisableExplicitGC -XX:CMSInitiatingOccupancyFraction=75 -XX:+UseCMSCompactAtFullCollection -XX:CMSFullGCsBeforeCompaction=10 -DlogDir=/opt/api/logs/reply -Dginkgo.client.host=$GINKGO_HOST -Dginkgo.client.whoami=InternalApi -Drmi.zk_env=api_online -Dginkgo.localcache=true -classpath $CLASSPATH com.sohu.twitter.open.push.reply.Main 1>>/opt/api/logs/reply/push-reply.log 2>>/opt/api/logs/reply/push-reply.err &
echo $! > /opt/api/twitter-open-push-reply.pid
;;
 *)
echo "Usage: $0 {start|stop|restart}"
exit 1
esac
