import 'package:clean_architecture_using_bloc/feature/home/data/datasource/home_remote_data_source.dart';
import 'package:clean_architecture_using_bloc/feature/home/data/repo_imp/home_repo_implementation.dart';
import 'package:clean_architecture_using_bloc/feature/home/domain/repository/home_repo.dart';
import 'package:clean_architecture_using_bloc/feature/home/domain/usecase/get_users.dart';
import 'package:clean_architecture_using_bloc/feature/home/presentatio/bloc/home_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;

final sl = GetIt.instance;

Future<void> init() async {
    sl
    ..registerFactory(() => HomeBloc(
      homeGetUser: sl(),
     ))

      // Use cases
      ..registerLazySingleton(() => HomeGetUserUseCase(sl()))

      // Repositories
      ..registerLazySingleton<HomeRepo>(
      () => HomeRepoImplementation(sl()))

      // Data Sources
      ..registerLazySingleton<HomeRemoteDataSource>(
          () => HomeRemoteDataSourceImpl(sl()))

      // External Dependencies
      ..registerLazySingleton(http.Client.new);
}