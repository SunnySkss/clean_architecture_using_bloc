import 'package:equatable/equatable.dart';

class Failure extends Equatable{
  final String message;
  final String statusCode;
  const Failure({required this.message,required this.statusCode});

  @override
  List<Object?> get props => [statusCode,message];
}
class ApiError extends Failure{
  const ApiError({required super.message,required super.statusCode});

  ApiError.fromException(ApiError exception)
      : this(message: exception.message, statusCode: exception.statusCode);
}