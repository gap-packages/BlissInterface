#
# BlissInterface: Line by line BlissInterface and code coverage for GAP
#
# This file is part of the build system of a GAP kernel extension.
# Requires automake.
#
ACLOCAL_AMFLAGS = -I m4

BINARCHDIR = bin/$(GAPARCH)
GAPINSTALLLIB = $(abs_top_srcdir)/$(BINARCHDIR)/BlissInterface.so

lib_LTLIBRARIES = BlissInterface.la

BlissInterface_la_SOURCES = src/BlissInterface.cc src/bliss-0.73/graph.cc src/bliss-0.73/defs.cc src/bliss-0.73/orbit.cc src/bliss-0.73/partition.cc
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
