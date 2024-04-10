
import 'package:equatable/equatable.dart';

abstract class HomeState extends Equatable{
  @override

  List<Object?> get props => [];
}

class HomeInit extends HomeState{


}

class HomeLoading extends HomeState{

}

class HomeLoaded extends HomeState{


}

class HomeError extends HomeState{

  final error;

  HomeError(this.error);

}