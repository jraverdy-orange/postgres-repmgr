#!/bin/sh
export VERSION=9.6-alpine

echo Building postgres-repmgr:${VERSION}

docker build --no-cache -t postgres-repmgr:${VERSION} . \
                --build-arg http_proxy=http://10.171.41.73:3128 \
		--build-arg HTTP_PROXY=http://10.171.41.73:3128 \
                --build-arg https_proxy=http://10.171.41.73:3128 \
		--build-arg HTTPS_PROXY=http://10.171.41.73:3128

echo Pushing last version on docker-hub
docker tag postgres-repmgr:${VERSION} jraverdyorange/postgres-repmgr:${VERSION}
docker tag jraverdyorange/postgres-repmgr:${VERSION} jraverdyorange/postgres-repmgr:latest
docker push jraverdyorange/postgres-repmgr
