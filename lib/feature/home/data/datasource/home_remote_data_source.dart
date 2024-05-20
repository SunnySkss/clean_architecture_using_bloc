import 'dart:convert';
import 'package:clean_architecture_using_bloc/core/error/failures.dart';
import 'package:clean_architecture_using_bloc/core/utility/constancts.dart';
import 'package:clean_architecture_using_bloc/feature/home/data/model/user_model.dart';
import 'package:http/http.dart' as http;

abstract class HomeRemoteDataSource{
  Future<List<UserModel>> getUser({int page=0});
}

class HomeRemoteDataSourceImpl implements HomeRemoteDataSource{
  const HomeRemoteDataSourceImpl(this._client);
  final http.Client _client;

  @override
  Future<List<UserModel>> getUser({int?page=0}) async{
    try{
      print(get_characters+page.toString());
      final response = await _client
          .get(Uri.parse(get_characters+page.toString()));
      if (response.statusCode != 200) {
        throw ApiError(
          message: response.body,
          statusCode: response.statusCode.toString(),
        );
      }
      return ( jsonDecode(response.body)["results"] as List)
          .map((userData) => UserModel.fromMap(userData))
          .toList();
    } on ApiError {
      rethrow;
    } catch(e) {
      throw ApiError(message: e.toString(), statusCode: 505.toString());
    }
  }
}
