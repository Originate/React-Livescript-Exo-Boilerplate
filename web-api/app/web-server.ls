require! {
  './websocket-server': WebsocketServer
  'body-parser'
  'cookie-parser'
  'events' : {EventEmitter}
  'express'
  'exprestive'
  'http'
  'jade'
  'method-override'
  'morgan' : logger
  'path'
  'rails-delegate' : {delegate, delegate-event}
}


class WebServer extends EventEmitter

  ->
    @app = express!
    @server = http.create-server @app
    new WebsocketServer @server

    # view engine setup
    @app.set 'views', path.join __dirname, 'views'
      ..set 'view engine', \jade

      ..use method-override '_method'
      ..use logger \dev
      ..use express.static path.join __dirname, 'public'
      ..use require '../webpack/middleware'
      ..use bodyParser.json!
      ..use bodyParser.urlencoded extended: false
      ..use cookieParser!

      ..use exprestive dependencies: global.exorelay

      ..use (req, res, next) ->   # route not found
        err = new Error 'Not Found'
        err.status = 404
        next err


    delegate \listen, from: @, to: @server
    delegate-event \listening \error, from: @server, to: @


  port: ->
    @server.address!port



module.exports = WebServer
