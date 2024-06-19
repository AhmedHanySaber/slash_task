part of 'new_arrival_bloc.dart';

abstract class NewArrivalEvent extends Equatable {
  const NewArrivalEvent();

  @override
  List<Object> get props => [];
}

class LoadNewArrivalProducts extends NewArrivalEvent {}
