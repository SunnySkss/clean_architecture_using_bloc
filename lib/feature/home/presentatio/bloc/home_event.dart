import 'package:equatable/equatable.dart';

abstract class HomeUserEvent extends Equatable{
  const HomeUserEvent();
  @override
  List<Object> get props => [];
}

class HomeUserInitiated extends HomeUserEvent{
}
class HomeUserLoadingEvent extends HomeUserEvent{
  const HomeUserLoadingEvent();
}