import 'package:injectable/injectable.dart';
import 'package:core/core.dart';
import 'injection.config.dart';

@InjectableInit(
  initializerName: 'init',
  asExtension: true,
  externalPackageModulesAfter: [
    ExternalModule(CorePackageModule),
  ],
)
Future<void> configureDependencies() async => sl.init();
