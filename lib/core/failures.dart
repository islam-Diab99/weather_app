abstract class Failure {
  final String message;
  const Failure(this.message);
}
class NetworkFailure extends Failure {
  const NetworkFailure() : super('No internet connection');
}

class ServerFailure extends Failure {
  const ServerFailure() : super('Server error occurred');
}

class NotFoundFailure extends Failure {
  const NotFoundFailure() : super('City not found');
}

class UnexpectedFailure extends Failure {
  const UnexpectedFailure(super.message);
}
