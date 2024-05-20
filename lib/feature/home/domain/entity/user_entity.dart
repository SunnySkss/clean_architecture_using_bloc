import 'package:equatable/equatable.dart';

class UserData extends Equatable {
  final String userName;
  final String id;
  final String image;
  final String species;
  const UserData({required this.userName, required this.image, required this.species,required this.id});

  @override
  List<Object?> get props => [userName, id, image,species];
}
