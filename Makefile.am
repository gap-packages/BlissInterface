#
# BlissInterface: Line by line BlissInterface and code coverage for GAP
#
# This file is part of the build system of a GAP kernel extension.
# Requires automake.
#
ACLOCAL_AMFLAGS = -I m4

BlissInterface_INCLUDE = -I$(top_srcdir)/extern/

BINARCHDIR = bin/$(GAPARCH)
GAPINSTALLLIB = $(abs_top_srcdir)/$(BINARCHDIR)/BlissInterface.so

lib_LTLIBRARIES = BlissInterface.la

pkginclude_HEADERS = extern/bliss-0.73/graph.hh
pkginclude_HEADERS += extern/bliss-0.73/partition.hh
pkginclude_HEADERS += extern/bliss-0.73/orbit.hh
pkginclude_HEADERS += extern/bliss-0.73/heap.hh
pkginclude_HEADERS += extern/bliss-0.73/timer.hh

BlissInterface_la_SOURCES = src/BlissInterface.cc 
BlissInterface_la_SOURCES += extern/bliss-0.73/graph.cc 
BlissInterface_la_SOURCES += extern/bliss-0.73/partition.cc
BlissInterface_la_SOURCES += extern/bliss-0.73/orbit.cc 
BlissInterface_la_SOURCES += extern/bliss-0.73/heap.cc
BlissInterface_la_SOURCES += extern/bliss-0.73/timer.cc

pkginclude_HEADERS += extern/bliss-0.73/defs.hh
pkginclude_HEADERS += extern/bliss-0.73/uintseqhash.hh
pkginclude_HEADERS += extern/bliss-0.73/utils.hh

BlissInterface_la_SOURCES += extern/bliss-0.73/defs.cc 
BlissInterface_la_SOURCES += extern/bliss-0.73/uintseqhash.cc
BlissInterface_la_SOURCES += extern/bliss-0.73/utils.cc

BlissInterface_la_CPPFLAGS = $(GAP_CPPFLAGS)
BlissInterface_la_CFLAGS = $(GAP_CFLAGS)
BlissInterface_la_LDFLAGS = $(GAP_LDFLAGS) -module -avoid-version
if SYS_IS_CYGWIN
BlissInterface_la_LDFLAGS += -no-undefined -version-info 0:0:0 -Wl,$(GAPROOT)/bin/$(GAPARCH)/gap.dll
endif

all-local: BlissInterface.la
	$(mkdir_p) $(top_srcdir)/$(BINARCHDIR)
if SYS_IS_CYGWIN
	cp .libs/BlissInterface.dll $(GAPINSTALLLIB)
else
	cp .libs/BlissInterface.so $(GAPINSTALLLIB)
endif
	@echo "SUCCESS!"

distclean-local:
	rm -rf bin/*
	(cd doc ; ./clean)

.PHONY: doc

doc:
	($(GAPROOT)/bin/gap.sh -A makedoc.g)


