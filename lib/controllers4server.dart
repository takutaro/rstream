import 'dart:async';
import 'dart:io';
import 'package:built_value/serializer.dart';
import 'src/controllers.dart';

class R$Controllers extends $R$Controllers {
  final StreamSink _socketsink;
  final Stream _socketstream;

  R$Controllers(this._socketsink, this._socketstream, Serializers serializers) : super(serializers) {
    _socketstream?.listen((jsontext) => super.receiveFromSocket(jsontext));
  }
  factory R$Controllers.withWebSocket(WebSocket websocket, Serializers serializers) {
    return R$Controllers(websocket, websocket, serializers);
  }

  @override
  void sendToSocket(String jsontext) {
    _socketsink?.add(jsontext);
  }
}
