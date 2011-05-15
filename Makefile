DEPS_DIR=deps
EBIN_DIR=ebin

all: compile

clean:
	rm -rf $(DEPS_DIR)
	rm -rf $(EBIN_DIR)

$(DEPS_DIR):
	rebar get-deps

compile: $(DEPS_DIR)
	rebar compile