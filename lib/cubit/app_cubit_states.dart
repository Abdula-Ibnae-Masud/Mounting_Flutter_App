import 'package:equatable/equatable.dart';
import 'package:myapp/model/data_model.dart';

abstract class CubitStates extends Equatable {
  
}

class InitialState extends CubitStates{
  @override
  // ignore: todo
  // TODO: implement props
  List<Object> get props => [];
  
}

class WelcomeState extends CubitStates{
  @override
  // ignore: todo
  // TODO: implement props
  List<Object> get props => [];
  
}

class LoadingState extends CubitStates{
  @override
  // ignore: todo
  // TODO: implement props
  List<Object> get props => [];
  
}

class LoadedState extends CubitStates{
  LoadedState(this.places);
  final List<DataModel> places;
  @override
  // ignore: todo
  // TODO: implement props
  List<Object> get props => [places];
  
}

class DetailState extends CubitStates{
  DetailState(this.places);
  final DataModel places;
  @override
  // ignore: todo
  // TODO: implement props
  List<Object> get props => [places];
  
}