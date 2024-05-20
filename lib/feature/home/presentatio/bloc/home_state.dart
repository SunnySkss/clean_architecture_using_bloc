import 'package:clean_architecture_using_bloc/feature/home/domain/entity/user_entity.dart';
import 'package:equatable/equatable.dart';
enum HomeStates{
  initial, loading, loaded, error
}
 class HomeUserState extends Equatable{
  const HomeUserState({
    this.characterList = const[],
    this.pageIndexValue=0,
    this.currentState = HomeStates.initial
});
  final List<UserData> characterList;
  final HomeStates currentState;
  final int pageIndexValue;
  HomeUserState copyWith({int?nextIndex, HomeStates?state,List<UserData>?list}){
    return HomeUserState(
      characterList: list ?? this.characterList,
      pageIndexValue: nextIndex ?? this.pageIndexValue,
      currentState: state ?? this.currentState
    );
  }

  @override
  List<Object> get props => [currentState,characterList,pageIndexValue];
}
