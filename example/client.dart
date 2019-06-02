#!/usr/bin/env dart
import 'dart:io';
import 'package:rstream/controllers4server.dart';
import 'lib/rtypes.dart';

void main(List<String> args) {
  const host = 'localhost';
  const port = 9999;
  WebSocket.connect('ws://$host:$port').then((websocket) {
    final r$controllers = R$Controllers.withWebSocket(websocket, serializers);
    final sink = r$controllers['c2s'].sink;
    final stream = r$controllers['s2c'].stream;
    final p2 = Person((p) => p
      ..id = 2
      ..child = true
      ..firstName = 'margaret');
    sink.add(p2);
    sink.close();
    stream.listen((event) {
      print('received $event');
      websocket.close();
    });
  });
}
