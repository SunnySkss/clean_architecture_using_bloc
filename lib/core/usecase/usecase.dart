
import 'package:clean_architecture_using_bloc/core/utility/typedef.dart';

abstract class UseCaseWithoutParameter<Type>{
  const UseCaseWithoutParameter();
  ResultFuture<Type> call();
}

abstract class UseCaseWithParameter<Type,Params>{
  const UseCaseWithParameter();
  ResultFuture<Type> call(Params params);
}