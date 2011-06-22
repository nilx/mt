#!/bin/sh
#
# Test the code compilation and execution.

# Test the code correctness by computing 1024 pseudo-random numbers
# with a fixed initialization. The expected output is in the data
# folder.
_test_rand() {
    TEMPFILE=$(tempfile)
    example/rand 0 > $TEMPFILE
    test "0b832acf8e8ae5758b2cc280d97fcce0  $TEMPFILE" \
	= "$(md5sum $TEMPFILE)"
    rm -f $TEMPFILE
}

################################################

_log_init

echo "* default build, test, clean, rebuild"
_log make distclean
_log make
_log _test_rand
_log make
_log make clean
_log make

echo "* compiler support"
for CC in cc c++ gcc g++ tcc nwcc clang icc pathcc; do
    which $CC || continue
    echo "* $CC compiler"
    _log make distclean
    case $CC in
	"gcc"|"g++")
	    _log make CC=$CC ;;
	*)
	    _log make CC=$CC CFLAGS= ;;
    esac
    _log _test_rand
done

_log make distclean

_log_clean
