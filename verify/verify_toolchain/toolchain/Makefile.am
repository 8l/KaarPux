#
# KaarPux: http://kaarpux.kaarposoft.dk
#
# Copyright (C) 2013: Henrik Kaare Poulsen
#

#
# automake input for verify_toolchain
#

lib_LTLIBRARIES = libdeepthought.la
libdeepthought_la_SOURCES = deepthought.c

bin_PROGRAMS = toolchain toolcov ccstl

toolchain_SOURCES = toolchain.c
toolchain_LDADD = libdeepthought.la
toolchain_LDFLAGS = -liberty -static

toolcov_SOURCES = toolchain.c
toolcov_CFLAGS = -fprofile-arcs -ftest-coverage
toolcov_LDADD = libdeepthought.la
toolcov_LDFLAGS = -liberty -static

ccstl_SOURCES = ccstl.cc

