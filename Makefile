all: talk.pdf

# forced use of latexmk (which knows when to recompile ;-))
%.pdf: .FORCE
	mkdir -p cache
	latexmk -pdf -outdir=cache/ "$*.tex"
	cp "cache/$@" ./

clean:
	rm -rf cache

.FORCE:

.PHONY: clean
