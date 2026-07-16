import 'dart:io';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:injectable/injectable.dart';

abstract interface class ConnectionChecker {
  Future<bool> get isConnected;
}

@Injectable(as: ConnectionChecker)
class ConnectionCheckerImpl implements ConnectionChecker {
  final Connectivity connectivity;

  ConnectionCheckerImpl(this.connectivity);

  @override
  Future<bool> get isConnected async {
    final result = await connectivity.checkConnectivity();
    if (result == ConnectivityResult.none) return false;

    // Optional but powerful: verify actual internet access
    try {
      final lookup = await InternetAddress.lookup('www.google.com');
      return lookup.isNotEmpty && lookup[0].rawAddress.isNotEmpty;
    } catch (_) {
      return false;
    }
  }
}
