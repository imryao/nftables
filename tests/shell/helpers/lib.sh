#!/bin/bash

# contains utility functions commonly used in tests.

assert_pass()
{
	local ret=$?
	if [ $ret != 0 ]; then
		echo "FAIL: ${@}"
		if type -t assert_failout; then
			assert_failout
		fi
		exit 1
	else
		echo "PASS: ${@}"
	fi
}
assert_fail()
{
	local ret=$?
	if [ $ret == 0 ]; then
		echo "FAIL: ${@}"
		if type -t assert_failout; then
			assert_failout
		fi
		exit 1
	else
		echo "PASS: ${@}"
	fi
}
