
import 'package:equatable/equatable.dart';

abstract class GameState extends Equatable{

}

class GameInit extends GameState{
  @override

  List<Object?> get props => [];

}

class GameLoading extends GameState{
  @override

  List<Object?> get props => [];

}

class GameLoaded extends GameState{
  @override

  List<Object?> get props => [];

}

class GameError extends GameState{

  final error;

  GameError(this.error);

  @override

  List<Object?> get props => [];
}