-module(rmq_ws_test_rest).
-export([start_link/1, stop/0]).

-record(http_state, {req}).

%% start misultin http server
start_link(Port) ->
    misultin:start_link([{port, Port},
                         {loop, fun(Req) -> handle_http(#http_state{req=Req}) end}]).

%% stop misultin
stop() ->
    misultin:stop().

handle_http(#http_state{req=Req}=State) ->
    handle(Req:get(method), Req:resource([lowercase, urldecode]), State).

handle('HEAD', [], #http_state{req=Req}) ->
    Req:ok("");

handle('GET', [], #http_state{req=Req}) ->
    Req:file(filename:join(web_root(), "index.html"), [{"Content-Type", "text/html"}]);

handle('GET', ["index.html"], #http_state{req=Req}) ->
    Req:file(filename:join(web_root(), "index.html"), [{"Content-Type", "text/html"}]);

handle('GET',["favicon.ico"], #http_state{req=Req}) ->
    Req:file(filename:join(web_root(), "favicon.ico"), [{"Content-Type", "image/vnd.microsoft.icon"}]);

handle('GET', ["js", FileName], #http_state{req=Req}) ->
    Req:file(filename:join(js_root(), FileName), [{"Content-Type", "text/javascript"}]);

handle(_, _, #http_state{req=Req}) ->
    Req:ok([{"Content-Type", "text/plain"}], "Page not found.").

web_root() ->
    filename:join(code:priv_dir(rmq_ws_test), "www").

js_root() ->
    filename:join(web_root(), "js").