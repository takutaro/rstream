import 'dart:html';
import 'package:built_value/serializer.dart';
import 'src/controllers.dart';

class R$Controllers extends $R$Controllers {
  final WebSocket _websocket;

  R$Controllers._(this._websocket, Serializers serializers) : super(serializers) {
    _websocket.onMessage.listen((jsondata) => receiveFromSocket(jsondata.data));
  }
  factory R$Controllers.withWebSocket(WebSocket websocket, Serializers serializers) {
    return R$Controllers._(websocket, serializers);
  }

  @override
  void sendToSocket(String jsontext) {
    _websocket.send(jsontext);
  }
}
