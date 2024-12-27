part of 'home_bloc.dart';

@immutable
sealed class HomeEvent {}

class LoadHomeData extends HomeEvent {}

class ChangeYear extends HomeEvent {
  final String year;
  ChangeYear({required this.year});
}