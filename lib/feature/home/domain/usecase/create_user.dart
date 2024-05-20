import 'package:clean_architecture_using_bloc/core/usecase/usecase.dart';
import 'package:clean_architecture_using_bloc/core/utility/typedef.dart';
import 'package:clean_architecture_using_bloc/feature/home/domain/entity/user_entity.dart';
import 'package:clean_architecture_using_bloc/feature/home/domain/repository/home_repo.dart';

class UserCreateCase extends UseCaseWithParameter<void,UserData>{
  final HomeRepo repository;
  const UserCreateCase({required this.repository});

  @override
  ResultFuture call(params) async=> repository.createUser(params.userName, params.id, params.species);

}