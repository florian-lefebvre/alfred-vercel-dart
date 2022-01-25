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
        return Response.ok('Hello, from Dart v$version! ${req.requestedUri.path}');
      default:
        return Response.notFound("Page $url not found");
    }
  }
}
