import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  final String Message;

  const Failure(this.Message);

  @override
  List<Object?> get props => [Message];
}

class ServerFailure extends Failure {
  const ServerFailure(super.Message);
}

// class LocalError extends Failure{
//   const LocalError(super.Message);
//
// }
