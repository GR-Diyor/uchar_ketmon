
import 'package:equatable/equatable.dart';

abstract class SplashState extends Equatable{

}

class SplashInit extends SplashState{
  @override

  List<Object?> get props => [];

}

class SplashLoading extends SplashState{
  @override

  List<Object?> get props => [];

}

class SplashLoaded extends SplashState{
  @override

  List<Object?> get props => [];

}

class SplashError extends SplashState{

  final error;

  SplashError(this.error);

  @override

  List<Object?> get props => [];
}