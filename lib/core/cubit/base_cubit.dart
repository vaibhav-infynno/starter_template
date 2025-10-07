import 'package:flutter_bloc/flutter_bloc.dart';

import '../error/failure_mapper.dart';
import '../error/failures.dart';

abstract class BaseState {
  const BaseState();
}

class LoadingState extends BaseState {}

class SuccessState<T> extends BaseState {
  final T data;
  const SuccessState(this.data);
}

class ErrorState extends BaseState {
  final Failure failure;
  const ErrorState(this.failure);
}

class BaseCubit extends Cubit<BaseState> {
  BaseCubit() : super(LoadingState());

  Future<void> safeExecute<T>(Future<T> Function() fn) async {
    try {
      emit(LoadingState());
      final data = await fn();
      emit(SuccessState<T>(data));
    } catch (e) {
      emit(ErrorState(FailureMapper.mapException(e)));
    }
  }
}
