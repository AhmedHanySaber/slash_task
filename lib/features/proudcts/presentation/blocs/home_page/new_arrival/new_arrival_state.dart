part of 'new_arrival_bloc.dart';

abstract class NewArrivalState extends Equatable {
  const NewArrivalState();

  @override
  List<Object> get props => [];
}

class NewArrivalInitial extends NewArrivalState {}

class NewArrivalLoading extends NewArrivalState {}

class NewArrivalLoaded extends NewArrivalState {
  final List<Product> products;

  const NewArrivalLoaded(this.products);

  @override
  List<Object> get props => [products];
}

class NewArrivalError extends NewArrivalState {
  final String message;

  const NewArrivalError(this.message);

  @override
  List<Object> get props => [message];
}
