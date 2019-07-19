FROM postgres:9.6-alpine
RUN  apk add --update git make gcc libc-dev openssl-dev \
					  postgresql-dev zlib-dev libxslt-dev\
					  linux-pam-dev libxml2-dev libedit-dev\
					  nfs-utils
RUN cd /tmp && \
	git clone https://github.com/2ndQuadrant/repmgr && \
	cd repmgr && \
	git checkout v4.3.0 && \
	./configure && make install && \
	rm -rf /tmp/repmgr

RUN apk del git make gcc libc-dev openssl-dev \
				postgresql-dev zlib-dev libxslt-dev\
				linux-pam-dev libxml2-dev libedit-dev

