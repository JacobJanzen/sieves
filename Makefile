all:

.PHONY: elisp

elisp: elisp/sieve.el
	emacs --script elisp/sieve.el
