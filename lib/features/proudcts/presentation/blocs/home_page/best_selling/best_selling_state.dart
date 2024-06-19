part of 'best_selling_bloc.dart';

abstract class BestSellingState extends Equatable {
  const BestSellingState();

  @override
  List<Object> get props => [];
}

class BestSellingInitial extends BestSellingState {}

class BestSellingLoading extends BestSellingState {}

class BestSellingLoaded extends BestSellingState {
  final List<Product> products;

  const BestSellingLoaded(this.products);

  @override
  List<Object> get props => [products];
}

class BestSellingError extends BestSellingState {
  final String message;

  const BestSellingError(this.message);

  @override
  List<Object> get props => [message];
}