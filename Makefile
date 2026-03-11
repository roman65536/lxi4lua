
CC=gcc
CFLAGS=-O3 -I. -Iliblxi/src/ -fpic `pkg-config --cflags lua53 libxml-2.0 libtirpc`

OBJ=lxilua.o lxi.o misc.o tcp.o vxi11.o mdns.o
OBJ_RPC=vxi11core_clnt.o  vxi11core_xdr.o
VPATH = liblxi/src/



%.o: %.c $(DEPS)
	$(CC) -c -o $@ $< $(CFLAGS)



lxit.so: $(OBJ) $(OBJ_RPC)
	gcc -shared -o $@ $^  -ltirpc -lxml2



clean:	$(OBJ) $(OBJ_RPC)
	rm $^
