import 'package:shelf/shelf.dart';
import 'package:shelf/shelf_io.dart' as shelf_io;
import './commands.dart' as commands;
import './html.dart' as html;

void run() async {
  final handler = const Pipeline().addHandler(_guiResponse);
  shelf_io
    .serve(handler, 'localhost', 6969)
    .then((x) => print('http://localhost:6969'));
}

Response _guiResponse(Request request) {
  var command = <String>[];
  command.addAll(request.requestedUri.queryParameters.values);
  if (command.length > 0) {
    commands.cliStuff(command);
  }
  return Response
    .ok(html.assemblePage())
    .change(
      headers: {
        'content-type': 'text/html; charset=utf-8'
      });
}