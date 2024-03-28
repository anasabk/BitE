OBJECTS = obj/stdgraph.o \
		  obj/BitE.o \
		  obj/test.o 

SEARCH_PATH = include

CFLAGS = -Wall -std=gnu17 -I$(SEARCH_PATH)
LINKFLAGS = -lm

ifdef DEBUG
  CFLAGS += -g -D WITH_DEBUG=1
else
  CFLAGS += -O3
endif

obj/%.o: src/%.c
	mkdir -p $(@D)
	gcc $(CFLAGS) -c $< -o $@ $(LINKFLAGS)

build: $(OBJECTS)
	gcc $(CFLAGS) $(OBJECTS) -o BitE $(LINKFLAGS)

clean:
	rm -rf obj BitE