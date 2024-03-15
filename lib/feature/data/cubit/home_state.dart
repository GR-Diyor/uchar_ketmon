
import 'package:equatable/equatable.dart';

abstract class HomeState extends Equatable{

}

class HomeInit extends HomeState{
  @override

  List<Object?> get props => [];

}

class HomeLoading extends HomeState{
  @override

  List<Object?> get props => [];

}

class HomeLoaded extends HomeState{
  @override

  List<Object?> get props => [];

}

class HomeError extends HomeState{

  final error;

  HomeError(this.error);

  @override

  List<Object?> get props => [];
}