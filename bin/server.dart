import 'dart:convert';
import 'dart:io';

import 'package:args/args.dart';
import 'package:dotenv/dotenv.dart';
import 'package:kn_fit_api/app/core/config/application_config.dart';
import 'package:kn_fit_api/app/core/config/service_locator_config.dart';
import 'package:kn_fit_api/app/core/middlewares/cors/cors_middlewares.dart';
import 'package:kn_fit_api/app/core/middlewares/default_content_type/default_content_type.dart';
import 'package:kn_fit_api/app/core/middlewares/security/security_middleware.dart';
import 'package:shelf/shelf.dart' as shelf;
import 'package:shelf/shelf_io.dart' as io;
import 'package:shelf_router/shelf_router.dart';

const _hostname = 'localhost';
Future<void> main(List<String> args) async {
  final parser = ArgParser()..addOption('port', abbr: 'p');
  final result = parser.parse(args);

  load();

  final portStr = result['port'] ?? Platform.environment['PORT'] ?? '8080';
  final port = int.tryParse(portStr);

  if (port == null) {
    stdout.writeln('Could not parse port value "$portStr" into a number.');
    exitCode = 64;
    return;
  }

  final router = Router();
  router.get(
    '/health',
    (shelf.Request request) => shelf.Response.ok(
      jsonEncode({'up': 'true'}),
    ),
  );

  final appConfig = ApplicationConfig();
  await appConfig.loadConfigApplication(router);

  final handler = const shelf.Pipeline()
      .addMiddleware(CorsMiddlewares().handler)
      .addMiddleware(
        DefaultContentType('application/json;charset=utf-8').handler,
      )
      .addMiddleware(SecurityMiddleware(getIt.get()).handler)
      .addMiddleware(shelf.logRequests())
      .addHandler(router);

  final server = await io.serve(handler, _hostname, port);
  print('Serving at http://${server.address.host}:${server.port}');
}
