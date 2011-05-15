#!/bin/sh
cd `dirname $0`
exec erl -sname rmq_ws_test -pa $PWD/ebin $PWD/deps/*/ebin -s rmq_ws_test
