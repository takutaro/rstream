#!/usr/bin/env dart
import 'dart:io';
import 'package:rstream/controllers4server.dart';
import 'lib/rtypes.dart';

void main(List<String> args) {
  const host = 'localhost';
  const port = 9999;
  HttpServer.bind(host, port).then((httpserver) async {
    final websocket = await httpserver.transform(WebSocketTransformer()).first;
    final r$controllers = R$Controllers.withWebSocket(websocket, serializers);
    final stream = r$controllers['c2s'].stream;
    stream.listen((event) async {
      print('received $event');
      final sink = r$controllers['s2c'].sink;
      final p1 = Person((p) => p
        ..id = 1
        ..child = false
        ..firstName = 'hanako');
      sink.add(p1);
      sink.close();
    });
    await websocket.done;
    websocket.close();
    httpserver.close();
  });
}
