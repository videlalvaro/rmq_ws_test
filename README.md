# rmq_ws_test #

Sample project that shows a simple HTML page that gets messages via Websockets from RabbitMQ.

If you have the [RabbitMQ Websockets Plugin](https://github.com/videlalvaro/rabbitmq-websockets) enabled, then you just need to server the files that are inside the `priv/www` of this project. You can do so with any web server, it doesn't have to be in Erlang.

This project uses [Misultin](https://github.com/ostinelli/misultin) to server such folder.

# Build #

    $ git clone git://github.com/videlalvaro/rmq_ws_test.git
    $ cd rmq_ws_test
    $ make

## Usage ##

    $ ./start-dev.sh

Then point your browser to [http://localhost:8081](http://localhost:8081).

Send messages to the fanout exchange using the helpers from the [RabbitMQ Websockets Plugin](https://github.com/videlalvaro/rabbitmq-websockets/blob/master/src/rabbit_websockets_util.erl):

    rabbit_websockets_util:publish_msg(<<"amq.fanout">>, <<"Hello Websockets!">>, <<"">>).

## License ##

See LICENSE.md
