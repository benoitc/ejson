
%.beam: %.erl
	erlc -o test/ $<

all:
	@mkdir -p ebin
	@./rebar compile

check: test/etap.beam test/util.beam
	@prove test/*.t

check_verbose: test/etap.beam test/util.beam
	@prove -v test/*.t

clean:
	@./rebar clean
	@rm -f test/*.beam
