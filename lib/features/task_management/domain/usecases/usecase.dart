import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../failures/failures.dart';

/// Base class for all use cases
/// UseCase represents a single unit of business logic
abstract class UseCase<T, Params> {
  Future<Either<Failure, T>> call(Params params);
}

/// Base class for use cases that don't require parameters
abstract class UseCaseNoParams<T> {
  Future<Either<Failure, T>> call();
}

/// No parameters class for use cases that don't need parameters
class NoParams extends Equatable {
  @override
  List<Object?> get props => [];
}
