.PHONY: clean

VERSION=0.002

src=./sources
build=./tools/build.py

dist_doc=README README.ar OFL.txt OFL-FAQ.txt NEWS NEWS.ar Makefile

all:
	@$(MAKE) -C $(src)

dist: all
	@echo "Making dist tarball"
	@mkdir -p amiri-$(VERSION)/{sources,web,tools}
	@cp -r $(src)/*.sfdir amiri-$(VERSION)/sources
	@cp $(dist_doc) amiri-$(VERSION)
	@cp $(build) amiri-$(VERSION)/tools
	@cp $(src)/*.ttf amiri-$(VERSION)
	@cp $(src)/*.{woff,eot,css} amiri-$(VERSION)/web
	@tar cfj amiri-$(VERSION).tar.bz2 amiri-$(VERSION)

clean:
	@$(MAKE) -C $(src) clean
	@rm -rf *.tar.bz2 amiri-$(VERSION)
