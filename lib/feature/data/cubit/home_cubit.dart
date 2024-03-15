import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uchar_ketmon/feature/data/cubit/home_state.dart';

class HomeCubit extends Cubit<HomeState>{
  HomeCubit(): super(HomeInit());

}