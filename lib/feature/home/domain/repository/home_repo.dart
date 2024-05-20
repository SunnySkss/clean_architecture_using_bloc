
import 'package:clean_architecture_using_bloc/core/utility/typedef.dart';
import 'package:clean_architecture_using_bloc/feature/home/domain/entity/user_entity.dart';

abstract class HomeRepo {
  const HomeRepo();
  ResultFuture<List<UserData>> getUserData({int page=0});
  ResultVoidType createUser(String userName,String userAge,String contact);
}