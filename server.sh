#!/bin/sh
case $1 in

	build)
	docker build -t bouiboui/php7-nginx ${PWD}
	;;

	clean)
	docker rm -f $(docker ps -a -q)
	docker rmi -f $(docker images -a | grep "^<none>" | awk '{print $3}')
	;;

	mount)
	ln -s $2 ${PWD}/web
	;;

	start)
	docker run \
		--name php7-nginx \
		-v ${PWD}/web:/data/web \
		-d bouiboui/php7-nginx
	;;

	stop)
	docker rm -f php7-nginx
	;;

	*)
	echo "build, clean, mount, start or stop"
	;;
esac
