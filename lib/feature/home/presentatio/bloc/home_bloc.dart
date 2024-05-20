import 'dart:async';
import 'package:clean_architecture_using_bloc/feature/home/domain/usecase/get_users.dart';
import 'package:clean_architecture_using_bloc/feature/home/presentatio/bloc/home_event.dart';
import 'package:clean_architecture_using_bloc/feature/home/presentatio/bloc/home_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeBloc extends Bloc<HomeUserEvent, HomeUserState> {
  HomeBloc({required HomeGetUserUseCase homeGetUser})
      : _homeGetUserUseCase = homeGetUser,
        super(const HomeUserState()) {
    on<HomeUserLoadingEvent>(_getUserData);
  }

  final HomeGetUserUseCase _homeGetUserUseCase;

  Future<void> _getUserData(event, Emitter<HomeUserState> emit) async {

    emit(state.copyWith(state: HomeStates.loading,list: []));
    await Future.delayed(const Duration(seconds: 1));
    final result = await _homeGetUserUseCase(page: state.pageIndexValue);
    result.fold(
      (failure) => emit(state.copyWith(state: HomeStates.error)),
      (users) => emit(state.copyWith(
        state: HomeStates.loaded,
        list: List.of(state.characterList)..addAll(users),
        nextIndex: state.pageIndexValue+1
      )),
    );
    print("bloc called ${state.characterList.length}");
  }
}
