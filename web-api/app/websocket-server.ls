require! {
  'events': EventEmitter
  'socket.io': socket-io
}


backend-to-frontend-messages = [
  'execute market buy error'
  'execute market sell error'
  'limit aggregate'
  'limit created'
  'current market price'
  'market price history'
  'order fulfilled'
]

frontend-to-backend-messages = [
  'create buy limit'
  'create sell limit'
  'get limit aggregate'
  'get current market price'
  'get market price history'
  'execute market buy'
  'execute market sell'
]


class WebsocketServer

  (@http-server) ->
    @backend-to-frontend-emitter = new EventEmitter

    @io = socket-io @http-server
    @io.on 'connection', @_on-socket-connect

    @_bind-backend-to-emitter-messages!


  _bind-backend-to-emitter-messages: ->
    backend-to-frontend-messages.map (message-name) ~>
      global.exorelay.register-handler message-name, (payload) ~>
        @backend-to-frontend-emitter.emit 'message', {message-name, payload}


  _bind-frontend-to-backend-messages: (socket) ->
    frontend-to-backend-messages.map (message-name) ->
      socket.on message-name, (payload) ->
        global.exorelay.send message-name, payload


  _bind-emitter-to-frontend-messages: (socket) ->
    @backend-to-frontend-emitter.on 'message', handler = ({message-name, payload}) ->
      socket.emit message-name, payload
    socket.on 'disconnect', ~>
      @backend-to-frontend-emitter.remove-listener 'message', handler


  _on-socket-connect: (socket) ~>
    @_bind-emitter-to-frontend-messages socket
    @_bind-frontend-to-backend-messages socket


module.exports = WebsocketServer
