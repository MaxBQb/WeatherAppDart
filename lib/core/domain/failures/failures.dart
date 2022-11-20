import 'package:equatable/equatable.dart';

abstract class Failure with FailureMessage, EquatableMixin {}

class ServerFailure extends Failure {
  @override
  List<Object?> get props => [];
}

class SocketFailure extends Failure {
  @override
  List<Object?> get props => [];
}

class UnexpectedFailure extends Failure {
  @override
  List<Object?> get props => [];
}

class NoSavedLocationFailure extends Failure {
  @override
  List<Object?> get props => [];
}

class LocationFailure extends Failure {
  String message;
  LocationFailure(this.message);
  @override
  List<Object?> get props => [];
}

mixin FailureMessage {
  String getMessage() {
    if (this is ServerFailure) {
      return 'Ошибка сервера';
    } else if (this is SocketFailure) {
      return 'Проблемы с интернет-соединением';
    } else if (this is LocationFailure) {
      return (this as LocationFailure).message;
    } else if (this is NoSavedLocationFailure) {
      return 'Не указано местоположение. Пожалуйста, перейдите в настройки';
    } else {
      return 'Неизвестная проблема. Попробуйте еще раз';
    }
  }
}
