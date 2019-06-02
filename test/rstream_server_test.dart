import 'dart:async';
import 'dart:io';
import 'package:rstream/controllers4server.dart';
import 'package:test/test.dart';

void main() {
  group('controllers - ', () {
    setUp(() {});

    test('get stream', () async {
      final r$controllers = R$Controllers(null, null, null);
      final s1 = r$controllers['xxx'].stream;
      expect(s1, isNotNull);
      final s2 = r$controllers['xxx'].stream;
      expect(s1, s2);
      final s3 = r$controllers['ZZZ'].stream;
      expect(s1 != s3, isTrue);
    });

    test('get sink', () async {
      final r$controllers = R$Controllers(null, null, null);
      final c = r$controllers['xxx'];
      final s1 = c.sink;
      expect(s1, isNotNull);
      final s2 = c.sink;
      expect(s2, isNotNull);
      expect(s1 != s2, isTrue);
      c.close();
    });

    test('listen to the stream', () {
      final socket = StreamController<String>();
      final r$controllers = R$Controllers(socket.sink, null, null);
      final sink = r$controllers['xxx'].sink;
      r$controllers['xxx'].stream.listen((text) async {
        expect(text, 'hello');
        sink.close();
        socket.close();
      });
      sink.add('hello');
    });

    test('listen to the stream that like a WebSocket', () {
      final socket = StreamController<String>();
      final r$controllers = R$Controllers(socket.sink, null, null);
      final sink = r$controllers['xxx'].sink;
      socket.stream.listen((text) async {
        expect(text, '{"stream":"xxx", "rawdata":"hello"}');
        sink.close();
        socket.close();
      });
      sink.add('hello');
    });

    test('websocket', () async {
      const host = 'localhost';
      const port = 9999;
      final serverCompleter = Completer();
      final clientCompleter = Completer();
      String serverReceived;
      int clientReceived;
      HttpServer.bind(host, port).then((httpserver) async {
        final websocket = await httpserver.transform(WebSocketTransformer()).first;
        final r$controllers = R$Controllers.withWebSocket(websocket, null);
        final stream = r$controllers['c2s'].stream;
        final sink = r$controllers['s2c'].sink;
        stream.listen((text) async {
          serverReceived = text;
          sink.add(9);
          sink.close();
        });
        await clientCompleter.future;
        websocket.close();
        serverCompleter.complete();
      });
      WebSocket.connect('ws://$host:$port').then((websocket) async {
        final r$controllers = R$Controllers.withWebSocket(websocket, null);
        final sink = r$controllers['c2s'].sink;
        final stream = r$controllers['s2c'].stream;
        stream.listen((text) async {
          clientReceived = text;
          clientCompleter.complete();
        });
        sink.add('"hello\\"');
        sink.close();
      });
      await serverCompleter.future;
      expect(serverReceived, '"hello\\"');
      expect(clientReceived, 9);
    });
  });
}
