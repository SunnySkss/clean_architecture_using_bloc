import 'package:clean_architecture_using_bloc/core/error/failures.dart';
import 'package:clean_architecture_using_bloc/core/utility/typedef.dart';
import 'package:clean_architecture_using_bloc/feature/home/data/datasource/home_remote_data_source.dart';
import 'package:clean_architecture_using_bloc/feature/home/domain/entity/user_entity.dart';
import 'package:clean_architecture_using_bloc/feature/home/domain/repository/home_repo.dart';
import 'package:dartz/dartz.dart'; 


class HomeRepoImplementation implements HomeRepo{
  HomeRepoImplementation(this._remoteDataSource);

  final HomeRemoteDataSource _remoteDataSource;
  
  @override
  ResultVoidType createUser(String userName, String userAge, String contact) {
    throw UnimplementedError();
  }

  @override
  ResultFuture<List<UserData>> getUserData({int page=0}) async{
    try{
      final result = await _remoteDataSource.getUser(page: page);
      print("result===$result");
      return Right(result);
    } on ApiError catch(e){
      return Left(ApiError.fromException(e));
    }
  }

}