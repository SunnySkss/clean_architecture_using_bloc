import 'dart:convert';
import 'package:clean_architecture_using_bloc/core/utility/typedef.dart';
import 'package:clean_architecture_using_bloc/feature/home/domain/entity/user_entity.dart';

class UserModel extends UserData{
  const UserModel({required super.id,required super.image,
    required super.userName,required super.species});

  factory UserModel.fromJson(String json)=>
    UserModel.fromMap(jsonDecode(json) as DataMap);

  UserModel.fromMap(DataMap map):
      this(
          id: map["id"].toString(),
          userName:  map["name"].toString(),
          species : map["species"].toString(),
          image : map["image"].toString(),
      );

  DataMap toMap()=>   {
        "name":userName,
        "id":id,
        "species":species,
        "image":image,
  };

  UserModel copyWith({String? name,String?id,String?image, String?species}){
    return UserModel(
      userName: name ?? userName.toString(),
      id: id ?? this.id.toString(),
        image: image ?? this.image.toString(),
        species: species ?? this.species.toString(),
    );
  }
  String toJson()=>jsonEncode(toMap());
}