
%.beam: %.erl
	erlc -o test/ $<

all: deps
	@mkdir -p ebin
	@./rebar compile

deps:
	@rebar get-deps

check: test/etap.beam test/util.beam
	@prove test/*.t

check_verbose: test/etap.beam test/util.beam
	@prove -v test/*.t

clean:
	@./rebar clean
	@rm -f test/*.beam
