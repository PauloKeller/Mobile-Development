class AppState<T>{
  AppState._();
  factory AppState.success(T value) = SuccessState<T>;
  factory AppState.error(T msg) = ErrorState<T>;
}

class ErrorState<T> extends AppState<T> {
  ErrorState(this.msg) : super._();
  final T msg;
}

class SuccessState<T> extends AppState<T> {
  SuccessState(this.value) : super._();
  final T value;
}
