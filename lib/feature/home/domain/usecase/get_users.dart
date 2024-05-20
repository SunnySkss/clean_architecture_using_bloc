import 'package:clean_architecture_using_bloc/core/usecase/usecase.dart';
import 'package:clean_architecture_using_bloc/core/utility/typedef.dart';
import 'package:clean_architecture_using_bloc/feature/home/domain/entity/user_entity.dart';
import 'package:clean_architecture_using_bloc/feature/home/domain/repository/home_repo.dart';

class HomeGetUserUseCase extends UseCaseWithoutParameter<List<UserData>>{
  final HomeRepo _homeRepo;
  const HomeGetUserUseCase(this._homeRepo);


  @override
  ResultFuture<List<UserData>> call({int page=0}) async => await _homeRepo.getUserData(page: page);

}