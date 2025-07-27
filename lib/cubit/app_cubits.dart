import 'package:flutter_bloc/flutter_bloc.dart';

import '../model/data_model.dart';
import '../services/data_servies.dart';
import 'app_cubit_states.dart';

class AppCubits extends Cubit<CubitStates> {
  AppCubits({required this.data}) : super(InitialState()) {
    emit(WelcomeState());
  }
  final DataServices data;
  // ignore: prefer_typing_uninitialized_variables
  late final places;

  goFrontPage() {
    emit(WelcomeState());
  }

  void getData() async {
    try {
      emit(LoadingState());
      places = await data.getInfo();
      emit(LoadedState(places));
    }
    // ignore: empty_catches
    catch (e) {
      emit(LoadingState());
      places = await data.getInfo();
      emit(LoadedState(places));
    }
  }

  detailPage(DataModel data) {
    emit(DetailState(data));
  }

  goHome() {
    emit(LoadedState(places));
  }
}
