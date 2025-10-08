import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:starter_app/core/connection/connection_checker.dart';

class InternetState with EquatableMixin {
  final bool isConnected;
  final ConnectivityResult? type;

  const InternetState.initial() : isConnected = false, type = null;
  const InternetState.connected(this.type) : isConnected = true;
  const InternetState.disconnected() : isConnected = false, type = null;

  @override
  List<Object?> get props => [isConnected, type];
}

class InternetCubit extends Cubit<InternetState> {
  final Connectivity _connectivity = GetIt.I<Connectivity>();
  final ConnectionChecker _connectionChecker = GetIt.I<ConnectionChecker>();
  late StreamSubscription<List<ConnectivityResult>> _subscription;

  InternetCubit() : super(const InternetState.initial()) {
    checkConnectivity();
    trackConnectivityChange();
  }

  Future<void> checkConnectivity() async {
    final isConnected = await _connectionChecker.isConnected;
    final result = await _connectivity.checkConnectivity();
    emit(
      isConnected
          ? InternetState.connected(
              result.firstOrNull ?? ConnectivityResult.none,
            )
          : const InternetState.disconnected(),
    );
  }

  void trackConnectivityChange() {
    _subscription = _connectivity.onConnectivityChanged.listen((result) async {
      final isConnected = await _connectionChecker.isConnected;
      emit(
        isConnected
            ? InternetState.connected(
                result.firstOrNull ?? ConnectivityResult.none,
              )
            : const InternetState.disconnected(),
      );
    });
  }

  @override
  Future<void> close() {
    _subscription.cancel();
    return super.close();
  }
}
