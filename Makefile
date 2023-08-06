SOURCES := $(shell find fnl/ -name '*.fnl')
OBJECTS := $(patsubst fnl/%.fnl, lua/%.lua, $(SOURCES))

.PHONY: all clean

all: $(OBJECTS) 

clean:
	rm -rf lua

lua/%.lua: fnl/%.fnl
	mkdir -p $(dir $@)
	fennel --compile $< > $@
