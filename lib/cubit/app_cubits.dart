import 'package:bloc/bloc.dart';
import 'package:myapp/cubit/app_cubit_states.dart';
import 'package:myapp/model/data_model.dart';
import 'package:myapp/services/data_servies.dart';

class AppCubits extends Cubit<CubitStates> {
  AppCubits({required this.data}) : super(InitialState()){
    emit(WelcomeState());
  }
  final DataServices data;
  // ignore: prefer_typing_uninitialized_variables
  late final places;

  goFrontPage(){
    emit(WelcomeState());  
  }

  void getData() async {
    try{
      emit(LoadingState());
      places = await data.getInfo();
      emit(LoadedState(places));
    }
    // ignore: empty_catches
    catch(e){
      emit(LoadingState());
      places = await data.getInfo();
      emit(LoadedState(places));
    }
  }

  detailPage(DataModel data){
    emit(DetailState(data));
  }

  goHome(){
    emit(LoadedState(places));
  }
  
}
