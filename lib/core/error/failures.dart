abstract class Failure {
  final List properties;

  Failure([this.properties = const <dynamic>[]]);
}

// General failures
class ServerFailure extends Failure {}
class CacheFailure extends Failure {}
