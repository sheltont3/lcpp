# this is a demo test.
# who care about this?
# 


default: all
all: test doc


prepare:
	mkdir -p luadoc
clean:
	rm -rf luadoc
test:
	lua -e 'local lcpp = require("lcpp"); lcpp.test();'
test_file:
	lua -e 'lcpp = require("lcpp"); local out = lcpp.compileFile("resources/plugin.h", {UNICODE=1}); print(out);'

run:
	lua -e 'lcpp = require("lcpp"); print("### entered lcpp interactive mode ###")' -i
file:
	lua -e 'lcpp = require("lcpp"); local out = lcpp.compileFile("${FILE}"); print(out);'

# DOC
doc: luadoc
ldoc: luadoc
luadoc: prepare
	ldoc.lua ${PWD}
	cp resources/lua-logo-lcpp.png luadoc
