all:

.PHONY: elisp

elisp: elisp/sieve.el
	emacs --script elisp/sieve.el

c: build/c-sieve
	./build/c-sieve

build/c-sieve: c/sieve.c
	mkdir -p build
	$(CC) -o build/c-sieve c/sieve.c -O2

clean:
	rm -rf build
