import 'dart:async';
import 'dart:html';
import 'package:built_value/serializer.dart';
import 'src/controllers.dart';

abstract class R$Controllers {
  factory R$Controllers.withWebSocket(WebSocket websocket, Serializers serializers) {
    return _R$Controllers.withWebSocket(websocket, serializers);
  }
  StreamController operator [](String name);
}

class _R$Controllers extends R$ControllersBase implements R$Controllers {
  final WebSocket _websocket;

  _R$Controllers._(this._websocket, Serializers serializers) : super(serializers) {
    _websocket.onMessage.listen((jsondata) => receiveFromSocket(jsondata.data));
  }
  factory _R$Controllers.withWebSocket(WebSocket websocket, Serializers serializers) {
    return _R$Controllers._(websocket, serializers);
  }

  @override
  void sendToSocket(String jsontext) {
    _websocket.send(jsontext);
  }
}
