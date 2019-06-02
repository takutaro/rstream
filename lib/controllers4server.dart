import 'dart:async';
import 'dart:io';
import 'package:built_value/serializer.dart';
import 'src/controllers.dart';

abstract class R$Controllers {
  factory R$Controllers(StreamSink socketsink, Stream socketstream, Serializers serializers) {
    return _R$Controllers(socketsink, socketstream, serializers);
  }
  factory R$Controllers.withWebSocket(WebSocket websocket, Serializers serializers) {
    return _R$Controllers(websocket, websocket, serializers);
  }
  StreamController operator [](String name);
}

class _R$Controllers extends R$ControllersBase implements R$Controllers {
  final StreamSink _socketsink;
  final Stream _socketstream;

  _R$Controllers(this._socketsink, this._socketstream, Serializers serializers) : super(serializers) {
    _socketstream?.listen((jsontext) => super.receiveFromSocket(jsontext));
  }
  factory _R$Controllers.withWebSocket(WebSocket websocket, Serializers serializers) {
    return _R$Controllers(websocket, websocket, serializers);
  }

  @override
  void sendToSocket(String jsontext) {
    _socketsink?.add(jsontext);
  }
}
