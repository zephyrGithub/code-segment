####################################
#           open-t-api             #
#          author : chenxj         #
#        Date : 2012-7-17          #
####################################


#! /bin/bash

internal_api_home="/opt/api/workspace/twitter-internal-api-soa"
apps_home="/opt/api/deploy/apps/online/soa"
array=( 192.168.20.144 192.168.20.205 10.11.152.155 10.11.152.156 )
#array=( 10.11.152.155)
len=${#array[*]}

case $1 in 
  all)
	$0 build
    $0 scp
    $0 start
    ;;
  build)
	cd $internal_api_home
	git pull origin soa
	mvn -U clean -Dmaven.test.skip=true install assembly:assembly
	
	for file in `ls $apps_home/twitter-internal-api-0.0.1-dist.tar.gz`
    do
    date=`date +%Y%m%d%H%M%S`
    mv $file $file.$date
    done
    cp $internal_api_home/target/twitter-internal-api-0.0.1-dist.tar.gz $apps_home/ 
	;;
  scp)
    echo "scp files to remote server start..."
	for((i=0;i<len;i++)) {
		/usr/bin/scp $apps_home/twitter-internal-api-0.0.1-dist.tar.gz api@${array[i]}:/opt/api/deploy/apps/soa/internal_api/
	}
    echo "scp files to remote server end."
	;;
  start)
    echo "lauch remote server..."
	for((i=0;i<len;i++)) {
		/usr/bin/ssh  api@${array[i]} "sh /opt/api/deploy/bin/deploy_internal_api_soa.sh start;exit"
	}

    echo "lauch remote server finished..."
	;;
  restart)
    echo "lauch remote server..."
	for((i=0;i<len;i++)) {
		/usr/bin/ssh  api@${array[i]} "sh /opt/api/deploy/bin/deploy_internal_api_soa.sh restart;exit"
	}

    echo "lauch remote server finished..."
	;;
  stop)
	echo "stop service"
	for((i=0;i<len;i++)) {
		/usr/bin/ssh  api@${array[i]} "sh /opt/api/deploy/bin/deploy_internal_api_soa.sh stop; exit"
	}
	;;
 *)
	echo "usage: $0 {start|restart|stop}"
	exit 1
esac


