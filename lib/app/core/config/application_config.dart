import 'package:dotenv/dotenv.dart' show load, env;
import 'package:get_it/get_it.dart';
import 'package:kn_fit_api/app/core/routers/router_configure.dart';
import 'package:shelf_router/shelf_router.dart';

import '../core.dart';
import 'database_connection_configuration.dart';
import 'service_locator_config.dart';

class ApplicationConfig {
  Future<void> loadConfigApplication(Router router) async {
    await _loadEnv();
    _loadDatabaseConfig();
    _configLogger();
    _loadDependencies();
    _loadRoutersConfigure(router);
  }

  Future<void> _loadEnv() async => load();

  void _loadDatabaseConfig() {
    final databaseConfig = DatabaseConnectionConfiguration(
      host: env['DATABASE_HOST'] ?? env['databaseHost']!,
      user: env['DATABASE_USER'] ?? env['databaseUser']!,
      port: int.tryParse(env['  '] ?? env['databasePort']!) ?? 0,
      password: env['DATABASE_PASSWORD'] ?? env['databasePassword']!,
      databaseName: env['DATABASE_NAME'] ?? env['databaseName']!,
    );

    GetIt.I.registerSingleton(databaseConfig);
  }

  void _configLogger() =>
      GetIt.I.registerLazySingleton<ILogger>(() => Logger());

  void _loadDependencies() => configureDependencies();

  void _loadRoutersConfigure(Router router) =>
      RouterConfigure(router).configure();
}
