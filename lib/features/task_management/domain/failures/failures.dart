import 'package:equatable/equatable.dart';

/// Base class for all failures in the application
abstract class Failure extends Equatable {
  final String message;
  const Failure(this.message);

  @override
  List<Object?> get props => [message];
}

/// Failure for server/API related errors
class ServerFailure extends Failure {
  const ServerFailure(super.message);
}

/// Failure for cache/local storage related errors
class CacheFailure extends Failure {
  const CacheFailure(super.message);
}

/// Failure for database related errors
class DatabaseFailure extends Failure {
  const DatabaseFailure(super.message);
}

/// Failure for validation related errors
class ValidationFailure extends Failure {
  const ValidationFailure(super.message);
}

/// Failure for network connectivity issues
class NetworkFailure extends Failure {
  const NetworkFailure(super.message);
}
