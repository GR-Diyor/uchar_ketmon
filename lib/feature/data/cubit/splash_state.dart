
import 'package:equatable/equatable.dart';

abstract class SplashState extends Equatable{
  @override

  List<Object?> get props => [];
}

class SplashInit extends SplashState{


}

class SplashLoading extends SplashState{


}

class SplashLoaded extends SplashState{


}

class SplashError extends SplashState{

  final error;

  SplashError(this.error);

}