import 'dart:async';
import 'dart:convert';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

abstract class R$ControllersBase {
  final Map<String, StreamController> _controllers = {};
  final List<int> _sockrcvd = [];
  final Serializers _serializers;

  R$ControllersBase(this._serializers);

  StreamController operator [](String name) {
    final c1 = _controllers[name];
    if (c1 != null) return c1;
    // create new StreamController
    final c = _controllers[name] = StreamController.broadcast();
    c.stream.listen((event) {
      if (_sockrcvd.contains(event.hashCode)) {
        _sockrcvd.remove(event.hashCode);
      } else if (event is Built) {
        final jsontext = jsonEncode(_serializers.serialize(event));
        sendToSocket('{"stream":"$name", "rawdata":$jsontext}');
      } else if (event is String) {
        final jsontext = jsonEncode(event);
        sendToSocket('{"stream":"$name", "rawdata":$jsontext}');
      } else {
        sendToSocket('{"stream":"$name", "rawdata":$event}');
      }
    });
    return c;
  }

  void sendToSocket(String jsontext);

  void receiveFromSocket(String jsontext) {
    final jsonmap = jsonDecode(jsontext);
    final sink = this[jsonmap['stream']].sink; // ignore:close_sinks
    var event = jsonmap['rawdata'];
    if (event is Map) event = _serializers.deserialize(event);
    sink.add(event);
    _sockrcvd.add(event.hashCode);
  }

  Future<void> close() async {
    _controllers.values.forEach((c) async {
      await c.close();
    });
    _controllers.clear();
    _sockrcvd.clear();
  }
}
