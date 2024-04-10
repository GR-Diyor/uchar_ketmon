
import 'package:equatable/equatable.dart';

abstract class GameState extends Equatable{
  @override

  List<Object?> get props => [];
}

class GameInit extends GameState{


}

class GameLoading extends GameState{

}

class GameLoaded extends GameState{

}

class GameError extends GameState{

  final error;

  GameError(this.error);

}