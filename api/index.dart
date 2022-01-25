import 'dart:convert';
import 'dart:io' show Platform;
import 'package:shelf/shelf.dart';

Future<Response> handler(Request req) async {
  return await Router.handle(req, req.requestedUri.path);
}

class Router {
  const Router._();

  static Future<Response> handle(Request req, String url) async {
    switch (url) {
      case "/":
        final version = Platform.version.split(" ").first;
        return Response.ok('Hello, from Dart v$version!');
      case "/json":
        return Response.ok(json.encode(<String, dynamic>{"key": "value", "test": 3}),
            headers: {"content-type": "application/json"});
      case "/html":
        return Response.ok("<html><body><h1>Hello, from Dart!</h1></body></html>",
            headers: {"content-type": "text/html"});
      default:
        return Response.notFound("Page $url not found");
    }
  }
}
