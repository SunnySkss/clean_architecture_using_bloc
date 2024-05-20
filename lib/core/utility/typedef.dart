import 'package:clean_architecture_using_bloc/core/error/failures.dart';
import 'package:dartz/dartz.dart';

typedef ResultFuture<T> = Future<Either<Failure,T>>;
typedef ResultVoidType = Future<Either<Failure,void>>;

typedef DataMap = Map<String,dynamic>;
