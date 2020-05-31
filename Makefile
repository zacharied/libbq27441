AR = ar
CC = gcc
CFLAGS = -g -Wall -Werror
CFLAGS_LIB = -c

OBJ_NAME = libbq27441.o
LIB_NAME = libbq27441.a
TESTER_NAME = tester

SOURCES = bq27441.c
TESTER_SOURCES = tester.c
HEADERS = bq27441.h

LINK_DEPS = -li2c
TESTER_DEPS = -lbq27441

PREFIX ?= /usr/local

lib:
	$(CC) $(LINK_DEPS) $(CFLAGS) $(CFLAGS_LIB) $(SOURCES) -o $(OBJ_NAME)
	$(AR) rcs $(LIB_NAME) $(OBJ_NAME)

tester: lib
	$(CC) $(CFLAGS) $(LINK_DEPS) $(TESTER_SOURCES) $(LIB_NAME) -o $(TESTER_NAME)
	@echo 'Running tester at ./$(TESTER_NAME)' || (echo "Test failed..."; exit $$?)
	@echo 'Tests passed.'

install: lib
	cp $(LIB_NAME) $(PREFIX)/lib
	cp $(HEADERS) $(PREFIX)/include

uninstall:
	rm $(PREFIX)/lib/$(LIB_NAME)
	rm $(addprefix $(PREFIX)/include/, $(HEADERS))

clean:
	rm $(OBJ_NAME) $(LIB_NAME) $(TESTER_NAME)
