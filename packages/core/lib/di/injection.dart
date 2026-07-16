import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

final sl = GetIt.instance;

@InjectableInit.microPackage()
void initMicroPackage() {}

@module
abstract class RegisterModule {
  @lazySingleton
  Connectivity get connectivity => Connectivity();
}
