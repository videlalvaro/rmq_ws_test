-module(rmq_ws_test).
-export([start/0, stop/0]).

start() ->
    application:start(rmq_ws_test).

stop() ->
    application:stop(rmq_ws_test).