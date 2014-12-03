default: memcached
.PHONY: default



memcached/memcached/libmemcached.a:
	cd memcached && rm -rf memcached-1.4.20
	cd memcached && tar -zxf memcached-1.4.20.tar.gz
	cd memcached/memcached && patch thread.c ../thread.c.patch
	cd memcached/memcached && patch memcached.c ../memcached.c.patch
	cd memcached/memcached && ./configure
	cd memcached/memcached && sed -i -e 's/-O2 /-O2 -fPIC /' Makefile
	cd memcached/memcached && patch Makefile ../Makefile.patch
	cd memcached/memcached && make

memcached: memcached/memcached/libmemcached.a
