TEMPLATE = subdirs
SUBDIRS = auto apicheck

test.CONFIG = recursive
test.recurse = $$SUBDIRS
test.depends = all
test.recurse_target = test

QMAKE_EXTRA_TARGETS += test
